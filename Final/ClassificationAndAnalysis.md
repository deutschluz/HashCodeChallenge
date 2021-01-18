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



