local player = game.Players.LocalPlayer

-- Создаем ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Создаем Frame для меню
local Menu = Instance.new("Frame")
Menu.Name = "CustomMenu"
Menu.Size = UDim2.new(0.33, 0, 0.82, 0)  -- Увеличим высоту меню
Menu.Position = UDim2.new(0.17, 0, 0.44, 0)
Menu.AnchorPoint = Vector2.new(0.5, 0.5)
Menu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Menu.BorderSizePixel = 0
Menu.ClipsDescendants = true
Menu.Parent = screenGui

local function CreateTextBox(placeholderText, position)
	local textBox = Instance.new("TextBox")
	textBox.Name = "CustomTextBox"
	textBox.Size = UDim2.new(0.8, 0, 0.08, 0)
	textBox.Position = position
	textBox.AnchorPoint = Vector2.new(0.5, 0)
	textBox.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	textBox.BorderColor3 = Color3.fromRGB(100, 100, 100)
	textBox.BorderSizePixel = 2
	textBox.Font = Enum.Font.SourceSans
	textBox.PlaceholderText = placeholderText
	textBox.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
	textBox.TextColor3 = Color3.new(1, 1, 1)
	textBox.TextSize = 20
	textBox.TextWrapped = true
	textBox.Parent = Menu
	return textBox
end

-- Функция для создания кнопки
local function CreateButton(text, position)
	local button = Instance.new("TextButton")
	button.Name = "CustomButton"
	button.Text = text
	button.Size = UDim2.new(0.8, 0, 0.08, 0)
	button.Position = position
	button.AnchorPoint = Vector2.new(0.5, 0)
	button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	button.BorderColor3 = Color3.fromRGB(100, 100, 100)
	button.BorderSizePixel = 2
	button.Font = Enum.Font.SourceSans
	button.TextColor3 = Color3.new(1, 1, 1)
	button.TextSize = 20
	button.TextWrapped = true
	button.Parent = Menu
	return button
end

-- Функция для создания чекбокса
local function CreateCheckBox(text, position, clickHandler)
	local checkBoxFrame = Instance.new("Frame")
	checkBoxFrame.Name = "CustomCheckBoxFrame"
	checkBoxFrame.Size = UDim2.new(0.8, 0, 0.1, 0)
	checkBoxFrame.Position = position
	checkBoxFrame.AnchorPoint = Vector2.new(0.5, 0)
	checkBoxFrame.BackgroundTransparency = 1
	checkBoxFrame.Parent = Menu

	local checkBox = Instance.new("TextButton")
	checkBox.Name = "CustomCheckBox"
	checkBox.Text = ""
	checkBox.Size = UDim2.new(0.1, 0, 0.5, 0)
	checkBox.Position = UDim2.new(0, 0, 0, 0)
	checkBox.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	checkBox.BorderColor3 = Color3.fromRGB(100, 100, 100)
	checkBox.BorderSizePixel = 2
	checkBox.Font = Enum.Font.SourceSans
	checkBox.TextSize = 20
	checkBox.AutoButtonColor = false
	checkBox.Parent = checkBoxFrame

	local checkMark = Instance.new("Frame")
	checkMark.Name = "CheckMark"
	checkMark.Size = UDim2.new(0.8, 0, 0.8, 0)
	checkMark.Position = UDim2.new(0.1, 0, 0.1, 0)
	checkMark.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
	checkMark.BorderSizePixel = 0
	checkMark.Visible = false
	checkMark.Parent = checkBox

	checkBox.MouseButton1Click:Connect(function()
		checkMark.Visible = not checkMark.Visible
		if clickHandler then
			clickHandler() -- Вызываем обработчик клика, если он задан
		end
	end)

	local checkText = Instance.new("TextLabel")
	checkText.Name = "CheckText"
	checkText.Text = text
	checkText.Size = UDim2.new(0.55, 0, 0.5, 0)
	checkText.Position = UDim2.new(0.15, 0, 0, 0)
	checkText.BackgroundTransparency = 1
	checkText.Font = Enum.Font.SourceSans
	checkText.TextSize = 20
	checkText.TextColor3 = Color3.new(1, 1, 1)
	checkText.TextWrapped = true
	checkText.Parent = checkBoxFrame

	return checkBoxFrame
