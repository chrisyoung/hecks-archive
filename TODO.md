## In Progress
  Build serverless files dynamically

## Current Sprint
  * Run tests for serverless and package in ci
  * Find old readme
  * Use a query to get back unique pizza toppings
  * Add a drawing of PizzaBuilder to the docs
  * Make a demo video
  * Make a tutorial
  * Drop Domain Prefix in PizzaBuilder
  * Fix up guard so it works with "unit" and "integration"
  * Add package and serverless to hecks binary

## Next Actions
  * New Project: netrecorder
  * Add a rake file to hecks
  * Generate boilerplate for a database adapter
  * Commands should always take the same arguments, the result should be a data structure.
  * Use #should_behave_like to test database adapters
  * Delete cache from binary package
  * Rename ResourceServer to HTTPResourceServer
  * Clarify ambiguity between the domain builder and the domain objects Ruby modules
  * Only offer to generate domain migrations if in sqldatabase adapter folder
  * Truncate test database between runs
  * Add a -d for database option when generating a resource server and lambda package
  * Yank all the bad gems
  * Break out all the adapters into their own gems
  * Stop using traveling ruby sql gem in sqldatabase adapter
  * Use activesupport-inflector instead of activesupport
  * Don't use join tables for value objects - value objects belong to their parents.
  * Build everything in a Docker Container
  * Run integration tests as part of ci, skip when running guard or maybe rspec itself
  * hecks test ci should blow up if anything doesn't work
  * Add a query object to pizzas that can list toppings
  * Delete intermediate container we created to copy gems
  * Figure out the right way to load the hecks file
  * Fix text case problems with generators
  * Use invariants (with #fail)
  * Clean up generator comments

## Posters
  * Hecks in Python
  * DynoDB Database Generator
  * CouchDB Database Generator
  * Schema Validator
  * Package as Docker
  * Open source license

## Bugs
  * Why do we have to run ci twice - once to build the gem and once to install
  * Why is ci still building 10.1.5.1?
  * Why isn't lambda dev being excluded?
  * Fix DeleteReferences#where_clause ... Not doing anything currently :(
  * Making 2 pizzas with each post
  * Coverage report showing 100%
  * Stop reloading constants
  * Stop generating hecks/spec/examples

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

## Musings:
* Just in time compiling of source code?
  * Generators are functions.  What if the code is generated for the function to complete?
  * Generate the code > Run the code > Delete the code
  * Code is always up to date.
