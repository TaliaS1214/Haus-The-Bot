# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

j = {
  handle: "jemise111",
  password: "abc12345"
}

s = {
  handle: "talias432",
  password: "12345abc"
}

jesse = User.create(j)
sean = User.create(s)

house = House.create({name: "WDI TA Haus 902 Broadway"})
items = []

items.push(Item.create({
    name: "bananas",
    kind: "groceries",
    purchase_date: Date.new(2014, 10, 3),
    perishable: true,
    bought: true
  })
)

items.push(Item.create({
    name: "olive oil",
    kind: "groceries",
    purchase_date:  Date.new(2014, 9, 18),
    perishable: false,
    bought: true
  })
)

items.push(Item.create({
    name: "paper towel",
    kind: "household",
    purchase_date: Date.new(2014, 9, 18),
    perishable: false,
    bought: false
  })
)

items.push(Item.create({
    name: "toothpaste",
    kind: "household",
    purchase_date:  Date.new(2014, 8, 14),
    perishable: false,
    bought: false
  })
)

items.push(Item.create({
    name: "cereal",
    kind: "groceries",
    purchase_date:  Date.new(2014, 1, 9),
    perishable: true,
    bought: true
  })
)

items.push(Item.create({
    name: "milk",
    kind: "groceries",
    perishable: true,
    bought: false
  })
)

items.push(Item.create({
    name: "butter",
    kind: "groceries",
    purchase_date: Date.new(2014, 9, 8),
    perishable: true,
    bought: true
  })
)

items.push(Item.create({
    name: "salad",
    kind: "groceries",
    purchase_date: Date.new(2014, 9, 29),
    perishable: true,
    bought: true
  })
)

items.push(Item.create({
    name: "bread",
    kind: "groceries",
    purchase_date: Date.new(2014, 9, 22),
    perishable: true,
    bought: true
  })
)

items.push(Item.create({
    name: "trash bags",
    kind: "household",
    purchase_date: Date.new(2014, 7, 2),
    perishable: false,
    bought: true
  })
)

items.push(Item.create({
    name: "lottery tickets",
    kind: "household",
    purchase_date: Date.new(2014, 8, 8),
    perishable: false,
    bought: true
  })
)

items.push(Item.create({
    name: "candles",
    kind: "household",
    purchase_date: Date.new(2014, 5, 20),
    perishable: false,
    bought: false
  })
)

items.push(Item.create({
    name: "InboxTheApp Stickers",
    kind: "household",
    purchase_date: Date.new(2014, 10, 4),
    perishable: false,
    bought: true
  })
)

items.push(Item.create({
    name: "sour cream",
    kind: "groceries",
    purchase_date: Date.new(2002, 3, 14),
    perishable: true,
    bought: true
  })
)

house.users << sean << jesse

items.each do |item|
  [sean, jesse].sample.items << item
  sean.house.items << item
end
