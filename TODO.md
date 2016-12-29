{
  "pizzas":
    [
      { "pizza": [ "name", "description", "toppings:[topping]" ] },
      { "topping": [ "name" ] }
    ]
  "orders":
    [
      { "pizzas[pizzas:pizza]" }
    ]
}






# Pizza Server 0.1

## In Progress

## Current Sprint
How to generate call to objects in other modules?

## Next Actions
* Move validations into an adapter
* Value Store (Service?)
* Toppings must have at least one entry
* Generate spec directory in domain
* Generators for domain specific sql adapter
* Figure out how to generate the config for the server
* Should query objects return values?
* Stop hardcoding pizza stuff into generators
* Use relative hex binary automatically if no gem is installed
* Domain Console (> hecks console in domain)
* Auto Generate API Docs
* Use invariants (fail)
* Use a struct for value objects
* CouchDB Persistence Adapter
* Generate tests for domain
* Stop using aliases in generators
* Open source license
* Clean up generator comments
* Tests for all the generators
* Set up guard to build gems
* Set up stats module to count lines of code
* Demonstrate Hexagon Shims for Tanga
* Warn if running a generator without being in a hexagon
* Hook up code coverage on codeclimate
* Build Gem: hecks build -m pizzas
* 12 factor app in Docker
* Use Event Machine to take lots of concurrent requests http://recipes.sinatrarb.com/p/embed/event-machine
* Command Line Pizzas
* Hook up pizzas as rack middleware
* Deploy a Soccer app for Tanga
* Products Domain

## Challenges:
* Figure out scheme to use in memory db in production and periodically flush to real db
* Remove all if statements
* Generate a different language
* Create Commands from Product Use Cases
* Create plugin for Asana to show test results on use cases

## Notes
* Spec folders can be nested.  Generate a domain in hecks/spec should run the domain tests :)
* Generators are functions.  What if the code is generated for the function to complete?
* Just in time compiling of source code
* Generate the code > Run the code > Delete the code
* Code is always up to date.