end

local function CreateDropdown(options, position)
	local dropdownFrame = Instance.new("Frame")
	dropdownFrame.Name = "CustomDropdownFrame"
	dropdownFrame.Size = UDim2.new(0.4, 0, 0.08, 0)
	dropdownFrame.Position = position
	dropdownFrame.AnchorPoint = Vector2.new(0.5, 0)
	dropdownFrame.BackgroundColor3 = Color3.fromRGB(50, 200, 165)
	dropdownFrame.BorderSizePixel = 2
	dropdownFrame.Parent = Menu

	local dropdownButton = Instance.new("TextButton")
	dropdownButton.Name = "CustomDropdownButton"
	dropdownButton.Text = "Select Option"
	dropdownButton.TextColor3 = Color3.new(0, 0, 0)
	dropdownButton.Size = UDim2.new(1, 0, 1, 0)
	dropdownButton.Position = UDim2.new(0, 0, 0, 0)
	dropdownButton.BackgroundColor3 = Color3.fromRGB(145, 140, 140)  -- Обновлен цвет фона
	dropdownButton.BorderColor3 = Color3.fromRGB(107, 105, 105)
	dropdownButton.BorderSizePixel = 0
	dropdownButton.Parent = dropdownFrame

	local dropdownOptionsFrame = Instance.new("Frame")
	dropdownOptionsFrame.Name = "OptionsFrame"
	dropdownOptionsFrame.Size = UDim2.new(1, 0, 0, 0)
	dropdownOptionsFrame.Position = UDim2.new(0, 0, 1, 0)
	dropdownOptionsFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	dropdownOptionsFrame.BorderSizePixel = 0
	dropdownOptionsFrame.Visible = false
	dropdownOptionsFrame.Parent = dropdownFrame

	dropdownButton.MouseButton1Click:Connect(function()
		dropdownOptionsFrame.Visible = not dropdownOptionsFrame.Visible
	end)

	for i, optionText in ipairs(options) do
		local optionButton = Instance.new("TextButton")
		optionButton.Name = "OptionButton"
		optionButton.Text = optionText
		optionButton.Size = UDim2.new(1, 0, 0, 30)
		optionButton.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
		optionButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		optionButton.BorderSizePixel = 0
		optionButton.Font = Enum.Font.SourceSans
		optionButton.TextColor3 = Color3.new(1, 1, 1)
		optionButton.TextSize = 20
		optionButton.Parent = dropdownOptionsFrame

		optionButton.MouseButton1Click:Connect(function()
			dropdownButton.Text = optionText
			dropdownOptionsFrame.Visible = false
		end)
	end

	return dropdownButton
end

