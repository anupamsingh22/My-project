F1 = Food.create(name: "Spagetti bolognese",
                 category_id: 5,
                 description: "Yummy spagetti to increase your life span!",
                 price: 150,
                 restaurant_name:"baba ka dhaba",
                 sales: { price: 100.00, percentage: 25, status: true })

F2 = Food.create(name: "Entry drink",
                 description: "Nice mix of african special barbecue sauce",
                 category_id: 1,
                 price: 75,
                 restaurant_name:"baba ka dhaba",
                 status: "available")

F3 = Food.create(name: "Lobsters",
                 category_id: 2,
                 restaurant_name:"baba ka dhaba",
                 description: "Crispy sea food delicacy to make your holiday",
                 price: 120)

C1 = Category.create(title: "Entree",
                     description: "Home made food ready to eat")

C2 = Category.create(title: "Desserts",
                     description: "Finger-licking desserts")

U2 = User.create(first_name: "Jeff",
                 last_name: "Roberts",
                 email: "jr@yahoo.com",
                 password: "whatever",
                 restaurant_name:"Raju Bhai Thandai Wale",
                 password_confirmation: "whatever")

A1 = User.create(first_name: "Nadayar",
                 last_name: "Andela",
                 email: "nadayar@andela.com",
                 password: "nadayar",
                 password_confirmation: "nadayar",
                 restaurant_name:"baba ka dhaba",
                 role: "admin")

O1 = Order.create(Status: "Completed", transaction_id: "123ss1", user_id: U1.id)
O2 = Order.create(Status: "Cancelled", transaction_id: "123ss2", user_id: U1.id)
O3 = Order.create(Status: "Processing", transaction_id: "123ss3", user_id: U1.id)
O4 = Order.create(Status: "Processing", transaction_id: "123ss4", user_id: U1.id)

Order_Item1 = OrderItem.create(quantity: 3, food_id: F1.id, order_id: 1)
Order_Item2 = OrderItem.create(quantity: 2, food_id: F2.id, order_id: 1)
Order_Item3 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 1)
Order_Item4 = OrderItem.create(quantity: 4, food_id: F3.id, order_id: 2)
Order_Item5 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 2)
Order_Item6 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 3)
Order_Item7 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 3)
Order_Item8 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 3)
Order_Item9 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 4)
Order_Item10 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 4)
Order_Item11 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 4)

C1.foods << F1
C2.foods << F3

Comment1 = Comment.create(comment: "Best food ever", food_id: F1.id, user_id: U1.id)
Comment2 = Comment.create(comment: "I love it!!", food_id: F1.id, user_id: U2.id)

F4 = Food.create(name: "Akara",
                 restaurant_name:"baba ka dhaba",
                 category_id: 2,
                 description: "Home made akara",
                 price: 50)
