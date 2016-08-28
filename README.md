[![Code Climate](https://codeclimate.com/github/chrisyoung/heckson/badges/gpa.svg)](https://codeclimate.com/github/chrisyoung/heckson)

# Heckson
Isolate your domain and make it the center of your programming world.  Use Heckson to generate a Containerized Domain Model that can be driven by your frameworks and included in your apps.

## Pizza Server
We developed [PizzaServer](https://github.com/chrisyoung/heckson/tree/master/examples/PizzaHexagon) at Tanga as a simple application that we could use to evaluate new recruits.  The simple domain made it easy to extend with these concepts in a very iterative fashion.  

## Drawing The Domain
You might prefer a whiteboard to ASCII, but this gets the idea across :)
```
┌─────────────────────────Hexagon────────────────────────────┐
│ ┌───────────────────────────────────────────────────────┐  │
│ │  ┌─────────────────Pizzas Aggregate────────────────┐  │  │
│ │  │                                                 │  │  │
│ │  │                   ┌────────┐                    │  │  │
│ │  │                   │ Pizza  │                    │  │  │
│ │  │              ◎────│ -----  │                    │  │  │
│ │  │                   │  Name  │                    │  │  │
│ │  │                   └────────┘                    │  │  │
│ │  │                        *                        │  │  │
│ │  │                        ┃                        │  │  │
│ │  │                        ▼                        │  │  │
│ │  │                   ┌────────┐                    │  │  │
│ │  │                   │Topping │                    │  │  │
│ │  │                   │------- │                    │  │  │
│ │  │                   │  Name  │                    │  │  │
│ │  │                   └────────┘                    │  │  │
│ │  │                                                 │  │  │
│ │  │  * A Pizza is the head of the Pizzas aggregate  │  │  │
│ │  │  * A Pizza is an entity                         │  │  │
│ │  │  * A Pizza has a name                           │  │  │
│ │  │  * A Pizza has many Toppings                    │  │  │
│ │  │  * A Topping is a value object                  │  │  │
│ │  │  * A Topping has a name                         │  │  │
│ │  └─────────────────────────────────────────────────┘  │  │
│ └───────────────────────────────────────────────────────┘  │
└────────────────────────────────────────────────────────────┘
                                         ◎── = Aggregate Head
```
Note: This diagram was created by a cool tool called [Monodraw](http://monodraw.helftone.com/)

## Usage

### Generate the Hexagon
```
# Generate a hexagon to hold the Domain
$ hecks new pizza_hexagon

# Generate a Pizzas Aggregate with a Pizza Head
$ cd pizza_hexagon
$ hecks aggregate pizzas --h pizza --a name:string toppings:[topping] description:description

# Generate a Topping
$ hecks value_object topping -m pizzas --a name:string
```

### Run a CRUD Server
```
$ cd ../clients/http
$ rackup config.ru
```

### Make pizzas!
  # CREATE
  curl -H "Content-Type: application/json" -X POST -d '{"name":"White Pizza", "description":"No red sauce", "toppings":[{"name":"chicken"}]}' http://localhost:9292/pizzas

  # READ
  curl http://localhost:9292/pizzas/1

  # UPDATE
  curl -H "Content-Type: application/json" -X PUT -d '{"attributes":{"name":"chris", "toppings":[{"name":"pepperoni2"}]}}' http://localhost:9292/pizzas/1

  # DELETE
  curl -X DELETE http://localhost:9292/pizzas/1
