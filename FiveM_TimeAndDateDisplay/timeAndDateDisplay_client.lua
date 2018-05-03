local displayTime = true
local useMilitaryTime = false
local displayDayOfWeek = true
local displayDate = true

local timeAndDateString = nil
local hour
local minute
local dayOfWeek
local month
local dayOfMonth
local year

local lang = 'en'
local txt = {
  ['fr'] = {
		['Sunday']    = 'Dimanche',
		['Monday']    = 'Lundi',
		['Tuesday']   = 'Mardi',
		['Wednesday'] = 'Mercredi',
		['Thursday']  = 'Jeudi',
		['Friday']    = 'Vendredi',
		['Saturday']  = 'Samedi',
		['January']   = 'Janvier',
		['February']  = 'Fevrier',
		['March']     = 'Mars',
		['April']     = 'Avril',
		['May']       = 'Mai',
		['June']      = 'Juin',
		['July']      = 'Juillet',
		['August']    = 'Aout',
		['September'] = 'Septembre',
		['October'] 	= 'Octobre',
		['November']  = 'Novembre',
		['December']  = 'Décembre'
  },

	['en'] = {
		['Sunday']    = 'Sunday',
		['Monday']    = 'Monday',
		['Tuesday']   = 'Tuesday',
		['Wednesday'] = 'Wednesday',
		['Thursday']  = 'Thursday',
		['Friday'] 	  = 'Friday',
		['Saturday']  = 'Saturday',
		['January'] 	= 'January',
		['February']  = 'February',
		['March'] 		= 'March',
		['April'] 		= 'April',
		['May']  	    = 'May',
		['June'] 	    = 'June',
		['July'] 	    = 'July',
		['August']    = 'August',
		['September'] = 'September',
		['October']   = 'October',
		['November']  = 'November',
		['December']  = 'December'
	}
}

-- Display Time and Date at top right of screen -- format: | 12:13 | Wednesday | January 17, 2017 |
Citizen.CreateThread(function()
	while true do
		Wait(1)
		timeAndDateString = "|"

		if displayTime == true then
			CalculateTimeToDisplay()
			timeAndDateString = timeAndDateString .. " " .. hour .. ":" .. minute .. " |"
		end
		if displayDayOfWeek == true then
			CalculateDayOfWeekToDisplay()
			timeAndDateString = timeAndDateString .. " " .. dayOfWeek .. " |"
		end
		if displayDate == true then
			CalculateDateToDisplay()
			timeAndDateString = timeAndDateString .. " " .. month .. " " .. dayOfMonth .. ", " .. year .. " |"
		end

		SetTextFont(0)
		SetTextProportional(1)
		SetTextScale(0.30, 0.30)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextRightJustify(true)
		SetTextWrap(0,0.95)
		SetTextEntry("STRING")

		AddTextComponentString(timeAndDateString)
		DrawText(0.5, 0.01)
	end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()

	if useMilitaryTime == false then
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
end

function CalculateDayOfWeekToDisplay()
	dayOfWeek = GetClockDayOfWeek()

	if dayOfWeek == 0 then
		dayOfWeek = (txt[lang]['Sunday'])
	elseif dayOfWeek == 1 then
		dayOfWeek = (txt[lang]['Monday'])
	elseif dayOfWeek == 2 then
		dayOfWeek = (txt[lang]['Tuesday'])
	elseif dayOfWeek == 3 then
		dayOfWeek = (txt[lang]['Wednesday'])
	elseif dayOfWeek == 4 then
		dayOfWeek = (txt[lang]['Thursday'])
	elseif dayOfWeek == 5 then
		dayOfWeek = (txt[lang]['Friday'])
	elseif dayOfWeek == 6 then
		dayOfWeek = (txt[lang]['Saturday'])
	end
end

function CalculateDateToDisplay()
	month = GetClockMonth()
	dayOfMonth = GetClockDayOfMonth()
	year = GetClockYear()

	if month == 0 then
		month = (txt[lang]['Saturday'])
	elseif month == 1 then
		month = (txt[lang]['Saturday'])
	elseif month == 2 then
		month = (txt[lang]['Saturday'])
	elseif month == 3 then
		month = (txt[lang]['Saturday'])
	elseif month == 4 then
		month = (txt[lang]['Saturday'])
	elseif month == 5 then
		month = (txt[lang]['Saturday'])
	elseif month == 6 then
		month = (txt[lang]['Saturday'])
	elseif month == 7 then
		month = (txt[lang]['Saturday'])
	elseif month == 8 then
		month = (txt[lang]['Saturday'])
	elseif month == 9 then
		month = (txt[lang]['Saturday'])
	elseif month == 10 then
		month = (txt[lang]['Saturday'])
	elseif month == 11 then
		month = (txt[lang]['Saturday'])
	end
end
