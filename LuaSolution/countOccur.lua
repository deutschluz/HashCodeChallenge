
function countOccur(lst)
  count={}
  for i,v in ipairs(lst) do
    if count[v] ~= nil then
       count[v] = count[v] +1
    else
       count[v]=1
    end
  end
  return count
end

function main()
  local l={'b','c','a','d','c','a','c'}
  local count=countOccur(l)
  for k,v in pairs(count) do
    print(k,"occurs ",v,"times")
  end
end

main()