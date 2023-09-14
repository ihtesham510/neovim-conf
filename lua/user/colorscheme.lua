function Date(t)
	local c
	t = tonumber(t)
	if t > 18 then
		c = "midnight" -- am
	else
		c = "nightfly" -- pm
	end
	return c
end

local time = os.date("%H")
local colorscheme = Date(time)
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
