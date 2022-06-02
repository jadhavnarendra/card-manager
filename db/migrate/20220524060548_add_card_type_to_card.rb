class AddCardTypeToCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :card_type, :integer
  end
end
