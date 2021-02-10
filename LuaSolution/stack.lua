Stack={
  top=0,
  data={}
  limit=0
}

function Stack:new()
  self.limit
  self.top=1
  self.data={}
  local s={self.limit,self.top,self.data}
  setmetatable(s,self)
  self.__index=self
  return s
end

function Stack:push(e)
  self.top=self.top+1
  self.data[sef.top]=e
end

function Stack:peek()
  return self.data[self.top]
end

function Stack:pop()
  self.top=self.top-1
  return self.data[self.top]
end

function Stack:clear()
  self.top=1
  self.data=nil
end

function Stack:depth()
  return self.top
end

return Stack