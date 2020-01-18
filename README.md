# CAMERA STORE

This is simple application which provides REST APIs for e-commerce system for a local camera store where people can come and buy cameras.

Baisc requirements to run this application on your local machine:

* Ruby version: 2.4 or above

* Rails version: 5.2 or above

* Database: SQLite3

Here is a step-by-step guide to run this project

Run followings command on Terminal

1. $ bundle install
2. $ rails db:migrate
3. $ rails s


#Avaliable APIs

1. Create a user

POST
localhost:3000/api/users/signup
params
{
	"user": {
		"email": "abc@xyz.com",
		"password": "123456"
    }
}

-------------------------------------------------------------

2. Check logged in user

GET
localhost:3000/api/users/logged_in

-------------------------------------------------------------

3. User Login

POST
localhost:3000/api/sessions/create
params
{
	"email": "abc@xyz.com",
	"password": "123456"
}

-------------------------------------------------------------

4. Create a Category

POST
localhost:3000/api/categories
params
{
	"name": "Canon",
	"group": "Mirrorless",
	"model": 2018
}

-------------------------------------------------------------

5. List all Categories

GET
localhost:3000/api/categories
response
[
    {
        "id": 1,
        "name": "Nikon",
        "group": "Mirrorless",
        "model": 2018
    }
]

-------------------------------------------------------------

6. Create a Product

POST
localhost:3000/api/products
params
{
	"name": "Canon",
	"category_id": 1,
	"description": "This product was buit in 2018",
	"price": 20034.50
	"make": 2018
}

-------------------------------------------------------------

7. List all Porducts

GET
localhost:3000/api/products
response
[
    {
        "id": 1,
        "name": "Nikon D850",
        "category_id": 1,
        "description": "this product was built in 2018",
        "price": 20134.34,
        "make": 2019
    }
]

-------------------------------------------------------------

8. List all Porducts of a specific Category

GET
localhost:3000/api/categories/1
response
[
    {
        "id": 1,
        "name": "Nikon D850",
        "category_id": 1,
        "description": "this product was built in 2018",
        "price": 20134.34,
        "make": 2019
    }
]

-------------------------------------------------------------

9. Add products to Cart

User must logged_in
POST
localhost:3000/api/carts/create
params
{
	products_ids: [1,2,3]
}

-------------------------------------------------------------

10. Get Cart for a specific User

GET
localhost:3000/api/carts/1
response
[
    {
        "id": 1,
        "name": "Nikon D850",
        "category_id": 1,
        "description": "this product was built in 2018",
        "price": 20134.34,
        "make": 2019
    }
]