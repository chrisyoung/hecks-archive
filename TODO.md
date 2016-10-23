# Pizza Server 0.1

## In Progress
* Move command schemas to hecks resource adapter

## Current Sprint
* SQL Adapter
* Figure out where to deploy Docker
* Push PizzaBuilder to Github
* Get MySQL Running in in Container
* Figure out how to generate the config for the server

## Bugs
* Server DELETE is reporting "no response from server" in curl

## Next Actions
* Use a struct for value objects
* Get rid of command chaining
* Adapter Schemas and validations - make sure Hecks can talk to your adapters.
* Spec folders can be nested.  Generate a domain in hecks/spec should run the domain tests :)
* Stop using aliases in generators
* Establish open source license
* Clean up generator comments
* Use relative hex binary automatically if no gem is installed
* Tests for all the generators
* Set up guard to build gems
* Auto Generate API Docs
* Warn if running a generator without being in a hexagon
* Schema for read (required int?)
* Hook up code coverage on github
* Use invariants (fail)
* Build Gem: hecks build -m pizzas
* 12 factor app in Docker
* Products Domain
* CouchDB Persistence Adapter
* Demonstrate Hexagon Shims for Tanga
* Set up stats module to count lines of code
* Use Event Machine to take lots of concurrent requests http://recipes.sinatrarb.com/p/embed/event-machine
* Value Store (Service?)
* Domain Console (> hecks console in domain)
* Command Line
* Hook up pizzas as rack middleware
* Deploy a Soccer app for Tanga
* Make update take id as separate parameter

## Challenges:
* Remove all if statements
* Generate a different language
* Create Commands from Product Use Cases
* Create plugin for Asana to show test results on use cases
* Figure out scheme to use in memory db in production and periodically flush to real db

## Notes
* Generators are functions.  What if the code is generated for the function to complete?
* Just in time compiling of source code
* Generate the code > Run the code > Delete the code
* Code is always up to date.
