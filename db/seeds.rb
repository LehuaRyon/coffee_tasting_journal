Coffee.find_or_create_by(user_id: 1, name: "Southern Weather", roaster: "Onyx Coffee Lab", producer: "East Africa & Latin America", variety: "Guatemala La Esperanza", process: "Washed", notes: "Milk chocolate, brown sugar, plum, candied nuts, walnut")
Coffee.find_or_create_by(user_id: 2, name: "Flying Monkey", roaster: "PT's Coffee", producer: "South America & Indonesia", variety: "Various", process: "Washed, natural/dry, pulped", notes: "Milk chocolate, graham cracker, honey")
Coffee.find_or_create_by(user_id: 3, name: "Flatlander", roaster: "PT's Coffee", producer: "South America", variety: "Various", process: "Washed, natural, pulped", notes: "Chocolate, tangerine, roasted almonds, caramel")
Coffee.find_or_create_by(user_id: 4, name: "Civitas Blend", roaster: "Huck", producer: "Latin America", variety: "Arabica", process: "Washed", notes: "Dark sugars, chocolate, toffee, nuttiness, ripe raisin")
Coffee.find_or_create_by(user_id: 5, name: "Blue Orchid Blend", roaster: "Huck", producer: "Peru & Brazil", variety: "Colombia", process: "Washed, natural/dry", notes: "Dark chocolate, caramel, roasted walnuts, floral")

User.create(username: "H_Brown", email: "harrybrown@gmail.com", password: "password", first_name: "Harry", last_name: "Brown")
User.create(username: "L_Smith", email: "leonasmith@gmail.com", password: "password", first_name: "Leona", last_name: "Smith")
User.create(username: "O_King", email: "owenking@gmail.com", password: "password", first_name: "Owen", last_name: "King")
User.create(username: "S_Lacey", email: "sofialacey@gmail.com", password: "password", first_name: "Sofia", last_name: "Lacey")
User.create(username: "J_Scott", email: "janscott@gmail.com", password: "password", first_name: "Jan", last_name: "Scott")

