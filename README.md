# Heckson
Scalable architecture focused on Object Oriented best practices

## Heckson Generators
Use Heckson to generate hexagons using many of the concepts and patterns presented in Domain Driven Design.

## Domain Driven Design Concepts

Aggregates
Entities
Values
Repositories
Commands

## Developing the Pizza Server with Heckson

### 1. Draw a domain
```
┌──────────────────┐
│      Domain      │
│    ┌────────┐    │
│  ┌─┤Pizza   ├─┐  │
│  │.└────────┘.│  │
│  │......*.....│  │
│  │......┃.....│  │
│  │......▼.....│  │
│  │.┌────────┐.│  │
│  │.│Topping │.│  │
│  │.└────────┘.│  │
│  │............│  │
│  └────────────┘  │
│                  │
└──────────────────┘
```

#### Notes on the Pizza Domain:
* A Pizza is the head of an aggregate
* A Pizza is an entity
* A pizza has many toppings
* A topping is a value object

### 2. Generate a hexagon to hold the Domain
### 3. Generate a Pizzas Aggregate with a Pizza entity for the head
### 4. Generate a Topping Value object
### 5. Generate an HTTP adapter

## Developing with Hexagons and Rails
### 1. Create a PizzaHexagon Gem
### 2. Hook up to Rails Resources

## How to Meditate

### Method:

Pay attention and relax

### Notes:

Everything happens in the moment
"The moment" is another way of saying "Now".

You are seeing, hearing, smelling, tasting, and breathing right now.
Thoughts are a signal that you are not in the moment.

Pay attention and relax. In the moment, everything is the truth as it is.
Future thinking brings fear, Past thinking brings regret.

So Just right now, what is the truth?
In the morning, it is bright. In the evening, it is dark.
