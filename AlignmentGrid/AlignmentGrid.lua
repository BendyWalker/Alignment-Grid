-- Draws a number of repeating white lines from start point to end point at
-- offset intervals onto parent frame. Highlights lines at  1/4, 1/2 and 3/4
-- intervals in yellow.
function CreateLines(parentFrame, numberOfLines, startPoint, endPoint, offsetX, offsetY)
	for index = 1, (numberOfLines - 1) do
		local line = parentFrame:CreateLine()
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

-- Draws a square grid of a given scale onto parent frame.
function CreateGrid(parentFrame, scale)
	numberOfVerticalLines = 16 * scale
	numberOfHorizontalLines = 9 * scale
	width = GetScreenWidth() / numberOfVerticalLines
	height = GetScreenHeight() / numberOfHorizontalLines
	CreateLines(frame, numberOfVerticalLines, "TOPLEFT", "BOTTOMLEFT", width, 0)
	CreateLines(frame, numberOfHorizontalLines, "BOTTOMLEFT", "BOTTOMRIGHT", 0, height)
end


-- The frame on which to render the grid.
frame = nil

function HandleSlashCommand(message)
	if frame then
		frame:Hide()
		frame = nil
	else
		frame = CreateFrame('Frame', nil, UIParent)
		frame:SetAllPoints(UIParent)

		if message == "large" then
			scale = 2
		elseif message == "small" then
			scale = 8
		elseif message == "tiny" then
			scale = 16
		else
			scale = 4
		end

		CreateGrid(frame, scale)
	end
end

SLASH_ALIGNMENTGRID1 = "/align"
SLASH_ALIGNMENTGRID2 = "/aligngrid"
SLASH_ALIGNMENTGRID3 = "/alignmentgrid"
SlashCmdList["ALIGNMENTGRID"] = HandleSlashCommand
