class CardDatatable < AjaxDatatablesRails::ActiveRecord
  

  delegate :params, :link_to, :cards, to: :@view

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      # id:          { source: "Card.id" },
      name:        { source: "Card.name", cond: :like, searchable: true, orderable: true },
      card_number: { source: "Card.card_number"},
      cvc:         { source: "Card.cvc" },
      start_date:  { source: "Card.start_date" },
      end_date:    { source: "Card.end_date" },
      card_type:   { source: "Card.card_type" },
      bank_name:   { source: "Card.bank_name" },
    }
  end


  def data
    records.map do |record|
      {
        # id:           record.id,
        name:         link_to(record.name, record),
        card_number:  record.card_number,
        cvc:          record.cvc,
        start_date:   record.start_date,
        end_date:     record.end_date,
        card_type:    record.card_type,
        bank_name:    record.bank_name,
        
      }
    end
  end


  def get_raw_records
    # insert query here
    Card.all
  end


  

  

end
