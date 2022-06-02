class AddBankNameToCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :bank_name, :string
  end
end
