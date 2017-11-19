class Product < ApplicationRecord
  def is_discounted
    price[0] =''
    if price.to_f < 25
      return true 
    else 
      return false
    end
  end 
  
  def tax
    tax = price.to_f * 0.09
    tax = tax.round / 100.0
  end 

  def total
    total = price.to_f + tax
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
