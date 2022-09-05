local i = ''
local f = CreateFrame('FRAME')
f:RegisterEvent('PLAYER_LOGIN')
f:SetScript('OnEvent', function()
	i = UnitClass('player')
	if not VP_DA_TALENTS    then VP_DA_TALENTS    = {} end
	if not VP_DA_TALENTS[i] then VP_DA_TALENTS[i] = {} end
end)

local HookSetTalent = GameTooltip.SetTalent
function GameTooltip.SetTalent(self, tabIndex, talentIndex)
	HookSetTalent(self, tabIndex, talentIndex)
	if IsAltKeyDown() then
		local j = tabIndex .. '-' .. talentIndex
		VP_DA_TALENTS[i][j] = {}
		for i = 1, GameTooltip:NumLines() do
			table.insert(VP_DA_TALENTS[i][j], getglobal('GameTooltipTextLeft' .. i):GetText())
			if getglobal('GameTooltipTextRight' .. i):IsVisible() then
				table.insert(VP_DA_TALENTS[i][j], getglobal('GameTooltipTextRight' .. i):GetText())
			end
		end
	end
end
