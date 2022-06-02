json.extract! billing, :id, :name, :card_number, :cvc, :postal_code, :valid_thru, :total_amount, :amount_paid, :due_amount, :product, :created_at, :updated_at
json.url billing_url(billing, format: :json)
