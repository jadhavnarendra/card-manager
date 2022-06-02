require "csv"

namespace :import do

    desc "Import cards from csv"
    task cards: :environment do
       filename = File.join Rails.root, "cards.csv"
       counter = 0

      CSV.foreach("cards.csv", headers: true) do |row|
        p row
       
        # name, card_number, cvc, card_type, bank_name = row
        card = Card.create(name: name,  card_number: card_number, cvc: cvc, card_type: card_type, bank_name: bank_name)
        puts "#{name} - #{card.errors.full_messages.join(",")}" if card.errors.any?
        counter += 1 if card.persisted?
      
      puts "Imported #{counter} cards"
    end
    end
end