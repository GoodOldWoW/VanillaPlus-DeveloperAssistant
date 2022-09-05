local class = ''
local f = CreateFrame('FRAME')
f:RegisterEvent('PLAYER_LOGIN')
f:SetScript('OnEvent', function()
	class = UnitClass('player')
	if not VP_DA_TALENTS then VP_DA_TALENTS = {} end
	if not VP_DA_TALENTS[class] then VP_DA_TALENTS[class] = {} end
end)
--[[
local HookSetTalent = GameTooltip.SetTalent
function GameTooltip.SetTalent(self, tabIndex, talentIndex)
	HookSetTalent(self, tabIndex, talentIndex)
	if IsAltKeyDown() then
		local talent = tabIndex .. '-' .. talentIndex
		VP_DA_TALENTS[class][talent] = {}
		for i = 1, GameTooltip:NumLines() do
			table.insert(VP_DA_TALENTS[class][talent], getglobal('GameTooltipTextLeft' .. i):GetText())
			if getglobal('GameTooltipTextRight' .. i):IsVisible() then
				table.insert(VP_DA_TALENTS[class][talent], getglobal('GameTooltipTextRight' .. i):GetText())
			end
		end
	end
end
]]

local HookSetTalent = GameTooltip.SetTalent
function GameTooltip.SetTalent(self, tabIndex, talentIndex)
	HookSetTalent(self, tabIndex, talentIndex)
	if IsAltKeyDown() then
		local tableTalent = {}
		table.insert(tableTalent, tabIndex .. '-' .. talentIndex)
		for i = 1, GameTooltip:NumLines() do
			table.insert(tableTalent, getglobal('GameTooltipTextLeft' .. i):GetText())
			if getglobal('GameTooltipTextRight' .. i):IsVisible() then
				table.insert(tableTalent, getglobal('GameTooltipTextRight' .. i):GetText())
			end
		end
		table.insert(VP_DA_TALENTS[class], tableTalent)
	end
end
