# Classification

This problem is an example of a constrained resource allocation
problem.

# Brief statement of the problem

Given the description of available pizzas, and the number
of teams of 2,3,4, decide which pizzas to send to which teams
such that the number of different ingredients used in all
their pizzas is a maximum, with no duplicate ingredients.

# Sample Input

5 1 2 1 
3 onion pepper olive
3 mushroom tomato basil
3 chicken mushroom pepper
3 tomato mushroom basil
2 chicken basil

# Interpretation of Input

The first line is to be read as variables:
M T2 T3 T4

where M := number of available pizzas;
      T2 := number of 2 person teams
      T3 := number of 3 person teams
      T4 := number of 4 person teams

The rest of the file has the format:

N ingredient1 ingredient2 ...
.
.

where N:= number of ingredients

and ingredient1 := a string representing typical ingredients on
                   pizzas

# Classification

We conjecture that this is an variant of the 0-1 Knapsack problem.
From the wiki, the classical knapsack problem, KSP, from now on,

> Given a set of items, each with a weight and a value,
> determine the number of each item to include in a
> collection so that the total weight is less than or
> equal to a given limit and the total value is as large as possible.

In our case the "value" to be maximized is the number of ingredients.
the "weight limit" corresponds to the number of pizzas to include
in an order.

# Why does this matter?

Classifying the problem gives us ready-made ideas to implement.
Particulary, for this problem, since it is NP-complete, we can
lower our standard, so to speak, and only produce any solution rather
than the solution. For instance, we might use greedy heuristics
to arrive at an approximate solution, maybe many of these, and
then design a validation algorithm to sift through our tentative
solutions to produce the best solution from what we can generate.

# Analysis of The Problem

- [ ] - process input file
  - [ ] -

- [ ] - sort pizza list into non-increasing order to prepare for
        for greedy algorithm
   - [ ] - possibly sort number of teams ie T2,T3,T4 into
           non-increasing order also?
- [ ] - generate X solutions
- [ ] -  judge and validate generated solutions by focusing
        on ingreds/team and number of deliveries
	