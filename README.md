# Heckson
Isolate your domain and make it the center of your programming world.  Use Heckson to generate a Domain library that can drive your applications.  

[Hexagonal Architecture](http://alistair.cockburn.us/Hexagonal+architecture)

[Domain Driven Design](http://domainlanguage.com/ddd/reference/)

## Usage - Developing the Pizza Domain with Heckson

### 1. Draw a domain
You might prefer a whiteboard to ASCII, but this gets the idea across :)
```
┌───────────────────────Pizzas Domain────────────────────────┐
│                                                            │
│ ┌───────────────────Aggregate Modules───────────────────┐  │
│ │                                                       │  │
│ │  ┌─────────────────────Pizzas──────────────────────┐  │  │
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

### 2. Generate a hexagon to hold the Domain
`$ heckson new pizza_hexagon`
### 3. Generate a Pizzas Aggregate with a Pizza entity for the head
```
$ cd pizza_hexagon
$ heckson aggregate pizzas --head pizza --attributes name:string toppings:[topping]
```
### 4. Generate a Topping Value object
`$ heckson value_object pizza -module pizzas --attributes name:string`
### 5. Generate an HTTP adapter
`$ heckson adapter http`
### 6. Run the server
```
$ cd lib/adapters/http
$ rackup config.ru
```
### 7. Make pizzas!
```
Create: POST localhost:9292/pizzas {
  'name': "White",
  'description': 'no sauce, garlic, yum',
  'toppings': [
    {'name': 'Mozzarella Cheese'},
    {'name': 'Garlic'}
  ]}}

Read: GET localhost:9293/pizzas/1

Update: PUT localhost:9294/pizzas/1 {name: "New York"}

Delete: DELETE localhost:9295/pizzas/1
```

## Developing with Hexagons and Rails
### 1. Create a PizzaHexagon Gem
### 2. Hook up to Rails Resources

## Domain Driven Design Key Concepts
* Aggregates
* Entities
* Values
* Repositories
* Commands

## Hexagonal Architecture Key Concepts
* Hexagon
* Ports (driver and driven)
* Port Adapters
* Mock Database (in-memory)

## Features
* Supports CRUD Commands out of the box
*

## Ports
  Ports and adapters are used to organize services that may be provided by your hexagons, such as a web server that supports crud operations on your Domain Modules.
### User Commands (Driver)
  The "native" port of your Hexagon uses Commands that operate with real Domain objects
### Data (Driven)
  By default your hexagon uses a mock database or in-memory repository to persist aggregates

## Adapters
  Adapters fall into two categories, those that can drive a domain and those that are driven by the domain.  Hecks allows you to generate driving adapters like HTTP, JSON, and Validator, as well as driven adapters like SQL, Couch, and SQLDummy(an in memory repository).

### Driving Adapters
#### HTTP
  An http server that provides CRUD access to your Heckson modules.
#### JSON
  An http server that provides CRUD access to your Heckson modules.
#### Validations
  This adapter will provide a client with human friendly feedback when trying to call commands
### Driven Adapters
#### SQL
  Implemented with Active Record, this adapter allows you to persist your aggregates to a SQL database
#### CouchDB
  An object store adapter.  Save your aggregates as object graphs

## How to Meditate

### Method:

Pay attention and relax

### Notes:

Everything happens in the moment
"The moment" is another way of saying "Now".

You are seeing, hearing, smelling, tasting, and breathing right now.
Thoughts are a signal that you are not in the moment.

Pay attention and relax. In the moment, everything is the truth as it is.
Future thinking brings fear, Past thinking brings regret.

So Just right now, what is the truth?
In the morning, it is bright. In the evening, it is dark.