local function CreateSlider(minValue, maxValue, defaultValue, position, labelText, callback)
	local sliderFrame = Instance.new("Frame")
	sliderFrame.Name = "CustomSliderFrame"
	sliderFrame.Size = UDim2.new(0.8, 0, 0.08, 0)
	sliderFrame.Position = position
	sliderFrame.AnchorPoint = Vector2.new(0.5, 0)
	sliderFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	sliderFrame.BorderSizePixel = 2
	sliderFrame.Parent = Menu

	local sliderLabel = Instance.new("TextLabel")
	sliderLabel.Name = "SliderLabel"
	sliderLabel.Text = labelText or "Player Speed:"
	sliderLabel.Size = UDim2.new(0, 100, 0, 20)
	sliderLabel.Position = UDim2.new(0.5, -50, 0, -25)
	sliderLabel.BackgroundTransparency = 1
	sliderLabel.Font = Enum.Font.SourceSans
	sliderLabel.TextColor3 = Color3.new(1, 1, 1)
	sliderLabel.TextSize = 16
	sliderLabel.Parent = sliderFrame

	local slider = Instance.new("TextLabel")
	slider.Name = "CustomSlider"
	slider.Text = ""
	slider.Size = UDim2.new(0, 150, 0, 20)
	slider.Position = UDim2.new(0, 0, 0.5, -10)
	slider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	slider.BorderSizePixel = 0
	slider.Parent = sliderFrame

	local sliderButton = Instance.new("TextButton")
	sliderButton.Name = "SliderButton"
	sliderButton.Text = ""
	sliderButton.Size = UDim2.new(0, 20, 0, 20)
	sliderButton.Position = UDim2.new(0, 0, 0.5, -10)
	sliderButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	sliderButton.BorderColor3 = Color3.fromRGB(100, 100, 100)
	sliderButton.BorderSizePixel = 2
	sliderButton.Parent = slider

	local valueLabel = Instance.new("TextLabel")
	valueLabel.Name = "ValueLabel"
	valueLabel.Text = defaultValue
	valueLabel.Size = UDim2.new(0, 30, 0, 20)
	valueLabel.Position = UDim2.new(1, 5, 0.5, -10)
	valueLabel.BackgroundTransparency = 1
	valueLabel.Font = Enum.Font.SourceSans
	valueLabel.TextColor3 = Color3.new(1, 1, 1)
	valueLabel.TextSize = 16
	valueLabel.Parent = sliderFrame

	local dragging = false
	local function updateValue(mouseX)
		local sliderPosition = math.clamp(mouseX - slider.AbsolutePosition.X, 0, sliderFrame.AbsoluteSize.X)
		local percentage = sliderPosition / sliderFrame.AbsoluteSize.X
		local value = math.floor(minValue + (maxValue - minValue) * percentage)
		slider.Size = UDim2.new(percentage, 0, 0, 20)
		sliderButton.Position = UDim2.new(percentage, -10, 0.5, -10)
		valueLabel.Text = value
		-- Вызываем функцию обратного вызова с новым значением
		if callback then
			callback(value)
		end
	end

	sliderButton.MouseButton1Down:Connect(function()
		dragging = true
	end)

	game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			updateValue(input.Position.X)
		end
	end)

	updateValue(sliderButton.AbsolutePosition.X)

	return sliderFrame
end

local function CreateToggleSwitch(defaultValue, position)
	local toggleFrame = Instance.new("Frame")
	toggleFrame.Name = "CustomToggleFrame"
	toggleFrame.Size = UDim2.new(0.2, 0, 0.08, 0)
	toggleFrame.Position = position
	toggleFrame.AnchorPoint = Vector2.new(0.5, 0)
	toggleFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	toggleFrame.BorderSizePixel = 0
	toggleFrame.Parent = Menu

	local toggleKnob = Instance.new("TextButton")
	toggleKnob.Name = "ToggleKnob"
	toggleKnob.Text = ""
	toggleKnob.Size = UDim2.new(0.5, 0, 1, 0)
	toggleKnob.Position = UDim2.new(defaultValue and 0.5 or 0, 0, 0, 0)
	toggleKnob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	toggleKnob.BorderColor3 = Color3.fromRGB(100, 100, 100)
	toggleKnob.BorderSizePixel = 2
	toggleKnob.Parent = toggleFrame

	local isToggled = defaultValue
	local function updateToggleVisual()
		toggleKnob:TweenPosition(UDim2.new(isToggled and 0.5 or 0, 0, 0, 0), "Out", "Quad", 0.3, true)
		toggleKnob.BackgroundColor3 = isToggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)
	end

	toggleKnob.MouseButton1Click:Connect(function()
		isToggled = not isToggled
		updateToggleVisual()
	end)

	updateToggleVisual()

	return toggleFrame
end


local Button1 = CreateButton("Hoop Farm", UDim2.new(0.5, 0, 0.07, 0))
local Button2 = CreateButton("Get All Gems in map", UDim2.new(0.5, 0, 0.19, 0))
local Button3 = CreateButton("Get All Orbs in map", UDim2.new(0.5, 0, 0.31, 0))
local Button4 = CreateButton("Super Fast Farm Gem", UDim2.new(0.5, 0, 0.43, 0))
local Button5 = CreateButton("Super Fast Farm Orbs", UDim2.new(0.5, 0, 0.55, 0))

