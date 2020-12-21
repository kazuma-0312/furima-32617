class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery
  belongs_to_active_hash :status
  belongs_to_active_hash :city
  belongs_to_active_hash :days

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price    
  end


  validates :category_id, :delivery_id, :status_id, :city_id, :days_id, numericality: { other_than: 1 } 

end
