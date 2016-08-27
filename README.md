[![Code Climate](https://codeclimate.com/github/chrisyoung/heckson/badges/gpa.svg)](https://codeclimate.com/github/chrisyoung/heckson)

# Heckson
Isolate your domain and make it the center of your programming world.  Use Heckson to generate a Containerized Domain Model that can be driven by your frameworks and included in your apps.

## Pizza Server
We developed [PizzaServer](https://github.com/chrisyoung/heckson/tree/master/examples/ph2) at Tanga as a simple application that we could use to evaluate new recruits.  The simple domain made it easy to extend with these concepts in a very iterative fashion.  

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
  $ curl -H "Content-Type: application/json" -X POST -d '{"name":"White Pizza", "description":"No red sauce", "toppings":[{"name":"chicken"}]}' http://localhost:9292/pizzas

  # READ
  $ curl http://localhost:9292/pizzas/1

  # UPDATE
  $ curl  -H "Content-Type: application/json" -X PUT -d '{"attributes":{"name":"chris", "toppings":[{"name":"pepperoni2"}]}}' http://localhost:9292/pizzas/1

  # DELETE
  $ curl -X DELETE http://localhost:9292/pizzas/1

## In Progress
* Make a gem out of the hexagon - Chris Young

## Current Sprint
* Deploy a pizza app using Rails
* Only use invariants (move schema out of hexagon)
* Generate Notifiers
* Update the generators
* Fix Tests
* Use Event Machine to take lots of concurrent requests http://recipes.sinatrarb.com/p/embed/event-machine

## Next Actions
* Dockerize the HTTP Server
* Factory for building toppings in pizza
* Rename use cases to commands
* CRUD Commands should generate explicitly
* Value Store (Service?)
* Generator to create config.ru file
* Server gem
* CouchDB Persistence Adapter
* Domain Console
* Hook up code coverage
* Set up stats module to could lines of code
* Server DELETE is reporting "no response from server" in curl
* Add a Soccer app to the examples
* Deploy a Soccer app for Tanga

## Challenges:
* Remove all if statements
* Generate an Elixr project
* Create Commands from Product Use Cases
* Create plugin for Asana to show test results on use cases
* Figure out scheme to use in memory db in production and periodically flush to real db
