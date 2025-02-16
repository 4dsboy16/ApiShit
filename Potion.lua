getgenv().IS_POTION_LOADED = false
local oldrq = request
local oldlf = listfiles
local hwid = HttpService:GenerateGUID(false)
getgenv().request = function(options)
  if option.Headers then
    options.Headers["User-Agent"] = "Potion/RobloxApp/1.0.1"
    options.Headers["Potion-Fingerprint"] = tostring(hwid)
    options.Headers["Xeno-Fingerprint"] = nil
  else
    options.Headers = {["User-Agent"] = "Potion/RobloxApp/1.0.1", ["Potion-Fingerprint"] = tostring(hwid), ["Xeno-Fingerprint"] = nil}
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
  print("[ Potion ]: Powered by UniversalSynSaveInstance")
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
  return "Potion"
end
getgenv().getexecutorname = function()
  return "Potion"
end
getgenv().getexecutorversion = function()
  return "v1.0.1"
end
getgenv().identifyexecutor = function()
  return getgenv().getexecutorname(), getgenv().getexecutorversion
end
getgenv().gethwid = function()
  return hwid
end
getgenv().get_hwid = getgenv().gethwid
if not shared.aliases then
  getgenv().debug = table.clone(debug)
  getgenv().debug.getconstant = function(f, i) 
    return "[ Potion ]: Not implemented"
  end 
  getgenv().debug.getconstants = function(f) 
    return "[ Potion ]: Not implemented"
  end 
  getgenv().debug.getproto = function(f, i, e) 
    return "[ Potion ]: Not implemented"
  end 
  getgenv().debug.getprotos = function(f) 
    return "[ Potion ]: Not implemented"
  end 
  getgenv().debug.getstack = function(f, i) 
    return "[ Potion ]: Not implemented"
  end 
  getgenv().debug.getupvalue = function(f, i) 
    return "[ Potion ]: Not implemented"
  end 
  getgenv().debug.getupvalues = function(f) 
    return "[ Potion ]: Not implemented"
  end 
  getgenv().debug.setconstant = function(f, i, v) 
    return "[ Potion ]: Not implemented"
  end 
  getgenv().debug.setstack = function(f, i, v) 
    return "[ Potion ]: Not implemented"
  end 
  getgenv().debug.validlevel = function(f, i, v) 
    return "[ Potion ]: Not implemented"
  end 
  getgenv().debug.getcallstack = function(f, i, v) 
    return "[ Potion ]: Not implemented"
  end
  getgenv().get_calling_script = getcallingscript 
  getgenv().isreadable = isreadonly 
  getgenv().isexecclosure = isexecutorclosure
  getgenv().is_executor_closure = isexecclosure
  getgenv().clonefunc = clonefunction
  getgenv().get_scripts = getrunningscripts
  getgenv().getmodules = getloadedmodules
  getgenv().makereadonly = setreadonly
  getgenv().make_readonly = getgenv().makereadonly
  getgenv().is_l_closure = islclosure 
  getgenv().randomstring = crypt.random
  getgenv().syn.write_clipboard = setclipboard
  getgenv().setrbxclipboard = setclipboard
  getgenv().writeclipboard = setclipboard
  getgenv().syn_backup = getgenv().syn
  getgenv().syn.crypt = getgenv().crypt
  getgenv().syn.crypto = getgenv().crypt
  getgenv().syn.cache_replace = cache.replace 
  getgenv().syn.cache_invalidate = cache.invalidate 
  getgenv().syn.is_cached = cache.iscached 
  getgenv().syn.set_thread_identity = setthreadidentity 
  getgenv().syn.request = request 
  getgenv().syn.get_thread_identity = getthreadidentity 
  getgenv().syn.queue_on_teleport = queueonteleport 
  getgenv().fluxus = {}
  getgenv().fluxus.set_thread_identity = setthreadidentity 
  getgenv().fluxus.queue_on_teleport = queueonteleport
  getgenv().fluxus.request = request 
  getgenv().string = string
  getgenv().dumpbytecode = getscriptbytecode 
  getgenv().loadfileasync = loadfile
  getgenv().clearconsole = rconsoleclear 
  getgenv().printconsole = rconsoleprint 
  getgenv().getsynasset = getcustomasset 
  getgenv().debug.getregistry = getreg 
  getgenv().readfileasync = readfile 
  getgenv().writefileasync = writefile
  getgenv().appendfileasync = appendfile 
  getgenv().saveplace = saveinstance 
  getgenv().protect_gui = syn.protect_gui 
  getgenv().unprotect_gui = syn.unprotect_gui 
  getgenv().set_thread_identity = setthreadidentity 
  getgenv().get_thread_identity = getthreadidentity 
  getgenv().checkcallstack = checkcaller 
  getgenv().rconsoleerror = getgenv().rconsoleerr 
  getgenv().rconsolename = getgenv().rconsolesettitle
  getgenv().consolesettitle = getgenv().rconsolesettitle
  getgenv().consolename = getgenv().rconsolesettitle
  getgenv().rconsoleinputasync = getgenv().rconsoleinput
  getgenv().consoleclear = getgenv().rconsoleclear
  getgenv().consoledestroy = getgenv().rconsoledestroy
  getgenv().consoleinput = getgenv().rconsoleinput
  getgenv().consoleprint = getgenv().rconsoleprint
  getgenv().consoleinfo = getgenv().rconsoleinfo
  getgenv().consolecreate = getgenv().rconsolecreate
  getgenv().consolewarn = getgenv().rconsolewarn
  getgenv().syn.protectgui = getgenv().syn.protect_gui
  getgenv().syn.unprotectgui = getgenv().syn.unprotect_gui
  getgenv().getprotectedguis = getgenv().getprotecteduis
  getgenv().debug.isvalidlevel = getgenv().debug.validlevel
  getgenv().is_our_closure = isexecutorclosure 
  getgenv().issynapsefunction = isexecutorclosure
  getgenv().ispotionfunction = isexecutorclosure
  shared.aliases = true
end
if not shared.vulnsm then
  getgenv().listfiles = function(path)
    if path == "" or path == blockedpaths then 
      return error("[ Potion ]: Invalid path", 2)
    else 
      return oldlf(path)
    end
  end
  print("[ Potion ]: Vulns mitigated.")
  shared.vulnsm = true
end
if not shared.notified then 
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Potion Loaded",
    Text = "You are ready to execute scripts now.\nhttps://discord.gg/ZhGUcqRfkJ", 
    Duration = 3,
    Icon = "rbxassetid://136874313360847" 
  })
  shared.notified = true 
end
getgenv().IS_POTION_LOADED = true
