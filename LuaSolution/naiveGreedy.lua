-- implement the naive greedy generation algorithm
-- for the hashcode challenge

--Generation Algorithm(pizzalist)
function Generator(pizzalist)
--solution sketch:
-- 1 order list of pizzas by number of ingredients in non-increasing order
-- 2 create delivery stacks for every team
--  the stacks should have a variable "depth"
--  to indicate that its full
-- 3. put empty stacks into DeliveryList
-- 4  for dstack in DeliveryList do
         while i < pizzalist.length   
--         push(pizzalist[i]) onto dstack
--         i=i+1
--         if dstack.depth==dstack.limit then
--            
-- return DeliveryList


--Correction Algorithm(DeliveryList)


function main()
   local RndLim=5 -- controls how many solutions are generated
   local Rounds=0 --
   pizzaOrder= {}  --global ordering of pizzas
   --read file into pizzaOrder
   



   while Rounds < RndLim do
     local tentative=generator(pizzalist)
     local final=Correction(tentative)
     -- if final is good enough
          stop
	else
	    Rounds =Rounds+1
	    shuffle(pizzalist)
	 