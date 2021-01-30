-- a function that shuffles a given list

function shuffle(lst)
  local keys={}

  for i=0,#lst do
    keys[i] = i
  end

  local shuffled={}
  while #keys > 0 do
    i=table.remove(keys,math.random(#keys)) --here s where the random
                                 --choice is made: i is in [1,#keys]
    shuffled[#shuffled +1]=lst[i]
  end

  return shuffled
end

print(table.unpack(shuffle({1,2,3,4,5})))
print(table.unpack(shuffle({1,2,3,4,5})))
print(table.unpack(shuffle({1,2,3,4,5})))

