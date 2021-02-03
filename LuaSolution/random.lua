function glfsr(N,t) --N is seed; R is number of rounds to run
   local start_state = 0xACE1
   --string.byte(N)-- Any nonzero start state will work.
   local lfsr = start_state;
   local period = 0;
   local And=bit32.band
   local lshft=bit32.lshift
   local XOR=bit32.bxor
   local lsb=0
   local i=0
 
   while i<t do
      i=i+1
      lsb = And(lfsr,0x1)   -- Get LSB (i.e., the output bit). */
      lfsr = lshft(lfsr,0x1)               -- Shift register */
      if lsb == 1 then     --If the output bit is 1, apply toggle mask. */
         lfsr =XOR(lfsr,0xB400)
      end
      period=period+1
   end
   return lfsr%N
end

function random(N,t) -- returns random n < N
   local g=glfsr
   local n = g(N,t)
   return n
end
print("here s a random number produced by GLFSR < ",100,random(100,10))
print("here s a random number produced by GLFSR < ",100,random(100,10))
