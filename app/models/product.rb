class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :description, length: { in: 20..500 }

  has_many :category_products  
  has_many :orders
  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  # end

  has_many :users
  #has_many :orders
  has_many :carted_products


  def is_discounted
    if price < 25
      return true 
    else 
      return false
    end
  end 
  
  def tax
    tax = price * 0.09
    tax = tax.round / 100.0
  end 

  def total
    total = price + tax
  end 

  def as_json
    {
      id: id,
      name: name,
      description: description,
      image: image,
      price: price,
      is_discounted: is_discounted, 
      tax: tax,
      total: total,
      supplier: supplier.as_json
    }
  end
end