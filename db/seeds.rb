# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Admin.create!(
    email: "b@b",
    password: "111111"
  )
  
 Genre.create!(
    name: "ケーキ"
 )
  
 Genre.create!(
    name: "クッキー"
 )
 
 Item.create!(
    name: "チョコレートケーキ",
    description: "チョコケーキです",
    no_tax_price: "500",
    genre_id: 1,
    is_active: [['販売中', true], ['販売停止', false]],
    image:File.open("app/assets/images/no_image.jpg")
 )
 
  
 Item.create!(
    name: "チョコレートクッキー",
    description: "チョコクッキーです",
    no_tax_price: "200",
    genre_id: 2,
    is_active: [['販売中', true], ['販売停止', false]],
    image:File.open("app/assets/images/no_image.jpg")
 )
 
 Address.create!(
   end_user_id: 1,
   name: "くらた",
   postal_code: "111222",
   address: "大分"
  )
  
  Address.create!(
   end_user_id: 1,
   name: "くらた　ゆみ",
   postal_code: "111333",
   address: "神奈川"
  )
#
 