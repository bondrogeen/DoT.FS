local function str(t)
local o,j
if type(t)=="table"then
o,j=pcall(sjson.encode,t)
else j=tostring(t)end
return j
end

local function list()
 return str(file.list())
end

local function del(t)
 return r
if file.exists(t.name) then
 r=file.remove(t.name)
 print("File "..t.name.."remove")
end
 return r
end

local function add(t)
if file.open("init.lua", "r") then
  print(file.readline())
  file.close()
end
end
local function info()
 remaining, used, total=file.fsinfo()
end

local function rename(t)
 if file.exists(t.old) and file.exists(t.new)then
  r=file.rename(t.old,t.new)
 end
end

return function (t)
 local r
if t.run then r=run(t.run)end
if t.list then r=list()end
if t.init then r=init(t.init)end
if t.save then r=save(t.save)end
if t.del then r=del(t.del)end
 return r
end




