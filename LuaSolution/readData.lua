dbg=require("debugger")
Stack=require("stack")

function printArray(t)
  for i,v in ipairs(t) do
    print(i,v)
  end
end

function swap(t,i,j)
  local temp=t[i]
  t[i]=t[j]
  t[j]=temp
end

function readData(fname1,mode1)
   local M,t2,t3,t4=0
   local plist={}
   --set file handle of first file
   local f1= io.open(fname1,mode1)
   --if f1 is nil
   local linecount=1
   if not f1 then print("something's wrong!") return 
   else
     --first line has to be treated diffently
      for line in f1:lines() do
         -- if line is first
	 if linecount==1 then
	 --  read line into the vars: M,t2,t3,t4
            M,t2,t3,t4=string.match(line,"(%d+)%s(%d+)%s(%d+)%s(%d+)")
            linecount=linecount+1
	    goto continue
         end
	 table.insert(plist,line)
	 ::continue::
      end
   end
   return M,t2,t3,t4,plist
end

--this is string comparator
--INPUT: x,y are strings
-- the first char of str x will be compared to
-- first char of str y
function strcomp(x,y)
  --check for valid input
   if x ==nil or y==nil then return false end
  --extract first chars from each string
   local firstcharX=string.sub(x,1,1)
   local firstcharY=string.sub(y,1,1)

   if firstcharX<firstcharY then return -1 
   elseif firstcharX == firstcharY then return 0
   elseif firstcharX > firstcharY then return 1
   else return false
   end
end

function partition(t,left,right,comp)
  local x=t[right]
  local i=left-1
  for j=left,right-1 do
    if comp(t[j],x)<=0 then
      i=i+1
      swap(t,i,j)
    end
  end
  swap(t,i+1,right)
  return i+1
end

function qsort(t,left,right,comp)
  if comp(left,right)<=0 then
    local q=partition(t,left,right,comp)
    qsort(t,left,q-1,comp)
    qsort(t,q+1,right,comp)
  end
end

--function that appends the order in which a pizza was
-- read from file to the end each string
function AppendRank(plist)  
  for i=1,#plist do
    s=plist[i].." "..tostring(i)
    plist[i]=s
  end
  return plist
end

--Generation Algorithm(pizzalist)
function Generator(pizzalist,t2,t3,t4)
   local dlist={} --hold delivery stacks
-- 2 create delivery stacks for every team
--  the stacks should have a variable "limit"
--  to indicate that its full
-- 3. put empty stacks into DeliveryList
   --use a for loop for each tN
   lim=2
   for i=1,t2 do     
     local dstack=Stack:new()
     dstack.limit=lim
     dlist[i]=dstack  -- make ith elem of dlist an empty stack
   end
   lim=3 --now adding empty stacks for each 3 person team
   for i=#dlist,#dlist+t3 do
      local dstack=Stack:new()
      dstack.limit=lim
      dlist[i]=dstack
   end
   lim=4
   for i=#dlist,#dlist+t4 do
     local dstack=Stack:new()
     dstack.limit=lim
     dlist[i]=dstack
   end

  --NOW pushing pizzas onto delivery stacks
    j=#pizzalist
    for i=1,#dlist do
        local dstack=dlist[i]
         while j > 0 do
            dstack:push(pizzalist[j])
            j=j-1
            if dstack:depth()==dstack.limit then
               goto continue
            end
	 end
	 ::continue::
   end
   return dlist
end

function getLastChar(str)
  local arr= table.pack(string.find(str,"%w+"))
  return arr[#arr]
end

function CorrectEval(deliverylist,t2,t3,t4)
 local D=#deliverylist
  --check that 1<= D and D <= t2+t3+t4
  if D < 1 then return false end
  if D > t2+t3+t4 then return false end
  -- check that the number 2 person deliveries is < T2
  -- check that the number of 3 person deliveries is < T3
  --print solution
  print(D)
  local line=""
  for i=1,D do
      dstack=deliverylist[i]
      --format: M P1 P2...; M is size of team; PN is
       line=tostring(dstack.limit)
     while dstack:depth() > 0 do
      --get last char of deliverylist[i].pop()
       if dstack:pop() == nil then break
       else
          line = line..tostring(getLastChar(dstack:pop()))
     end
     print(line)
  end
end

function main()
  local fname="my_sample.dat"
  local mode="r"
  local M,t2,t3,t4=0
  local pizzalist={}
  local c=strcomp  --bring in string comparator to local scope
  M,t2,t3,t4,pizzalist=readData(fname,mode)
  print("here s the list as is")
  printArray(pizzalist)
  AppendRank(pizzalist)
  print("here s the list with ranks at the end...")
  printArray(pizzalist)
  print("sorting...")
  qsort(pizzalist,1,#pizzalist,c)
  printArray(pizzalist)
  local Dlist=false
  Dlist=Generator(pizzalist,t2,t3,t4)
  CorrectEval(Dlist,t2,t3,t4)
end

main()