local displayTime = true
local useMilitaryTime = false
local displayDayOfWeek = true
local displayDate = true

-- Display Time and Date at top right of screen
Citizen.CreateThread(function()
	
	while true do -- format: | 12:13 | Wednesday | January 17, 2017 |
		Citizen.Wait(1)
		local timeAndDateString = "|"
		
		if displayTime then
			local hour = GetClockHours()
			local minute = GetClockMinutes()
		
			if !useMilitaryTime then
				if hour == 0 or hour == 24 then
					hour = 12
				elseif hour >= 13 then
					hour = hour - 12
				end
			end

			if hour <= 9 then
				hour = "0" .. hour
			end
			
			if minute <= 9 then
				minute = "0" .. minute
			end

			timeAndDateString = timeAndDateString .. " " .. hour .. ":" .. minute .. " |"
		end

		if displayDayOfWeek then
			local dayOfWeek = GetClockDayOfWeek()
			if dayOfWeek == 0 then
				dayOfWeek = "Sunday"
			elseif dayOfWeek == 1 then
				dayOfWeek = "Monday"
			elseif dayOfWeek == 2 then
				dayOfWeek = "Tuesday"
			elseif dayOfWeek == 3 then
				dayOfWeek = "Wednesday"
			elseif dayOfWeek == 4 then
				dayOfWeek = "Thursday"
			elseif dayOfWeek == 5 then
				dayOfWeek = "Friday"
			elseif dayOfWeek == 6 then
				dayOfWeek = "Saturday"
			end
			timeAndDateString = timeAndDateString .. " " .. dayOfWeek .. " |"
		end

		if displayDate then
			local month = GetClockMonth()
			local dayOfMonth = GetClockDayOfMonth()
			local year = GetClockYear()
			
			if month == 0 then
				month = "January"
			elseif month == 1 then
				month = "February"
			elseif month == 2 then
				month = "March"
			elseif month == 3 then
				month = "April"
			elseif month == 4 then
				month = "May"
			elseif month == 5 then
				month = "June"
			elseif month == 6 then
				month = "July"
			elseif month == 7 then
				month = "August"
			elseif month == 8 then
				month = "September"
			elseif month == 9 then
				month = "October"
			elseif month == 10 then
				month = "November"
			elseif month == 11 then
				month = "December"
			end
			timeAndDateString = timeAndDateString .. " " .. month .. " " .. dayOfMonth .. ", " .. year .. " |"
		end
		SetTextFont(0)
		SetTextProportional(1)
		SetTextScale(0.0, 0.55)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")

		AddTextComponentString(timeAndDateString)
		DrawText(0.985, 0.5)
	end
end)
