# Hecks 0.4

## In Progress
* SQL Adapter
  * generate repository/database

## Current Sprint
* Use timestamps in migration names
* Handle optional fields
* CI without downloading, gem building
* Figure out the right way to load the hecks file
* Only download gems once when packaging binary
* Deploy to Lambda
* Rename HECKS Hecksfile
* DynoDB Repository Generator
* Make a schema based validator
* Finish linux package
* Use the linux binary when deploying, osx binary on mac
* use a query to get back unique pizza toppings
* break hecks_application out of hecks project to reduce size
* Hook up events example
* Package as Docker
* Delete intermediate container we created to copy gems

## Next Actions
* Change delimiter in hecks file to something like pizza=pizzas::pizza
* Python bindings using binary
* Generate Rdoc for ruby gems
* Generate Readme examples
* pizza_builder binary should be outside of lib
* move code hecks_cli project
* move code hecks_domain_builder project
* move code hecks_console project
* consider hecks_examples project
* Add result methods to all the crud commands
* Move generator templates closer to commands
* Rename the Builder to Hecks::Domain
* Attach specification to domain instead of Hecks, or make specs available as list
* Fix text case problems with generators
* Fix indentation in generators
* Check type in validator as well as presence
* Demo Domain Versioning
* Value Store (Service?)
* SQL repository generator
* Validate: Toppings must have at least one entry
* Use relative hex binary automatically if no gem is installed
* Auto Generate API Docs
* Use invariants (fail)
* Use a struct for value objects
* CouchDB Persistence Adapter
* Open source license
* Clean up generator comments
* Set up guard to build gems
* Set up stats module to count lines of code
* Demonstrate Hexagon Shims for Tanga
* Build Gem: hecks build -m pizza_builder
* Package: hecks package -t docker
* 12 factor app in Docker
* Hook up pizzas as rack middleware

## Challenges:
* Generate a different language
* Figure out scheme to use in_memory db in production and periodically flush to real db
* Remove all if statements
* Create Commands from Product Use Cases
* Create plugin for Asana to show test results on use cases

## Notes
* Just in time compiling of source code?
  * Generators are functions.  What if the code is generated for the function to complete?
  * Generate the code > Run the code > Delete the code
  * Code is always up to date.
