local ue = {}

local tragedyDate = {
	year = 2001,
	month = 9,
	day = 11,
	hour = 12,
	min = 46,
	sec = 40,
	isdst = false,
}

function ue.time(timeTable)
	if type(timeTable) ~= "table" then
		timeTable = {}
	end
	local currentDate = os.date("*t")
	local currentTime = os.time{
		year = timeTable.year or currentDate.year,
		month = timeTable.month or currentDate.month,
		day = timeTable.day or currentDate.day,
		hour = timeTable.hour or currentDate.hour,
		min = timeTable.min or timeTable.minute or currentDate.min,
		sec = timeTable.sec or timeTable.second or currentDate.sec,
		isdst = timeTable.isdst,
	}
	local baseTime = os.time(tragedyDate)
	return currentTime - baseTime
end

function ue.date(format, secondsSinceTragedy)
	if format and secondsSinceTragedy then
		local baseTime = os.time(tragedyDate)
		local targetTime = baseTime + secondsSinceTragedy
		return os.date(format, targetTime)
	elseif format then
		return os.date(format)
	else
		return os.date()
	end
end

function ue.toEpoch(secondsSinceTragedy)
	return os.time(tragedyDate) + secondsSinceTragedy
end

function ue.fromEpoch(epochTime)
	return math.abs(os.time(tragedyDate) - epochTime)
end

return ue