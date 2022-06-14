class CardsController < ApplicationController
  respond_to :html, :json
  before_action :set_card, only: %i[ show edit update destroy ]

  # GET /cards or /cards.json
  def index
    @cards = Card.all
    @cards = Card.where(card_type: params[:card_type])
    respond_to do |format|
      format.html
      format.csv { send_data @cards.to_csv, filename: "cards-#{Date.today}.csv" }
      format.json { render json: CardDatatable.new(params, view_context: view_context) }
    end
  end

  # def test
  #   @cards = Card.all
  #   format.json { render json: @cards.to_json }
  # end
 

  def import
    
    current_user.cards.import(params[:file])
    redirect_to root_url, notice: "Cards imported."
  end


  # GET /cards/1 or /cards/1.json
  def show
    @card = Card.find(params[:id])
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)

    if @card.save
      CardJob.perform_later(@card.user)
      # CardMailer.new_card_email(@card.user).deliver_now
      flash[:success] = "Thank you for your card! We'll get contact you soon!"
      redirect_to cards_path
    else
      flash.now[:error] = "Your card form had some errors. Please check the form and resubmit."
      render :new
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        CardMailer.update_card_email(@card.user).deliver_now
        format.html { redirect_to card_url(@card), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
     CardMailer.delete_card_email(@card.user).deliver_now
    
    @card.destroy
    respond_to do |format|
      CardJob.perform_later(@card.user)
      format.html { redirect_to cards_url, notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      
      @card = Card.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:name, :bank_name, :card_number, :cvc, :start_date, :end_date, :user_id, :card_type).merge(user: current_user)
    end
end
