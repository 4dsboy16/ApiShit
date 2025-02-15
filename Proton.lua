getgenv().IS_PROTON_LOADED = false
local oldrq = request
local oldlf = listfiles
getgenv().request = function(options)
  if option.Headers then
    options.Headers["User-Agent"] = "Proton/RobloxApp/1.0.1"
  else
    options.Headers = {["User-Agent"] = "Proton/RobloxApp/1.0.1"}
  end
  local response = oldrq(options)
  return response
end
getgenv().cloneref = function(ref)
  if game:FindFirstChild(ref.Name) or ref.Parent == game then 
    return ref
  else
    local class = ref.ClassName
    pcall(function()
      local cloned = Instance.new(class)
    end)
    local mt = {
      __index = ref,
      __newindex = function(t, k, v)
        if k == "Name" then
          ref.Name = v
        end
        rawset(t, k, v)
      end
    }
    local proxy = setmetatable({}, mt)
    return proxy
  end
end
local Params = {
    RepoURL = "https://raw.githubusercontent.com/luau/UniversalSynSaveInstance/main/",
    SSI = "saveinstance",
}
local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
getgenv().saveinstance = function(options)
  options = options or {}
  assert(type(options) == "table", "invalid argument #1 to 'saveinstance' (table expected, got " .. type(options) .. ") ", 2)
  print("saveinstance Powered by UniversalSynSaveInstance | AGPL-3.0 license")
  synsaveinstance(options)
end
getgenv().savegame = getgenv().saveinstance
getgenv().getthread = coroutine.running
getgenv().lrm_load_script = function(script_id)
  return loadstring("https://api.luarmor.net/files/v3/l/" .. script_id .. ".lua")({ Origin = "AWP" })
end
getgenv().shared = shared
local renv = {
	print = print, warn = warn, error = error, shared = shared, assert = assert, collectgarbage = collectgarbage, require = require,
	select = select, tonumber = tonumber, tostring = tostring, type = type, xpcall = xpcall,
	pairs = pairs, next = next, ipairs = ipairs, newproxy = newproxy, rawequal = rawequal, rawget = rawget,
	rawset = rawset, rawlen = rawlen, gcinfo = gcinfo,
	coroutine = {
		create = coroutine.create, resume = coroutine.resume, running = coroutine.running,
		status = coroutine.status, wrap = coroutine.wrap, yield = coroutine.yield,
	},
	bit32 = {
		arshift = bit32.arshift, band = bit32.band, bnot = bit32.bnot, bor = bit32.bor, btest = bit32.btest,
		extract = bit32.extract, lshift = bit32.lshift, replace = bit32.replace, rshift = bit32.rshift, xor = bit32.xor,
	},
	math = {
		abs = math.abs, acos = math.acos, asin = math.asin, atan = math.atan, atan2 = math.atan2, ceil = math.ceil,
		cos = math.cos, cosh = math.cosh, deg = math.deg, exp = math.exp, floor = math.floor, fmod = math.fmod,
		frexp = math.frexp, ldexp = math.ldexp, log = math.log, log10 = math.log10, max = math.max, min = math.min,
		modf = math.modf, pow = math.pow, rad = math.rad, random = math.random, randomseed = math.randomseed,
		sin = math.sin, sinh = math.sinh, sqrt = math.sqrt, tan = math.tan, tanh = math.tanh
	},
	string = {
		byte = string.byte, char = string.char, find = string.find, format = string.format, gmatch = string.gmatch,
		gsub = string.gsub, len = string.len, lower = string.lower, match = string.match, pack = string.pack,
		packsize = string.packsize, rep = string.rep, reverse = string.reverse, sub = string.sub,
		unpack = string.unpack, upper = string.upper,
	},
	table = {
		concat = table.concat, insert = table.insert, pack = table.pack, remove = table.remove, sort = table.sort,
		unpack = table.unpack,
	},
	utf8 = {
		char = utf8.char, charpattern = utf8.charpattern, codepoint = utf8.codepoint, codes = utf8.codes,
		len = utf8.len, nfdnormalize = utf8.nfdnormalize, nfcnormalize = utf8.nfcnormalize,
	},
	os = {
		clock = os.clock, date = os.date, difftime = os.difftime, time = os.time,
	},
	delay = delay, elapsedTime = elapsedTime, spawn = spawn, tick = tick, time = time, typeof = typeof,
	UserSettings = UserSettings, version = version, wait = wait, _VERSION = _VERSION,
	task = {
		defer = task.defer, delay = task.delay, spawn = task.spawn, wait = task.wait,
	},
	debug = {
		traceback = debug.traceback, profilebegin = debug.profilebegin, profileend = debug.profileend, info = debug.info 
	},
	game = game, workspace = workspace, Game = game, Workspace = workspace,
	getmetatable = getmetatable, setmetatable = setmetatable
}
table.freeze(renv)
getgenv().getrenv = function()
  return renv
end
getgenv().getaffiliateid = function()
  return "Proton"
end
getgenv().getexecutorname = function()
  return "Proton"
end
getgenv().getexecutorversion = function()
  return "v1.0.1"
end
getgenv().identifyexecutor = function()
  return getgenv().getexecutorname(), getgenv().getexecutorversion
end
if not shared.vulnsm then
  getgenv().listfiles = function(path)
    if path == "" or path == blockedpaths then 
      return error("[ Proton ]: Invalid path", 2)
    else 
      return oldlf(path)
    end
  end
  print("[ Proton ]: Vulns mitigated.")
  shared.vulnsm = true
end
if not shared.notified then 
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Proton Loaded",
    Text = "You are ready to execute scripts now.\nhttps://discord.gg/ZhGUcqRfkJ", 
    Duration = 3,
    Icon = "rbxassetid://136874313360847" 
  })
  shared.notified = true 
end
getgenv().IS_PROTON_LOADED = true
