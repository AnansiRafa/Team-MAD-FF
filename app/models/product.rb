class Product < ApplicationRecord
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}
  has_many :reviews

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.search(search)
    where("name ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%",)
  end

  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    price = "$" + format("%.2f", price_in_dollars)
end
end
