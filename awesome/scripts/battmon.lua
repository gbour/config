mybattmon = widget({ type = "textbox", name = "mybattmon", align = "right" })

--
-- TODO: use inotify to update changes instead of timer
--

function battery_status ()
	-- return "<span>Ƞ♻♼⌁↰↯↺↹↻☀♾⚠⚡⦾⦿⚀⚁⚂⚃⚄</span>"
    local fd=io.popen("acpi", "r") 
    local line = fd:read()

	-- Battery 0: Discharging, 74%, 01:59:17 remaining
	-- Battery 0: Charging, 64%, 00:43:59 until charged
	-- Battery 0: Charging, 100%,  until charged
	
	local state, capacity = string.match(line, "Battery.*: (%w+), (%d+)%%")
	if state == nil then
		return "battmon:?nil"
	end

	local levels = "⚀⚁⚂⚃⚄⚅"
	local dots   = math.floor(capacity/20)

	local label = ""
	if state == "Charging" then
		label = "⚡"
	elseif state == "Discharging" then
		label = "↯"
	elseif state == "Full" then
		label = "⦿"
	end

	if state ~= "Full" then
		color = "white"
		if dots == 0 then
			color = "red"
		elseif dots == 1 then
			color = "orange"
		end
		
		label = label .. "<span color=\"" .. color .. "\">" .. string.sub(levels, (1 + 3*dots), (3 + 3*dots)) .. "</span>"

		local time = string.match(line, "%%, ([%d:]*) ")
		if time ~= nil and string.len(time) > 0 then
			label = label .. " " .. time
		end
	end

	return label
end

mybattmon.text = " ⁞ " .. battery_status() .. " ⁞ "
my_battmon_timer=timer({timeout=30})
my_battmon_timer:add_signal("timeout", function()
    mybattmon.text = " ⁞ " .. battery_status() .. " ⁞ "
end)
my_battmon_timer:start()
