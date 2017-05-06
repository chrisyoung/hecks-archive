## In Progress
  * Cannot read property 'errors' of null in integration spec

## Current Sprint
  * Run commands asynchronously - supply an id that will eventually fetch the resource
  * API routes on serverless
  * Use a query to get back unique pizza toppings
  * Add console to CI
  * Yank all the bad gems
  * Release version 0.2.0 :)

## Demo
  * Add a drawing of PizzaBuilder to the docs
  * Make a demo video
  * Make a tutorial

## SQLDatabase
  * Don't use join tables for value objects - value objects belong to their parents.
  * Move sql database generators into project folder (out of hecks-cli)
  * Generate ids instead of relying on DB

## Tests
  * Don't use eval in test => Calls to Serverless should return real json
  * Add Remote spec for serverless
  * Truncate test database between runs
  * Fix up guard so it works with "unit" and "integration"  
  * Use #should_behave_like to test database adapters
  * Run integration tests as part of ci, skip when running guard or maybe rspec itself
  * hecks test ci should blow up if anything doesn't work

## PizzaBuilder
  * Drop Domain Prefix in PizzaBuilder

## Packager
  * Use activesupport-inflector instead of activesupport
  * Delete cache from binary package

## Domain
  * Clarify ambiguity between the domain builder and the domain objects Ruby modules

## CLI
  * Only offer to generate domain migrations if in sqldatabase adapter folder
  * Generate boilerplate for a database adapter
  * Fix text case problems with generators
  * Clean up generator comments

## Hecks
  * Make an "Admin" app and "User App"
  * Use Ruby for binaries instead of bash
  * Hecks build cli command
  * Should be hecks-adapters-memory-database
  * consider using .yml on all the config files
  * Rename ResourceServer to HTTPResourceServer
  * Figure out the right way to load the hecks file
  * Use invariants (with #fail)
  * Add a rake file to hecks

## Application
  * Put calls behind a queue
  * Commands should always take the same arguments, the result should be a data structure.

## dynamodb
  * Use local version of dynamo db for testing
  * Figure out a way to hold open the dynamodb connection
  * Figure out a way to namespace dynamodb tables


## Posters
  * New Project: netrecorder
  * Hecks in Python
  * DynoDB Database Generator
  * CouchDB Database Generator
  * Schema Validator
  * Package as Docker
  * Open source license

## Bugs
  * Why do we have to run ci twice - once to build the gem and once to install
  * Why isn't lambda dev being excluded?
  * Fix DeleteReferences#where_clause ... Not doing anything currently :(
  * Making 2 pizzas with each post?

## Hygiene:
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
