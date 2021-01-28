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
	 end
	 linecount=linecount+1
	 table.insert(plist,line)
      end
   end
   return M,t2,t3,t4,plist
end

local fname="a_example"
local mode="r"
readData(fname,mode)

--function writeData(fname1,mode1)
