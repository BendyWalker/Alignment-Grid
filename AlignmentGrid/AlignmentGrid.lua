function CreateLines(numberOfLines, startPoint, endPoint, offsetX, offsetY)
	for index = 1, (numberOfLines - 1) do
		local line = frame:CreateLine()
		line:SetThickness(1)

		if index == (numberOfLines * 0.5) then
			line:SetColorTexture(1, 1, 0, 0.75)
		elseif ((index == (numberOfLines * 0.25)) or (index == (numberOfLines * 0.75))) then
			line:SetColorTexture(1, 1, 0, 0.5)
		else
			line:SetColorTexture(1, 1, 1, 0.25)
		end

		line:SetStartPoint(startPoint, (index * offsetX), (index * offsetY))
		line:SetEndPoint(endPoint, (index * offsetX), (index * offsetY))
	end
end

frame = nil

scale = 4

numberOfVerticalLines = 16 * scale
numberOfHorizontalLines = 9 * scale

width = GetScreenWidth() / numberOfVerticalLines
height = GetScreenHeight() / numberOfHorizontalLines

function HandleSlashCommand(message)
	if frame then
		frame:Hide()
		frame = nil
	else
		frame = CreateFrame('Frame', nil, UIParent)
		frame:SetAllPoints(UIParent)
		CreateLines(numberOfVerticalLines, "TOPLEFT", "BOTTOMLEFT", width, 0)
		CreateLines(numberOfHorizontalLines, "BOTTOMLEFT", "BOTTOMRIGHT", 0, height)
	end
end

SLASH_ALIGNMENTGRID1 = "/align"
SlashCmdList["ALIGNMENTGRID"] = HandleSlashCommand
