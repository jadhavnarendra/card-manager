class Card < ApplicationRecord

  belongs_to :user
  has_many :billings

    
    validates :name, length: { maximum: 10 }
    validates :card_number, length: { maximum: 10 }
    validates :cvc, length: { maximum: 3 }

    enum card_type: [ :debit, :credit ]

    # card.published # scope Card.where(card_type: :debit)
    # card.published # scope Card.where(card_type: :credit)
    # enum card_type: {
    #   debit ,
    #   credit
    
    # }

    # scope :debit, -> { where ("card_type = :card_type")}
    # scope :credit, -> { where ("card_type = :card_type")}
    
    # scope :active, -> { where("card: 0") }
#       
#   validates_numericality_of :number, :only_integer => true
#   validates_presence_of :number, :expiration_date, :card_type
#   validates_uniqueness_of :number, :scope => 'account_id', :message => 'matches a credit card already on your account'
#   def validate
#     errors.add("number", "is not a #{card_type} or is invalid") unless number_valid? && number_matches_type?
#   end

#   def self.card_types
#     { 'Debit'             => 'debit',
#       'Credit'       => 'credit' }
#   end

#   def readable_card_type
#     (@@card_types ||= self.class.card_types.invert)[card_type]
#   end

#   def digits
#     @digits ||= number.gsub(/[^0-9]/, '')
#   end

#   def last_digits
#     digits.sub(/^([0-9]+)([0-9]{4})$/) { '*' * $1.length + $2 }
#   end

#   protected
#   def number_valid?
#     total = 0
#     digits.reverse.scan(/(\d)(\d){0,1}/) do |ud,ad|
#       (ad.to_i*2).to_s.each {|d| total = total + d.to_i} if ad
#       total = total + ud.to_i
#     end
#     total % 10 != 0
#   end

#   def number_matches_type?
#     digit_length = digits.length
#     case card_type
#     when 'debit'
#       [13,16].include?(digit_length) and number[0,1] == "4"
#     when 'credit'
#       digit_length == 16 and ("51" .. "55").include?(number[0,2])
#     # when 'amex'
#     #   digit_length == 15 and %w(34 37).include?(number[0,2])
#     # when 'discover'
#     #   digit_length == 16 and number[0,4] == "6011"
#     end
#   end


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
