class BillingsController < ApplicationController
  before_action :set_billing, only: %i[ show edit update destroy ]
  before_action :card_billing, only: %i[ create new show edit update destroy ]

  # GET /billings or /billings.json
    def index
    @card = Card.find(params[:card_id])
     @billings = Billing.all

  end

  # GET /billings/1 or /billings/1.json
  def show
    @card = Card.find(params[:card_id])
  end

  # GET /billings/new
  def new
    @card = Card.find(params[:card_id])
    @billing = @card.billings.new
  end

  # GET /billings/1/edit
  def edit
    @card = Card.find(params[:card_id])
  end

  # POST /billings or /billings.json
  def create
    @card = Card.find(params[:card_id])
    @billing = @card.billings.new(billing_params)

    respond_to do |format|
      if @billing.save
        format.html { redirect_to card_billings_path, notice: "Billing was successfully created." }
        format.json { render :show, status: :created, location: @billing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billings/1 or /billings/1.json
  def update
    
    @card = Card.find(params[:card_id])
    respond_to do |format|
      if @billing.update(billing_params)
        format.html { redirect_to billing_url(@billing), notice: "Billing was successfully updated." }
        format.json { render :show, status: :ok, location: @billing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billings/1 or /billings/1.json
  def destroy
    @billing.destroy

    respond_to do |format|
      format.html { redirect_to billings_url, notice: "Billing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing
      @billing = Billing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def billing_params
      params.require(:billing).permit(:name, :card_number, :cvc, :postal_code, :valid_thru, :total_amount, :amount_paid, :due_amount, :product, :card_id)
    end

    def card_billing
      @card = Card.find(params[:card_id])
    end
end
