class Item < ApplicationRecor

  has_one_attached :image








  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :status
  belongs_to :city
  belongs_to :days
end
