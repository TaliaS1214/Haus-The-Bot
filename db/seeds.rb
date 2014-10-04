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

house = House.create({name: "WDI TA Haus 902 Broadway", pin: "qwertyuiop"})

Item.create({
    name: "bananas",
    kind: "groceries",
    purchase_date: Date.new(2014, 10, 3),
    perishable?: true,
    bought?: true
  }
)

Item.create({
    name: "olive oil",
    kind: "groceries",
    purchase_date:  Date.new(2014, 9, 18),
    perishable?: false,
    bought?: true
  }
)

Item.create({
    name: "paper towel",
    kind: "household",
    perishable?: false,
    bought?: false
  }
)

Item.create({
    name: "toothpaste",
    kind: "household",
    purchase_date:  Date.new(2014, 8, 14),
    perishable?: false,
    bought?: false
  }
)

Item.create({
    name: "cereal",
    kind: "groceries",
    purchase_date:  Date.new(2014, 1, 9),
    perishable?: true,
    bought?: true
  }
)

Item.create({
    name: "milk",
    kind: "groceries",
    perishable?: true,
    bought?: false
  }
)

house.users << sean << jesse

for i in 1..6
  [sean, jesse].sample.items << Item.find(i)
  house.items << Item.find(i)
end
