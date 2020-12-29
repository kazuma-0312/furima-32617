class Buy < ApplicationRecord
  has_one :home
  belongs_to :item
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :city
end
