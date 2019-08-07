local frame = CreateFrame('Frame', nil, UIParent)
frame:SetAllPoints(UIParent)

local width = GetScreenWidth() / 64
local height = GetScreenHeight() / 36

for i = 0, 64 do
	local line = frame:CreateTexture(nil, 'BACKGROUND')
	if i == 32 then
		line:SetColorTexture(1, 1, 0, 0.5)
	else
		line:SetColorTexture(1, 1, 1, 0.15)
	end
	line:SetPoint('TOPLEFT', frame, 'TOPLEFT', i * width - 1, 0)
	line:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMLEFT', i * width + 1, 0)
end

for i = 0, 36 do
	local line = frame:CreateTexture(nil, 'BACKGROUND')
	if i == 18 then
		line:SetColorTexture(1, 1, 0, 0.5)
	else
		line:SetColorTexture(1, 1, 1, 0.15)
	end
	line:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, -i * height + 1)
	line:SetPoint('BOTTOMRIGHT', frame, 'TOPRIGHT', 0, -i * height - 1)
end

frame:Show()
