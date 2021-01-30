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

function writeData(fname1,mode1)
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


function main()
  local fname="my_sample.dat"
  local mode="r"
  local M,t2,t3,t4=0
  local pizzalist={}
  local c=strcomp  --bring in string comparator to local scope
  M,t2,t3,t4,pizzalist=readData(fname,mode)
  printArray(pizzalist)
  print("sorting...")
  qsort(pizzalist,1,#pizzalist,c)
  printArray(pizzalist)
end

main()