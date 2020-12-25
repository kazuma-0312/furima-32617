class CreateHomeBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :home_buys do |t|

      t.timestamps
    end
  end
end
