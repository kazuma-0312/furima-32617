class HomeBuy
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address, :city_id, :municipality, :street, :building

  with_options presence: true do
    validates :address, format: { with: /\A\d{3}-\d{4}\z/, message: "code Input correctly" }
    validates :city_id, numericality: { other_than: 1, message: "Select" }
    validates :municipality
    validates :street
    validates :number, format: { with: /\A\d{11}\z/, message: "Input only number" }
    validates :user_id
    validates :item_id
  end

  def save
    @buy = Buy.create(user_id: user_id, item_id: item_id)
    Home.create(address: address, city_id: city_id, municipality: municipality, street: street, number: number, building: building, buy_id: @buy.id)
  end
end  