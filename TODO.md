## In Progress

## Current Sprint
  * Handle optionals in schema validator
  * Rename json validator to schema validator
  * Implement invariants from SoccerSeason (ie. only two teams)
  * How do we list pitches?
  * rails generate hecks -d SoccerSeason

## Soccer Season Website

## Build/CI
  * Add console to CI

## Schema validator
  * Stop converting messages in schema validator
  * Export schema with schema validator
  * Integration test for schema validator

## Extensions
  * Tests for the extension
  * Generate boilerplate for extensions

## SQLDatabase
  * Don't use join tables for value objects - value objects belong to their parents.
  * Move sql database generators into project folder (out of hecks-cli)
  * Make rake command work from pizza_builder directory (with sql_adapter)

## Tests
  * Use local version of dynamo db for testing
  * Truncate test database between runs
  * Fix up guard so it works with "unit" and "integration"
  * Use #should_behave_like to test database adapters
  * Add sql_database adapter to integration tests (ci)

## CLI
  * Only offer to generate domain migrations if in sqldatabase adapter folder
  * Generate boilerplate for a database adapter
  * Fix text case problems with generators
  * Clean up generator comments

## Hecks
  * Add a rake file to hecks
  * Make an "Admin" app and "User App"
  * Use Ruby for binaries instead of bash
  * Hecks build cli command
  * Should be hecks-adapters-memory-database
  * consider using .yml on all the config files
  * Rename ResourceServer to HTTPResourceServer
  * Figure out the right way to load the hecks file
  * Use invariants (with #fail)

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
  * Fix DeleteReferences#where_clause ... Not doing anything currently :(
  * Making 2 pizzas with each post?

## Generators
  * Goal#winner and Goal#loser should be attr_readers
  * Stop making references as classes
  * Change delimiter in hecks file to something like pizza=pizzas::pizza
  * Don't assign read only attributes in initializer

## Hygiene:
  * Clarify ambiguity between the domain builder and the domain objects Ruby modules
  * Drop Domain Prefix in PizzaBuilder
  * Set up guard to build gems
  * don't use tmp folder - use '#run'
  * 12 factor app in Docker
  * Use timestamps in sql migration names
  * Add result methods to all the crud commands
  * Move generator templates closer to commands
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
  * Set up soccer season on a new computer
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
