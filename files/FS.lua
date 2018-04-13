
local function str(t)
local o,j
if type(t)=="table"then
o,j=pcall(sjson.encode,t)
else j=tostring(t)end
return j
end

local function del(t)
 local r
if file.exists(t.name) then
 file.remove(t.name)
 r=true
end
 return r
end

local function save(t)
 if t.new then
  if file.open(t.name,"w")then
   file.write(t.data)
   file.close()
  end
 else
  if file.open(t.name,"a+")then
   file.write(t.data)
   file.close()
  end
 end
end

local function info(t)

-- remaining, used, total=file.fsinfo()
end

local function rename(t)
 if file.exists(t.old) and file.exists(t.new)then
  r=file.rename(t.old,t.new)
 end
end

return function (t)
local r
if t.run then r=run(t.run)end
if t.list then r=file.list()end
if t.save then r=save(t.save)end
if t.del then r=del(t.del)end
return str(r)
end




