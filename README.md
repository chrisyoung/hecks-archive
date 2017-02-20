[![Code Climate](https://codeclimate.com/github/chrisyoung/hecks/badges/gpa.svg)](https://codeclimate.com/github/chrisyoung/hecks)[ ![Test Coverage](https://codeclimate.com/github/chrisyoung/hecks/badges/coverage.svg)](https://codeclimate.com/github/chrisyoung/hecks/coverage) [![Gem Version](https://badge.fury.io/rb/hecks.svg)](https://badge.fury.io/rb/hecks)

# Hecks
**Use Hecks to build scalable software that matches the language of your business.**

Hecks standardizes the creation of domains in code so that generalized solutions can be developed to adapt to both drive and receive data from business domains.  Hecks describes domains using a small subset of the patterns described in the blue book.

## Usage
PizzaBuilder is an ridiculously simplified application built using Hecks.  We'll use PizzaBuilder as an example for building a domain model standing up a resource server.

### Install
	$ gem install hecks
	$ hecks help

	hecks commands:
	hecks console         # REPL with domain helpers
	hecks generate        # generate
	hecks help [COMMAND]  # Describe available commands or one specific command
	hecks new             # Create a new Domain
	hecks package         # package

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
	# From your domain project Directory
	$ hecks new

### Generate and run a Resource Server
	# From your domain project Directory
	$ hecks generate:resource_server
	$ rackup config.ru
	$ curl -H "Content-Type: application/json" -d '{"name": "white", "description":"yummy", "toppings": [{"name":"pepperoni"}]}' localhost:9292/pizzas
	{"errors":{},"id":1,"args":{"name":"white","description":"yummy","toppings":[{"name":"pepperoni"}]}}
	$ curl localhost:9292/pizzas/1
	{"name":"white","description":"yummy","toppings":[{"name":"pepperoni"}],"id":1}

### Package and run a domain on the command line
	# From your domain project Directory
	$ hecks package binary
	$ cd packages/binary/build/osx/app/
	$ bundle
	$ pizza_builder pizzas '{"name":"White Pizza","description":"white sauce and chicken","toppings":[{"name":"chicken"}]}'

	{:id=>2,
	 :success=>true,
	 :errors=>{},
	 :args=>
	 	 {:name=>"White Pizza",
		  :description=>"white sauce and chicken",
		  :toppings=>[{:name=>"chicken"}]}}

### Use your domain in the Ruby console
	# From your domain project Directory
	$ hecks console

	Hecks Loaded!
	Using the PizzaBuilder domain
	head :001 > pp app[:pizzas].create({name: 'White Pizza', description: 'white sauce and chicken', toppings: [{ name: 'chicken' }]}).result

	{:id=>2,
	 :success=>true,
	 :errors=>{},
	 :args=>
	 	 {:name=>"White Pizza",
		  :description=>"white sauce and chicken",
		  :toppings=>[{:name=>"chicken"}]}}

## Hecks Adapters
Hecks adapters will work generated domains to provide services.  This has the benefit of keeping domain logic completely seperated from implementations.  These concepts borrow heavily from those expressed in Hexagonal

### Application
The Hecks application give immediate access to all the commands available for your domain.  

### Events
The Events adapter can be used to listen for life cycle events as they occur in your Domain.  You can supply listeners and respond to these events how you see fit.  

### Logger
The logger will write the results of all commands to a log file (TBD)

### Memory Database
This is the default database used by the Hecks Application.  It is super fast and can be used in tests without mocking.  In production you'll be more likely to use a file-based repository.  See the documentation for the hecks application to see how to use different databases.

### Resource Server
This server provides access to all the commands in your domain.  Because it uses the Application adapter, you get CRUD commands out of the box.

## Hecks Packages
You can use hecks to package your domain and make it easy to deploy using Docker or Lambda.  

## Concepts for building your Domain
The Hecks Domain Builder uses a small subset of patterns used in Domain Driven design.  Here's a very brief overview of those patterns and the implications of using them to describe your domain

### Aggregates
An aggregate has a head entity (see entities below).  All operations must be done on the head.  For instance, to operate on order items, we must access them through a specific Order object which is the head of the Orders aggregate.

### Domain modules
Domain modules are synonyms for aggregates in Hecks.

### Value Objects
Value objects do not have any continuation or identity.  They can be freely copied or referenced in a domain without worrying about the value changing under your nose.  A person's age could be considered a value object.  If a 21 year old person ages a year we replace the value with 22.

### Entities
An entity has conntinuance and life cycyle and keeps a unique, unchanging identifier to reference it.  A Person is usually considered an entity.  A Person defined as having a name, age, gender can change all three attributes without changing entity.

### Repositories
A repository is used in the domain to manage lifecycles of entities and their values

### Commands
Interacting with your domain is done through command objects.
