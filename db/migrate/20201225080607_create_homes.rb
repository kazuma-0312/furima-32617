class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string  :address,   null: false
      t.integer  :city_id,   null: false
      t.string  :municipality,   null: false
      t.string  :street,   null: false
      t.string  :tell_number,   null: false
      t.string  :building,   null: false
      t.integer  :buy_id,   foreign_key: true
      t.timestamps
    end
  end
end
