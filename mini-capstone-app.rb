require "unirest"
require "pp"

while true
  system "clear"
  puts "Welcome to the Mini Capstone Create App!  Please select an option:"
  puts "Option [1]: View all products"
  puts "Option [1.1]: Search for a product by name"
  puts "Option [1.2]: Sort all products by price"
  puts "Option [2]: Create a new product"
  puts "Option [3]: View a specific product"
  puts "Option [4]: Update a specific product"
  puts "Option [5]: Delete a specific product"
  puts "Option [6]: Order a product"
  puts "Option [7]: Add products to Cart"
  puts "Option [8]: View Shopping Cart"
  puts
  puts "Option [signup]: Create a user"
  puts "Option [login]: Create a JSON web token"
  puts "Option [logout]: create the JSON wweb token"
  input_option = gets.chomp

  if input_option == "1"
    response = Unirest.get("http://localhost:3000/v1/products")
    product = response.body
    pp product
  elsif input_option == "1.1"
    puts "Search product name:"
    input_search = gets.chomp
    puts "Here are the matching results:"
    response = Unirest.get("http://localhost:3000/v1/products?search=#{input_search}")
    product = response.body
    pp product
  elsif input_option == "1.2"
    puts "Here are the products sorted by price"
    response = Unirest.get("http://localhost:3000/v1/products?sort_by_price=true")
    product = response.body
    pp product
  elsif input_option == "2"
    params = {}
    puts "Enter the product name:"
    params["input_name"] = gets.chomp
    puts "Enter the price:"
    params["input_price"] = gets.chomp
    puts "Enter the image:"
    params["input_image"] = gets.chomp
    puts "Enter the description:"
    params["input_description"] = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/products", parameters: params) 
    product = response.body 
    pp product
  elsif input_option == "3"
    puts "Enter the id of the product you would like to view:"
    input_product_id = gets.chomp
    response = Unirest.get("http://localhost:3000/v1/products/#{input_product_id}")
    product = response.body
    pp product
  elsif input_option == "4"
    params = {}
    puts "Enter the id of the product you would like to update:"
    input_product_id = gets.chomp
    puts "Enter the product new name:"
    params["input_name"] = gets.chomp
    puts "Enter a new price:"
    params["input_price"] = gets.chomp
    puts "Enter a new image:"
    params["input_image"] = gets.chomp
    puts "Enter a new description:"
    params["input_description"] = gets.chomp
    response = Unirest.patch("http://localhost:3000/v1/products/#{input_product_id}", parameters: params)
    product = response.body
    if product["errors"]
      puts "Oops! Bad request!"
      p product["errors"]
    else
      pp product
    end
  elsif input_option == "5"
    puts "Enter the id of the product you would like to delete:"
    input_product_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/v1/products/#{input_product_id}")
    product = response.body
    pp product

  elsif input_option == "signup"
    params = {}
    puts "Enter your name:"
    params[:name] = gets.chomp
    puts "Enter your email:"
    params[:email] = gets.chomp
    puts "Enter your password:"
    params[:password] = gets.chomp
    puts "Confirm your password :"
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/users/", parameters: params)
    pp response.body

  elsif  input_option == "login"
    params = {}
    puts "Email: "
    params[:email] = gets.chomp
    puts "Password: "
    params[:password] = gets.chomp 
    response = Unirest.post(
      "http://localhost:3000/user_token", 
      parameters: {auth: {email: params[:email], password: params[:password]}
      }
    )
    pp response.body

    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")

  elsif input_option == "6"
    params = {}
    print "Product id: "
    params[:input_product_id] = gets.chomp
    print "Quantity: "
    params[:input_quantity] = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/orders", parameters: params)
    order = response.body
    if order["errors"]
      puts "No good!"
      p order["errors"]
    else
      puts "All good!"
      pp order
    end 
  elsif input_option == "7"
    params = {}
    print "Product id:"
    params[:input_product_id] = gets.chomp
    print "Quantity: "
    params[:input_quantity] = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/carted_products", parameters: params)
    carted_products = response.body
    if carted_products["errors"]
      puts "No good!"
      p carted_products["errors"]
    else
      puts "All good!"
      pp carted_products
    end
  elsif input_option == "8"
    response = Unirest.get("http://localhost:3000/v1/carted_products")
    cart = response.body
    pp cart
  elsif input_option == "q"
    puts "Goodbye!"    
    break
  end
  puts "Press enter to continue"
  gets.chomp
end
