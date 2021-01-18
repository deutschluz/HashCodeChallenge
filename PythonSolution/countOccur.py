#INPUT: count should be empty; lst should have things to count

def main():
  count={}
  lst=('a','b','c','a','c','d','a')
  for e in lst:
      if e in count:
          count[e] +=1
      else:
          count[e]=1

  for k,v in count.items():
      print("Key " +k+" has occurred " + str(v) + " times")
  return

main()
