function P(v)
	vim.print(v)
end

local function reload(...)
	return require('plenary.reload').reload_module(...)
end

function R(name)
	reload(name)
	return require(name)
end
