class Card < ApplicationRecord

  belongs_to :user
  has_many :billings

    
      validates :name, length: { maximum: 10 }
      validates :card_number, length: { maximum: 10 }
      validates :cvc, length: { maximum: 3 }

      enum card_type: [ :debit, :credit ]

      def card_chart
        cards = Card.all
      end

      def self.to_csv
        attributes = %w{ name card_number cvc start_date end_date card_type bank_name}
        
        CSV.generate(headers: true) do |csv|
          csv << attributes
          all.each do |card|
            csv << attributes.map{ |attr| card.send(attr) }
          end
        end
      end


      def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
          # current_user.create! row.to_hash
            current_scope.create row.to_hash
        end
      end
end
