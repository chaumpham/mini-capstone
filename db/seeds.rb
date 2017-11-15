# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new({name:"cat sitter", price:"$25", image:"http://101petsitting.com/wp-content/uploads/2012/11/CatsLotsLady.jpg", description:"feed your cat, clean up your cat's waste, change your cat's litter, play with your cat"})
product.save

product = Product.new({name:"dog walker", price:"$15", image:"http://www.noobpreneur.com/wp-content/uploads/2016/10/dog-walker.jpg", description:"walk your dog"})
product.save

product = Product.new({name:"baby sitter", price:"$10", image:"https://jokideo.com/wp-content/uploads/2013/08/Creepy-meme-The-new-babysitter.png", description:"can babysit your evilest child"})
product.save

product = Product.new({name:"pretend to be your girlfriend for a day", price:"$255", image:"https://pics.me.me/me-as-a-girlfriend-woutre-blocking-myviewg-21031624.png", description:"price does not include dinner, pickup/drop-off, tips, gifts, clothes, anything else"})
product.save