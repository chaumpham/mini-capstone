# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Supplier.create(name: "Amazon", email: "amazon@email.com", phone_number: "243222342")
Supplier.create(name: "Think Geek", email: "thinkgeek@email.com", phone_number: "5432534")

product = Product.new({supplier_id: 1, name:"cat sitter", price: 25, image:"http://101petsitting.com/wp-content/uploads/2012/11/CatsLotsLady.jpg", description:"feed your cat, clean up your cat's waste, change your cat's litter, play with your cat"})
product.save

product = Product.new({supplier_id: 1, name:"baby sitter", price: 10, image:"https://jokideo.com/wp-content/uploads/2013/08/Creepy-meme-The-new-babysitter.png", description:"can babysit your evilest child"})
product.save

product = Product.new({supplier_id: 2, name:"dog trainer", price: 90, image:"http://www.eastshorevet.com/wp-content/uploads/2017/04/Dog-training.jpg", description:"We use positive-reinforcement methods to teach the behaviors that are necessary for dogs working in public settings, and to train the specific tasks you need from the canine partner in your life."})
product.save

product = Product.new({supplier_id: 1, name:"dog walker", price: 90, image:"https://topdogtips.com/wp-content/uploads/2017/05/My-Top-7-Tips-on-How-to-Be-a-Successful-Dog-Walker-1021x580.jpg", description:"Dog walking is the act of a person walking with a dog, typically from the dog's residence and then returning. This constitutes part of the daily exercise regime needed to keep a dog healthy."})
product.save
