dbg=require "debugger"
function swap(t,i,j)
  local temp=t[i]
  t[i]=t[j]
  t[j]=temp
end
--this is string comparator
--INPUT: x,y are strings
function comp(x,y)
   if x ==nil or y==nil then return false end
   if x<y then return -1 
   elseif x == y then return 0
   elseif x > y then return 1
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
  dbg()
  if comp(left,right)<=0 then
    local q=partition(t,left,right,comp)
    qsort(t,left,q-1,comp)
    qsort(t,q+1,right,comp)
  end
end
function printTab(t)
  for i=1,#t do
    io.write(t[i]," ")
  end
  io.write("\n");
end


function main()
  local l={10,-1,3,6,8,0,2,-5}
  printTab(l)
  qsort(l,1,#l,comp)
  printTab(l)
  local l2={'b','d','f','z','a','w','j','i'}
  printTab(l2)
  qsort(l2,1,#l2,comp)
  printTab(l2)
end

main()