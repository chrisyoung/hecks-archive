[![Code Climate](https://codeclimate.com/github/chrisyoung/hecks/badges/gpa.svg)](https://codeclimate.com/github/chrisyoung/hecks)

[![Test Coverage](https://codeclimate.com/github/chrisyoung/hecks/badges/coverage.svg)](https://codeclimate.com/github/chrisyoung/hecks/coverage)

# Hecks
**Build scalable software that matches the language of your business.**

Hecks attempts to standardize the creation of domains in code so that generalized solutions can be developed to adapt to both drive and receive data from business domains.  In DDD they say to use these patterns.  Hecks describes domains using a small subset of the patterns described in the blue book.


## Usage
PizzaBuilder is an overly simplified application built using Hecks.  We'll use PizzaBuilder as an example for building a domain model standing up a resource server.

### Install
	$ gem install hecks
	$ hecks help

	hecks build                                            # build and install the hecks gem
	hecks console                                          # REPL with domain helpers
	hecks generate:domain_object -t, --type=[OBJECT_TYPE]  # Generate Domain Objects
	hecks help [COMMAND]                                   # Describe available commands or one specific command
	hecks new                                              # Create a new Domain
	hecks test                                             # Regenerate the examples and run the spec

### Create a HECKS file in an empty project directory:
	Hecks::DomainBuilder.build "pizza_builder" do |pizza_builder|
		pizza_builder.module 'Pizzas' do |pizzas|
		  pizzas.head("Pizza").attributes('name:value', 'description:value', 'toppings:[topping]')
		  pizzas.value("Topping").attributes('name:value')
		end

		pizza_builder.module 'Orders' do |orders|
		  orders.head("Order").attributes('line_items:[LineItem]')
		  orders.value("LineItem").attributes('pizza_name:value', 'quantity:Value', 'price:Value')
		end
	end

### Generate the Domain
	hecks new

### Run a Resource Server
	# TODO

## Adapters
Hecks adapters will work generated domains to provide services.  This has the benefit of keeping domain logic completely seperated from implementations.  These concepts borrow heavily from those expressed in Hexagonal
### Application
The Hecks application give immediate access to all the commands available for your domain.  
### Events
The Events adapter can be used to listen for life cycle events as they occur in your Domain.  You can supply listeners and respond to these events how you see fit.  
### Logger

### Memory Database
### Resource Server

## Concepts for building your Domain
The Hecks Domain Builder uses a small subset of patterns used in Domain Driven design.  Here's a very brief overview of those patterns and the implications of using them to describe your domain

### Aggregates
An aggregate has a head entity (see entities below).  All operations must be done on the head.  For instance, to operate on order items, we must access them through a specific Order object which is the head of the Orders aggregate.

### Domain modules
Domain modules are synonyms for aggregates in Hecks.

### Value Objects
Value objects do not have any continuation or identity.  They can be freely copied or refereneced in a domain without worrying about the value changing under your nose.  A person's age could be considered a value object.  If a 21 year old person ages a year we replace the value with 22.

### Entities
An entity has conntinuance and life cycyle and keeps a unique, unchanging identifier to reference it.  A Person is usually considered an entity.  A Person defined as having a name, age, gender can change all three attributes without changing entity.

### Repositories
A repository is used in the domain to manage lifecycles of entities and their values

### Commands
Interacting with your domain is done through command objects.
