class Order < ApplicationRecord
  def tax
    tax = price * input_quantity * 0.09
    tax = tax.round / 100.0
  end 

  def total
    total = price * input_quantity + tax
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
      total: total
    }
  end
end
