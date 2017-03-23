# Hecks


# pizza_builder gem run without dependency on hecks

# Change name to Vernacular
# Architecture concerned with domestic and functional rather than monumental buildings.
  *https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=vernacular&*&dobs=vernacular

## In Progress
  * Finish linux package
  * Shouldn't have to build hecks to run lambda package

## Current Sprint
  * Invoke local lambda from domain folder
  * Stop generating hecks/spec/examples
  * Choose gem path for gem server dynamically.
  * Deploy to Lambda  
  * Get rid of all the old gems in the binary package vendor folder
  * Stop using traveling ruby sql gem in sqldatabase adapter
  * Supply a sqldatabase specifically for binary packaging
  * Break out all the adapters into their own gems
  * Yank all the bad gems
  * Add a -d for database option when generating a resource server and lambda package
  * Truncate test database between runs
  * use a query to get back unique pizza toppings
  * Only offer to generate domain migrations if in sqldatabase adapter folder
  * clarify ambiguity between the domain builder and the domain objects Ruby modules
  * Rename ResourceServer to HTTPResourceServer
  * Get rid of test command on hecks - use the hecks/bin folder instead
  * Delete cache from Lambda package
  * Don't use join tables for value objects - value objects belong to their parents.
  * Add a drawing of PizzaServer to the domain

## Posters
  * Hecks in Python
  * DynoDB Database Generator
  * CouchDB Database Generator
  * Schema Validator
  * Package as Docker
  * Open source license

## Bugs
  * Fix DeleteReferences#where_clause ... Not doing anything currently :(
  * rm: packages/binary/build/osx/lib/app/vendor/ruby/2.2.0/gems/pizza_builder-0.0.0: is a directory
  * Making 2 pizzas with each post
  * Coverage report showing 100%
  * Stop reloading constants

## Next Actions
  * Build everything in a Docker Container
  * Run integration tests as part of ci, skip when running guard or maybe rspec itself
  * hecks test ci should blow up if anything doesn't work
  * Add a query object to pizzas that can list toppings
  * Delete intermediate container we created to copy gems
  * Figure out the right way to load the hecks file
  * Fix text case problems with generators
  * Only download gems once when packaging binary
  * Use relative hex binary automatically if no gem is installed
  * Use invariants (with #fail)
  * Clean up generator comments
  * Repress cache cleanup output after binary package

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
