frame = CreateFrame('Frame', nil, UIParent)
frame:SetAllPoints(UIParent)

numberOfVerticalLines = 64
numberOfHorizontalLines = 36

width = GetScreenWidth() / numberOfVerticalLines
height = GetScreenHeight() / numberOfHorizontalLines

function CreateLines(numberOfLines, startPoint, endPoint, offsetX, offsetY)
	for index = 1, (numberOfLines - 1) do
		local line = frame:CreateLine()
		line:SetThickness(1)

		-- Sets the color of the line based on if it is in the center of the screen
		if index == (numberOfLines / 2) then
			line:SetColorTexture(1, 1, 0, 0.5)
		else
			line:SetColorTexture(1, 1, 1, 0.25)
		end

		line:SetStartPoint(startPoint, (index * offsetX), (index * offsetY))
		line:SetEndPoint(endPoint, (index * offsetX), (index * offsetY))
	end
end

CreateLines(numberOfVerticalLines, 'TOPLEFT', 'BOTTOMLEFT', width, 0)
CreateLines(numberOfHorizontalLines, 'BOTTOMLEFT', 'BOTTOMRIGHT', 0, height)

frame:Show()
