# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



i1=Item.create{name:'Fish and Chips', description:"yummy fish and chips", type:"drop-off meal", price:70.15, date:"2020-07-16", allergens:"fish", delivery_date:"202/07/21"}

i2=Item.create{name:'Steak dinner', description:"steak with sides of beans", type:"drop-off meal", price:70.15, date:"2020-08-01", allergens:"none", delivery_date:"202/08/05"}

