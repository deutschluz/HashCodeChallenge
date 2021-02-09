# Proposed Solution for the HashCode Challenge

- [x] - process input file
  - [x] - read first line into 4 separate variables
         numOfPizzas,Doubles,Triples,Quads
  - [x] - read rest of file into list
  
- [x] - sort pizza list into non-increasing order to prepare for
        for greedy algorithm
   - [x] - possibly sort number of teams ie T2,T3,T4 into
           non-increasing order also?
- [ ] - generate X solutions
  - [ ] - define ROUNDS var to control how many solutions are generated
          the generation and validation phases will be joined and called
	  one ROUND. and 'iters' var to keep track of current number of rounds. 
  - [ ] - define variables called PizzaStack,Teamlist,DeliveryStack
  - [ ] - push sorted list onto PizzaStack such that at top of stack
          are the pizzas with most ingredients
  - [ ] - pop PizzaStack, say you get pizzaN; push pizzaN onto DeliveryStack;
          until PizzaStack is empty
   - [ ] - how to count numOfDeliveries?
- [ ] -  judge and validate generated solutions by focusing
        on ingreds/team and number of deliveries
   - [ ] - check for and eliminate any duplicates
   - [ ] - check that all members of a team get a pizza or none do.
   - [ ] - calculate and store Ingreds/team and numOfDeliveries
   - [ ] - calculate score: 
   - [ ] - algorithm for iterating through rounds:
```
   if cur_IngredsPerTeam <IngredsPerTeam
      replace cur_IngredsPerTeam
   if iters < ROUNDS
      iters=iters+1
      start new round.