local function HoopFarm()
	for i,v in pairs(game:GetDescendants()) do
		if v.Name == 'Hoop' then
			v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			wait(0.1)
		end
	end

	while true do
		local humanoid = game.Players.LocalPlayer.Character.Humanoid
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping) -- Перевод игрока в состояние прыжка
		wait(11) -- Ожидание 5 секунд перед следующим прыжком
	end
end

Button1.MouseButton1Click:Connect(HoopFarm)

local function MoveGemsToPlayer()
	local localPlayer = game.Players.LocalPlayer
	if not localPlayer or not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return -- если нет LocalPlayer, его персонажа или HumanoidRootPart, выходим из функции
	end

	local rootPartCFrame = localPlayer.Character.HumanoidRootPart.CFrame
	local orbFolder = game.Workspace:FindFirstChild("orbFolder")
	if orbFolder and orbFolder:FindFirstChild("City") then
		local cityFolder = orbFolder.City
		for _, descendant in ipairs(cityFolder:GetDescendants()) do
			if descendant:IsA("Model") and descendant.Name == "Gem" then
				descendant:SetPrimaryPartCFrame(rootPartCFrame)
				wait(0.1)
			end
		end
	else
		warn("Не удалось найти orbFolder.City в Workspace.")
	end
end

Button2.MouseButton1Click:Connect(MoveGemsToPlayer)

local function MoveOrbsToPlayer()
	local localPlayer = game.Players.LocalPlayer
	if not localPlayer or not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return -- если нет LocalPlayer, его персонажа или HumanoidRootPart, выходим из функции
	end

	local rootPartCFrame = localPlayer.Character.HumanoidRootPart.CFrame
	local orbFolder = game.Workspace:FindFirstChild("orbFolder")
	if orbFolder and orbFolder:FindFirstChild("City") then
		local cityFolder = orbFolder.City
		for _, descendant in ipairs(cityFolder:GetChildren()) do
			if descendant.Name == "Yellow Orb" or descendant.Name == "Blue Orb" or descendant.Name == "Orange Orb" or descendant.Name == "Red Orb" then
				descendant:SetPrimaryPartCFrame(rootPartCFrame)
			end
		end
	else
		warn("Не удалось найти orbFolder.City в Workspace.")
	end
end


-- Вызываем функцию
Button3.MouseButton1Click:Connect(MoveOrbsToPlayer)


local function SuperFarmGems()

local args = {
	[1] = "collectOrb",
	[2] = "Gem",
	[3] = "City"
}

local args1 = {
	[1] = "collectOrb",
	[2] = "Gem",
	[3] = "City"
}

local args2 = {
	[1] = "collectOrb",
	[2] = "Gem",
	[3] = "City"
}

game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
	while true do
		SuperFarmGems()
		wait(0.05) -- Подождать перед следующим вызовом (можно изменить интервал)
	end
end

Button4.MouseButton1Click:Connect(SuperFarmGems)


local function SuperFarmOrbs()

local args = {
	[1] = "collectOrb",
	[2] = "Orange Orb",
	[3] = "City"
}

local args1 = {
	[1] = "collectOrb",
	[2] = "Red Orb",
	[3] = "City"
}

local args2 = {
	[1] = "collectOrb",
	[2] = "Blue Orb",
	[3] = "City"
}

local args3 = {
	[1] = "collectOrb",
	[2] = "Yellow Orb",
	[3] = "City"
}

game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))

Button5.MouseButton1Click:Connect(SuperFarmOrbs)
	while true do
		SuperFarmOrbs()
		wait(0.05) -- Подождать перед следующим вызовом (можно изменить интервал)
	end
end

local function AutoAcceptRace()
	
	local args = {
		[1] = "joinRace"
	}

	game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer(unpack(args))
	
	
	CheckBox1.MouseButton1Click:Connect(AutoAcceptRace)
	
	while true do
		AutoAcceptRace()
		wait(1) -- Подождать перед следующим вызовом (можно изменить интервал)
	end
end
