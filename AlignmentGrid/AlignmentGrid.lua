frame = CreateFrame('Frame', nil, UIParent)
frame:SetAllPoints(UIParent)

numberOfVerticalLines = 64
numberOfHorizontalLines = 36

width = GetScreenWidth() / numberOfVerticalLines
height = GetScreenHeight() / numberOfHorizontalLines

for i = 1, (numberOfVerticalLines - 1) do
	local line = frame:CreateLine()
	line:SetThickness(1)

	-- Sets the color of the line based on if it is in the center of the screen
	if i == (numberOfVerticalLines / 2) then
		line:SetColorTexture(1, 1, 0, 0.5)
	else
		line:SetColorTexture(1, 1, 1, 0.25)
	end

	line:SetStartPoint('TOPLEFT', i * width, 0)
	line:SetEndPoint('BOTTOMLEFT', i * width, 0)
end

for i = 1, (numberOfHorizontalLines - 1) do
	local line = frame:CreateLine()
	line:SetThickness(1)

	-- Sets the color of the line based on if it is in the center of the screen
	if i == (numberOfHorizontalLines / 2) then
		line:SetColorTexture(1, 1, 0, 0.5)
	else
		line:SetColorTexture(1, 1, 1, 0.25)
	end

	line:SetStartPoint('BOTTOMLEFT', 0, i * height)
	line:SetEndPoint('BOTTOMRIGHT', 0, i * height)
end

frame:Show()
