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

Now just run this command in the same directory as the HECKS file
	$ hecks new

You should see a bunch of output as hecks builds the Objects that you'll use to interact with the domain.

### Resource Server
	$ hecks generate:resource_server
	$ rackup config.ru
	$ curl -H "Content-Type: application/json" -d '{"name": "white", "description":"yummy", "toppings": [{"name":"pepperoni"}]}' localhost:9292/pizzas

### Command Line
The command line adapter is currently implemented as a 2.2.2 traveling ruby package.  Hecks provides the means to build that package.

	$ hecks package binary
	$ cd packages/binary/build/osx/app/
	$ bundle
	$ pizza_builder 'module: {'pizzas', args: {...}}'

### Ruby Console
Move into your domain's directory (the one creared with hecks new)

	$ hecks console
	:001 > pp app[:pizzas].create({name: 'White Pizza' ... }]})

### AWS Lambda
Hecks is friends with serverless to generate a deployable function.  Here's how to see if it worlks locally:

	$ hecks package lambda
	$ serverless invoke local -f hello -d '{"name":"White Pizza","description":"white sauce and chicken","toppings":[{"name":"chicken"}]}'
