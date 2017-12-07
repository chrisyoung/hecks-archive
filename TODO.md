## In Progress

## Current Sprint
  * Tests for the extension
  * Generate boilerplate for extensions
  * Handle optionals in schema validator
  * Add sql_database adapter to integration tests (ci)
  * Integration test for schema validator
  * Make rake command work from pizza_builder directory (with sql_adapter)
  * Use local version of dynamo db for testing
  * rename json validator to schema validator
  * Use single parameter for domain objects (maybe \*attributes)
  * Make build/reset executable
  * Stop making references as classes
  * Generate extensions.rb and folder
  * Soccer Season Website
  * Stop converting messages in schema validator

## Next
  * Add console to CI
  * Drop Domain Prefix in PizzaBuilder
  * Clarify ambiguity between the domain builder and the domain objects Ruby modules
  * Add a rake file to hecks
  * Export schema with schema validator

## SQLDatabase
  * Don't use join tables for value objects - value objects belong to their parents.
  * Move sql database generators into project folder (out of hecks-cli)

## Tests
  * Add Remote spec for serverless
  * Truncate test database between runs
  * Fix up guard so it works with "unit" and "integration"  
  * Use #should_behave_like to test database adapters

## Packager
  * Use activesupport-inflector instead of activesupport
  * Delete cache from binary package

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

## Serverless
  * API routes on serverless
  * Why doesn't serverless delete or read have a result?

## Application
  * Run arbitrary command
  * Commands should always take the same arguments, the result should be a data structure.

## dynamodb
  * Figure out a way to hold open the dynamodb connection
  * Figure out a way to namespace dynamodb tables

## Posters
  * Hecks in Python
  * DynoDB Database Generator
  * CouchDB Database Generator
  * Package as Docker
  * Open source license

## Bugs
  * Why isn't lambda dev being excluded?
  * Fix DeleteReferences#where_clause ... Not doing anything currently :(
  * Making 2 pizzas with each post?

## Hygiene:
  * Set up guard to build gems
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
  * Use a query to get back unique pizza toppings
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
