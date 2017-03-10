# Hecks 0.10

## In Progress
* generate sql database to inject with Lambda
  * fix DeleteReferences#where_clause ... Not doing anything currently :(

## Current Sprint
* Truncate test database between runs
* Deploy to Lambda
* Finish linux package
* use a query to get back unique pizza toppings
* Only offer to generate domain migrations if in sqlserver adapter folder
* Stop redeclaring DOMAIN constant

## Posters
  * DynoDB Database Generator
  * CouchDB Database Generator
  * Schema Validator
  * Package as Docker
  * Open source license

## Hygiene:
  * Move sqldatabase test out of examples
  * Add a query object to pizzas that can list toppings
  * go back to simple pizza bulder domain.  Build out soccer_season
  * rm: packages/binary/build/osx/lib/app/vendor/ruby/2.2.0/gems/pizza_builder-0.0.0: is a directory
  * don't use tmp folder - use '#run'
  * run with --no-cache if first time building binary package
  * Fix namespacing in generators
  * 12 factor app in Docker
  * Delete intermediate container we created to copy gems
  * Use timestamps in sql migration names
  * Figure out the right way to load the hecks file
  * Add result methods to all the crud commands
  * Move generator templates closer to commands
  * Rename the Builder to Hecks::Domain
  * Attach specification to Domain constant instead of Hecks
  * Fix text case problems with generators
  * Fix indentation in generators
  * Change delimiter in hecks file to something like pizza=pizzas::pizza
  * pizza_builder binary should be outside of lib
  * Only download gems once when packaging binary
  * CI without downloading, gem building
  * Set up guard to build gems
  * Set up stats module to count lines of code
  * Use relative hex binary automatically if no gem is installed
  * Use invariants (with #fail)
  * Use a struct for value objects
  * Clean up generator comments
  * Use domain explicit object attributes in repositories instead of attribute hash

## Break out projects
  * move code hecks_cli project
  * move code hecks_domain_builder project
  * move code hecks_console project
  * move code hecks_application
  * consider hecks_examples project

## Default Validator
  * Handle optional fields
  * Check type in default validator as well as presence

## Documentation
  * Generate API Docs
  * Generate Rdoc for ruby gems
  * Generate Readme examples

## Demos
  * Hook up pizzas as rack middleware
  * Hook up events example
  * Demo Domain Versioning
  * Python bindings using binary
  * Demonstrate Hexagon Shims for Tanga

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
