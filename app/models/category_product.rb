class CategoryProduct < ApplicationRecord
  belongs_to :category
  belongs_to :product
  # def product
  #   Product.find_by(id: self.product_id)
  # end
end
