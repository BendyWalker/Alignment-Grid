frame = CreateFrame('Frame', nil, UIParent)
frame:SetAllPoints(UIParent)

numberOfVerticalLines = 64
numberOfHorizontalLines = 36

width = GetScreenWidth() / numberOfVerticalLines
height = GetScreenHeight() / numberOfHorizontalLines

	local line = frame:CreateTexture(nil, 'BACKGROUND')
for i = 0, numberOfVerticalLines do
	if i == (numberOfVerticalLines / 2) then
		line:SetColorTexture(1, 1, 0, 0.5)
	else
		line:SetColorTexture(1, 1, 1, 0.15)
	end
	line:SetPoint('TOPLEFT', frame, 'TOPLEFT', i * width - 1, 0)
	line:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMLEFT', i * width + 1, 0)
end

for i = 0, numberOfHorizontalLines do
	local line = frame:CreateTexture(nil, 'BACKGROUND')
	if i == (numberOfHorizontalLines / 2) then
		line:SetColorTexture(1, 1, 0, 0.5)
	else
		line:SetColorTexture(1, 1, 1, 0.15)
	end
	line:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, -i * height + 1)
	line:SetPoint('BOTTOMRIGHT', frame, 'TOPRIGHT', 0, -i * height - 1)
end

frame:Show()
