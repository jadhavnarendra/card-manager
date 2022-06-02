class AddCardToBilling < ActiveRecord::Migration[6.1]
  def change
    add_reference :billings, :card, foreign_key: true
  end
end
