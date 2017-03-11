# Hecks 0.10

## In Progress
  * Add a -d for database option when generating a resource server and lambda package

## Current Sprint
  * Truncate test database between runs
  * Deploy to Lambda
  * Finish linux package
  * use a query to get back unique pizza toppings
  * Only offer to generate domain migrations if in sqldatabase adapter folder
  * clarify ambiguity between the domain builder and the domain objects Ruby modules
  * run with --no-cache if first time building binary package
  * Rename ResourceServer to HTTPResourceServer
  * Git Ignore all the gem files

## Posters
  * DynoDB Database Generator
  * CouchDB Database Generator
  * Schema Validator
  * Package as Docker
  * Open source license

## Bugs
  * Fix DeleteReferences#where_clause ... Not doing anything currently :(
  * rm: packages/binary/build/osx/lib/app/vendor/ruby/2.2.0/gems/pizza_builder-0.0.0: is a directory

## Next Actions
  * Run integration tests as part of cik, skip when running guard or maybe rspec itself
  * hecks test ci should blow up if anything doesn't work
  * Add a query object to pizzas that can list toppings
  * Delete intermediate container we created to copy gems
  * Figure out the right way to load the hecks file
  * Fix text case problems with generators
  * Only download gems once when packaging binary
  * Use relative hex binary automatically if no gem is installed
  * Use invariants (with #fail)
  * Clean up generator comments

## Hygiene:
  * Move examples directly under hecks folder (out of spec)
  * Set up guard to build gems
  * go back to simple pizza bulder domain.  Build out soccer_season
  * don't use tmp folder - use '#run'
  * 12 factor app in Docker
  * Use timestamps in sql migration names
  * Add result methods to all the crud commands
  * Move generator templates closer to commands
  * Fix indentation in generators
  * Change delimiter in hecks file to something like pizza=pizzas::pizza
  * Set up stats module to count lines of code
  * Use a struct for value objects
  * pizza_builder binary should be outside of lib

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