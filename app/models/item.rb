class Item < ApplicationRecor

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price    
  end


  validates :category_id, :delivery_id, :status_id, :city_id, :days_id, numericality: { other_than: 1 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :status
  belongs_to :city
  belongs_to :days
end
