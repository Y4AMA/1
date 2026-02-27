-- =====================================================
-- KURO HUB CORE ENGINE - SAMBUNG KATA INDONESIA
-- Dev: YAMA | Thanks: Hoshino
-- Telegram: https://t.me/kurohubsofficial
-- =====================================================

local KuroHub = {}
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- ========== TRIBUTE ==========
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("  🌪️ KURO HUB V3 LOADED 🌪️")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("  Welcome Sensei YAMA! 🙇")
print("  Welcome Senpai/Oneechan Hoshino! 🙇‍♀️")
print("  TG: https://t.me/kurohubsofficial")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

-- ========== CUSTOM UI FRAMEWORK ==========
local KuroUI = {}
KuroUI.__index = KuroUI

function KuroUI:CreateWindow(config)
    local window = {}
    window.Title = config.Title or "Kuro Hub"
    window.SubTitle = config.SubTitle or ""
    window.Size = config.Size or UDim2.new(0, 600, 0, 450)
    window.Position = config.Position or UDim2.new(0.5, -300, 0.5, -225)
    window.Theme = config.Theme or "Dark"
    window.Elements = {}
    
    -- Create ScreenGui
    window.Gui = Instance.new("ScreenGui")
    window.Gui.Name = "KuroHub"
    window.Gui.Parent = CoreGui
    
    -- Main Frame
    window.Main = Instance.new("Frame")
    window.Main.Size = window.Size
    window.Main.Position = window.Position
    window.Main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    window.Main.BackgroundTransparency = 0.1
    window.Main.BorderSizePixel = 0
    window.Main.Parent = window.Gui
    
    -- Shadow/Blur
    local blur = Instance.new("ImageLabel")
    blur.Size = UDim2.new(1, 20, 1, 20)
    blur.Position = UDim2.new(0, -10, 0, -10)
    blur.BackgroundTransparency = 1
    blur.Image = "rbxassetid://1316045217"
    blur.ImageColor3 = Color3.fromRGB(0, 0, 0)
    blur.ImageTransparency = 0.6
    blur.ScaleType = Enum.ScaleType.Slice
    blur.SliceCenter = Rect.new(10, 10, 10, 10)
    blur.Parent = window.Main
    
    -- Title Bar
    window.TitleBar = Instance.new("Frame")
    window.TitleBar.Size = UDim2.new(1, 0, 0, 35)
    window.TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    window.TitleBar.BorderSizePixel = 0
    window.TitleBar.Parent = window.Main
    
    local titleText = Instance.new("TextLabel")
    titleText.Size = UDim2.new(0, 200, 1, 0)
    titleText.Position = UDim2.new(0, 10, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = window.Title
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Font = Enum.Font.GothamBlack
    titleText.TextSize = 16
    titleText.Parent = window.TitleBar
    
    local subtitleText = Instance.new("TextLabel")
    subtitleText.Size = UDim2.new(0, 200, 1, 0)
    subtitleText.Position = UDim2.new(0, 220, 0, 0)
    subtitleText.BackgroundTransparency = 1
    subtitleText.Text = window.SubTitle
    subtitleText.TextColor3 = Color3.fromRGB(180, 180, 180)
    subtitleText.TextXAlignment = Enum.TextXAlignment.Left
    subtitleText.Font = Enum.Font.Gotham
    subtitleText.TextSize = 12
    subtitleText.Parent = window.TitleBar
    
    -- Tabs Container
    window.TabContainer = Instance.new("Frame")
    window.TabContainer.Size = UDim2.new(1, 0, 0, 40)
    window.TabContainer.Position = UDim2.new(0, 0, 0, 35)
    window.TabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    window.TabContainer.BorderSizePixel = 0
    window.TabContainer.Parent = window.Main
    
    window.Tabs = {}
    window.TabButtons = {}
    
    -- Content Area
    window.Content = Instance.new("Frame")
    window.Content.Size = UDim2.new(1, -20, 1, -95)
    window.Content.Position = UDim2.new(0, 10, 0, 85)
    window.Content.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    window.Content.BackgroundTransparency = 0.3
    window.Content.BorderSizePixel = 0
    window.Content.Parent = window.Main
    
    -- Corner
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = window.Main
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = window.TitleBar
    
    window.UpdateLabel = function(section, title, value)
        -- Update label function
    end
    
    return window
end

function KuroUI:Tab(window, config)
    local tab = {}
    tab.Title = config.Title or "Tab"
    tab.Icon = config.Icon or ""
    tab.Visible = false
    tab.Elements = {}
    
    -- Create tab button
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 1, 0)
    button.Position = UDim2.new(0, (#window.TabButtons * 100), 0, 0)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    button.Text = tab.Title
    button.TextColor3 = Color3.fromRGB(200, 200, 200)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.BorderSizePixel = 0
    button.Parent = window.TabContainer
    
    table.insert(window.TabButtons, button)
    
    -- Create content frame
    tab.Container = Instance.new("ScrollingFrame")
    tab.Container.Size = UDim2.new(1, 0, 1, 0)
    tab.Container.BackgroundTransparency = 1
    tab.Container.BorderSizePixel = 0
    tab.Container.ScrollBarThickness = 6
    tab.Container.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 150)
    tab.Container.CanvasSize = UDim2.new(0, 0, 0, 0)
    tab.Container.Parent = window.Content
    tab.Container.Visible = false
    
    -- Layout for elements
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = tab.Container
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tab.Container.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Button click handler
    button.MouseButton1Click:Connect(function()
        for i, btn in ipairs(window.TabButtons) do
            btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
        button.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        for _, t in ipairs(window.Tabs) do
            t.Container.Visible = false
        end
        tab.Container.Visible = true
    end)
    
    tab.Section = function(sectionConfig)
        local section = {}
        section.Title = sectionConfig.Title or "Section"
        
        -- Section frame
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -20, 0, 0)
        frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        frame.BackgroundTransparency = 0.2
        frame.BorderSizePixel = 0
        frame.Parent = tab.Container
        
        local sectionCorner = Instance.new("UICorner")
        sectionCorner.CornerRadius = UDim.new(0, 6)
        sectionCorner.Parent = frame
        
        -- Section title
        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, -20, 0, 25)
        title.Position = UDim2.new(0, 10, 0, 5)
        title.BackgroundTransparency = 1
        title.Text = section.Title
        title.TextColor3 = Color3.fromRGB(220, 220, 255)
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Font = Enum.Font.GothamBlack
        title.TextSize = 16
        title.Parent = frame
        
        -- Container for section elements
        section.Container = Instance.new("Frame")
        section.Container.Size = UDim2.new(1, -20, 0, 0)
        section.Container.Position = UDim2.new(0, 10, 0, 35)
        section.Container.BackgroundTransparency = 1
        section.Container.Parent = frame
        
        local sectionLayout = Instance.new("UIListLayout")
        sectionLayout.Padding = UDim.new(0, 6)
        sectionLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        sectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
        sectionLayout.Parent = section.Container
        
        -- Adjust frame size based on content
        local function updateSize()
            local height = 45 + sectionLayout.AbsoluteContentSize.Y
            frame.Size = UDim2.new(1, -20, 0, height)
        end
        
        sectionLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateSize)
        updateSize()
        
        -- Elements
        section.Label = function(labelConfig)
            local labelFrame = Instance.new("Frame")
            labelFrame.Size = UDim2.new(1, 0, 0, 30)
            labelFrame.BackgroundTransparency = 1
            labelFrame.Parent = section.Container
            
            local labelTitle = Instance.new("TextLabel")
            labelTitle.Size = UDim2.new(0.3, -5, 1, 0)
            labelTitle.BackgroundTransparency = 1
            labelTitle.Text = labelConfig.Title or ""
            labelTitle.TextColor3 = Color3.fromRGB(180, 180, 200)
            labelTitle.TextXAlignment = Enum.TextXAlignment.Left
            labelTitle.Font = Enum.Font.Gotham
            labelTitle.TextSize = 14
            labelTitle.Parent = labelFrame
            
            local labelValue = Instance.new("TextLabel")
            labelValue.Size = UDim2.new(0.7, -5, 1, 0)
            labelValue.Position = UDim2.new(0.3, 5, 0, 0)
            labelValue.BackgroundTransparency = 1
            labelValue.Text = labelConfig.Desc or ""
            labelValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            labelValue.TextXAlignment = Enum.TextXAlignment.Left
            labelValue.Font = Enum.Font.GothamBlack
            labelValue.TextSize = 14
            labelValue.Parent = labelFrame
            
            return {
                Set = function(_, newValue)
                    labelValue.Text = newValue
                end
            }
        end
        
        section.Input = function(inputConfig)
            local inputFrame = Instance.new("Frame")
            inputFrame.Size = UDim2.new(1, 0, 0, 50)
            inputFrame.BackgroundTransparency = 1
            inputFrame.Parent = section.Container
            
            local inputTitle = Instance.new("TextLabel")
            inputTitle.Size = UDim2.new(1, 0, 0, 20)
            inputTitle.BackgroundTransparency = 1
            inputTitle.Text = inputConfig.Title or "Input"
            inputTitle.TextColor3 = Color3.fromRGB(200, 200, 220)
            inputTitle.TextXAlignment = Enum.TextXAlignment.Left
            inputTitle.Font = Enum.Font.Gotham
            inputTitle.TextSize = 14
            inputTitle.Parent = inputFrame
            
            local inputDesc = Instance.new("TextLabel")
            inputDesc.Size = UDim2.new(1, 0, 0, 15)
            inputDesc.Position = UDim2.new(0, 0, 0, 18)
            inputDesc.BackgroundTransparency = 1
            inputDesc.Text = inputConfig.Desc or ""
            inputDesc.TextColor3 = Color3.fromRGB(140, 140, 160)
            inputDesc.TextXAlignment = Enum.TextXAlignment.Left
            inputDesc.Font = Enum.Font.Gotham
            inputDesc.TextSize = 12
            inputDesc.Parent = inputFrame
            
            local textBox = Instance.new("TextBox")
            textBox.Size = UDim2.new(1, 0, 0, 25)
            textBox.Position = UDim2.new(0, 0, 0, 35)
            textBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
            textBox.Text = ""
            textBox.PlaceholderText = inputConfig.Placeholder or "Type here..."
            textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            textBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
            textBox.Font = Enum.Font.Gotham
            textBox.TextSize = 14
            textBox.ClearTextOnFocus = false
            textBox.Parent = inputFrame
            
            local inputCorner = Instance.new("UICorner")
            inputCorner.CornerRadius = UDim.new(0, 4)
            inputCorner.Parent = textBox
            
            local value = ""
            textBox.FocusLost:Connect(function()
                value = textBox.Text
                if inputConfig.Callback then
                    inputConfig.Callback(value)
                end
            end)
            
            return {
                Value = value,
                Set = function(_, newValue)
                    textBox.Text = newValue
                    value = newValue
                end
            }
        end
        
        section.Button = function(btnConfig)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 35)
            btn.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
            btn.Text = btnConfig.Title or "Button"
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Font = Enum.Font.GothamBlack
            btn.TextSize = 14
            btn.BorderSizePixel = 0
            btn.Parent = section.Container
            
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 6)
            btnCorner.Parent = btn
            
            local btnDesc = Instance.new("TextLabel")
            btnDesc.Size = UDim2.new(1, 0, 0, 15)
            btnDesc.Position = UDim2.new(0, 0, 1, 2)
            btnDesc.BackgroundTransparency = 1
            btnDesc.Text = btnConfig.Desc or ""
            btnDesc.TextColor3 = Color3.fromRGB(140, 140, 160)
            btnDesc.Font = Enum.Font.Gotham
            btnDesc.TextSize = 11
            btnDesc.Parent = btn
            
            btn.MouseButton1Click:Connect(btnConfig.Callback or function() end)
            
            return btn
        end
        
        section.Toggle = function(toggleConfig)
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Size = UDim2.new(1, 0, 0, 45)
            toggleFrame.BackgroundTransparency = 1
            toggleFrame.Parent = section.Container
            
            local toggleTitle = Instance.new("TextLabel")
            toggleTitle.Size = UDim2.new(0.7, -5, 0, 20)
            toggleTitle.BackgroundTransparency = 1
            toggleTitle.Text = toggleConfig.Title or "Toggle"
            toggleTitle.TextColor3 = Color3.fromRGB(200, 200, 220)
            toggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            toggleTitle.Font = Enum.Font.Gotham
            toggleTitle.TextSize = 14
            toggleTitle.Parent = toggleFrame
            
            local toggleDesc = Instance.new("TextLabel")
            toggleDesc.Size = UDim2.new(0.7, -5, 0, 15)
            toggleDesc.Position = UDim2.new(0, 0, 0, 18)
            toggleDesc.BackgroundTransparency = 1
            toggleDesc.Text = toggleConfig.Desc or ""
            toggleDesc.TextColor3 = Color3.fromRGB(140, 140, 160)
            toggleDesc.TextXAlignment = Enum.TextXAlignment.Left
            toggleDesc.Font = Enum.Font.Gotham
            toggleDesc.TextSize = 11
            toggleDesc.Parent = toggleFrame
            
            local toggleBtn = Instance.new("TextButton")
            toggleBtn.Size = UDim2.new(0, 40, 0, 20)
            toggleBtn.Position = UDim2.new(1, -45, 0, 5)
            toggleBtn.BackgroundColor3 = toggleConfig.Default and Color3.fromRGB(75, 0, 130) or Color3.fromRGB(60, 60, 70)
            toggleBtn.Text = ""
            toggleBtn.BorderSizePixel = 0
            toggleBtn.Parent = toggleFrame
            
            local toggleCorner = Instance.new("UICorner")
            toggleCorner.CornerRadius = UDim.new(1, 0)
            toggleCorner.Parent = toggleBtn
            
            local toggleCircle = Instance.new("Frame")
            toggleCircle.Size = UDim2.new(0, 16, 0, 16)
            toggleCircle.Position = toggleConfig.Default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleCircle.Parent = toggleBtn
            
            local circleCorner = Instance.new("UICorner")
            circleCorner.CornerRadius = UDim.new(1, 0)
            circleCorner.Parent = toggleCircle
            
            local state = toggleConfig.Default or false
            
            local function updateToggle()
                toggleBtn.BackgroundColor3 = state and Color3.fromRGB(75, 0, 130) or Color3.fromRGB(60, 60, 70)
                toggleCircle.Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            end
            
            toggleBtn.MouseButton1Click:Connect(function()
                state = not state
                updateToggle()
                if toggleConfig.Callback then
                    toggleConfig.Callback(state)
                end
            end)
            
            updateToggle()
            
            return {
                Set = function(_, newState)
                    state = newState
                    updateToggle()
                end
            }
        end
        
        section.Slider = function(sliderConfig)
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Size = UDim2.new(1, 0, 0, 60)
            sliderFrame.BackgroundTransparency = 1
            sliderFrame.Parent = section.Container
            
            local sliderTitle = Instance.new("TextLabel")
            sliderTitle.Size = UDim2.new(0.7, -5, 0, 20)
            sliderTitle.BackgroundTransparency = 1
            sliderTitle.Text = sliderConfig.Title or "Slider"
            sliderTitle.TextColor3 = Color3.fromRGB(200, 200, 220)
            sliderTitle.TextXAlignment = Enum.TextXAlignment.Left
            sliderTitle.Font = Enum.Font.Gotham
            sliderTitle.TextSize = 14
            sliderTitle.Parent = sliderFrame
            
            local sliderDesc = Instance.new("TextLabel")
            sliderDesc.Size = UDim2.new(0.7, -5, 0, 15)
            sliderDesc.Position = UDim2.new(0, 0, 0, 18)
            sliderDesc.BackgroundTransparency = 1
            sliderDesc.Text = sliderConfig.Desc or ""
            sliderDesc.TextColor3 = Color3.fromRGB(140, 140, 160)
            sliderDesc.TextXAlignment = Enum.TextXAlignment.Left
            sliderDesc.Font = Enum.Font.Gotham
            sliderDesc.TextSize = 11
            sliderDesc.Parent = sliderFrame
            
            local valueLabel = Instance.new("TextLabel")
            valueLabel.Size = UDim2.new(0.3, 0, 0, 20)
            valueLabel.Position = UDim2.new(0.7, 0, 0, 0)
            valueLabel.BackgroundTransparency = 1
            valueLabel.Text = tostring(sliderConfig.Default or sliderConfig.Min or 0)
            valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            valueLabel.TextXAlignment = Enum.TextXAlignment.Right
            valueLabel.Font = Enum.Font.GothamBlack
            valueLabel.TextSize = 14
            valueLabel.Parent = sliderFrame
            
            local sliderBg = Instance.new("Frame")
            sliderBg.Size = UDim2.new(1, 0, 0, 8)
            sliderBg.Position = UDim2.new(0, 0, 0, 45)
            sliderBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            sliderBg.BorderSizePixel = 0
            sliderBg.Parent = sliderFrame
            
            local bgCorner = Instance.new("UICorner")
            bgCorner.CornerRadius = UDim.new(1, 0)
            bgCorner.Parent = sliderBg
            
            local sliderFill = Instance.new("Frame")
            sliderFill.Size = UDim2.new(0, 0, 1, 0)
            sliderFill.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
            sliderFill.BorderSizePixel = 0
            sliderFill.Parent = sliderBg
            
            local fillCorner = Instance.new("UICorner")
            fillCorner.CornerRadius = UDim.new(1, 0)
            fillCorner.Parent = sliderFill
            
            local min = sliderConfig.Min or 0
            local max = sliderConfig.Max or 1
            local value = sliderConfig.Default or min
            local decimals = sliderConfig.Decimals or 1
            
            local function updateSlider(pos)
                local relativePos = math.clamp((pos - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                value = min + (max - min) * relativePos
                if decimals == 0 then
                    value = math.floor(value + 0.5)
                else
                    local mult = 10^decimals
                    value = math.floor(value * mult + 0.5) / mult
                end
                sliderFill.Size = UDim2.new(relativePos, 0, 1, 0)
                valueLabel.Text = tostring(value)
                if sliderConfig.Callback then
                    sliderConfig.Callback(value)
                end
            end
            
            sliderBg.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    updateSlider(input.Position.X)
                    
                    local conn
                    conn = UserInputService.InputChanged:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement then
                            updateSlider(input.Position.X)
                        end
                    end)
                    
                    UserInputService.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            conn:Disconnect()
                        end
                    end)
                end
            end)
            
            -- Set initial
            local initialPos = (value - min) / (max - min)
            sliderFill.Size = UDim2.new(initialPos, 0, 1, 0)
            
            return {
                Set = function(_, newValue)
                    value = math.clamp(newValue, min, max)
                    local pos = (value - min) / (max - min)
                    sliderFill.Size = UDim2.new(pos, 0, 1, 0)
                    valueLabel.Text = tostring(value)
                end
            }
        end
        
        section.Dropdown = function(dropdownConfig)
            local dropdownFrame = Instance.new("Frame")
            dropdownFrame.Size = UDim2.new(1, 0, 0, 60)
            dropdownFrame.BackgroundTransparency = 1
            dropdownFrame.Parent = section.Container
            
            local dropdownTitle = Instance.new("TextLabel")
            dropdownTitle.Size = UDim2.new(1, 0, 0, 20)
            dropdownTitle.BackgroundTransparency = 1
            dropdownTitle.Text = dropdownConfig.Title or "Dropdown"
            dropdownTitle.TextColor3 = Color3.fromRGB(200, 200, 220)
            dropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
            dropdownTitle.Font = Enum.Font.Gotham
            dropdownTitle.TextSize = 14
            dropdownTitle.Parent = dropdownFrame
            
            local dropdownDesc = Instance.new("TextLabel")
            dropdownDesc.Size = UDim2.new(1, 0, 0, 15)
            dropdownDesc.Position = UDim2.new(0, 0, 0, 18)
            dropdownDesc.BackgroundTransparency = 1
            dropdownDesc.Text = dropdownConfig.Desc or ""
            dropdownDesc.TextColor3 = Color3.fromRGB(140, 140, 160)
            dropdownDesc.TextXAlignment = Enum.TextXAlignment.Left
            dropdownDesc.Font = Enum.Font.Gotham
            dropdownDesc.TextSize = 11
            dropdownDesc.Parent = dropdownFrame
            
            local dropdownBtn = Instance.new("TextButton")
            dropdownBtn.Size = UDim2.new(1, 0, 0, 30)
            dropdownBtn.Position = UDim2.new(0, 0, 0, 35)
            dropdownBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            dropdownBtn.Text = dropdownConfig.Default or "Select..."
            dropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            dropdownBtn.Font = Enum.Font.Gotham
            dropdownBtn.TextSize = 14
            dropdownBtn.BorderSizePixel = 0
            dropdownBtn.Parent = dropdownFrame
            
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 4)
            btnCorner.Parent = dropdownBtn
            
            local dropdownList = Instance.new("Frame")
            dropdownList.Size = UDim2.new(1, 0, 0, 0)
            dropdownList.Position = UDim2.new(0, 0, 0, 70)
            dropdownList.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
            dropdownList.BackgroundTransparency = 0.1
            dropdownList.Visible = false
            dropdownList.Parent = dropdownFrame
            
            local listCorner = Instance.new("UICorner")
            listCorner.CornerRadius = UDim.new(0, 4)
            listCorner.Parent = dropdownList
            
            local listLayout = Instance.new("UIListLayout")
            listLayout.Padding = UDim.new(0, 2)
            listLayout.Parent = dropdownList
            
            local buttons = {}
            local currentValue = dropdownConfig.Default or dropdownConfig.Values[1] or ""
            
            for _, value in ipairs(dropdownConfig.Values or {}) do
                local itemBtn = Instance.new("TextButton")
                itemBtn.Size = UDim2.new(1, 0, 0, 25)
                itemBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                itemBtn.Text = value
                itemBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
                itemBtn.Font = Enum.Font.Gotham
                itemBtn.TextSize = 13
                itemBtn.BorderSizePixel = 0
                itemBtn.Parent = dropdownList
                
                local itemCorner = Instance.new("UICorner")
                itemCorner.CornerRadius = UDim.new(0, 3)
                itemCorner.Parent = itemBtn
                
                itemBtn.MouseButton1Click:Connect(function()
                    currentValue = value
                    dropdownBtn.Text = value
                    dropdownList.Visible = false
                    dropdownFrame.Size = UDim2.new(1, 0, 0, 60)
                    if dropdownConfig.Callback then
                        dropdownConfig.Callback(value)
                    end
                end)
                
                table.insert(buttons, itemBtn)
            end
            
            dropdownBtn.MouseButton1Click:Connect(function()
                dropdownList.Visible = not dropdownList.Visible
                if dropdownList.Visible then
                    local height = #dropdownConfig.Values * 27 + 4
                    dropdownList.Size = UDim2.new(1, 0, 0, height)
                    dropdownFrame.Size = UDim2.new(1, 0, 0, 70 + height)
                else
                    dropdownList.Size = UDim2.new(1, 0, 0, 0)
                    dropdownFrame.Size = UDim2.new(1, 0, 0, 60)
                end
            end)
            
            return {
                Value = currentValue,
                Set = function(_, newValue)
                    currentValue = newValue
                    dropdownBtn.Text = newValue
                end
            }
        end
        
        return section
    end
    
    table.insert(window.Tabs, tab)
    
    -- Activate first tab
    if #window.Tabs == 1 then
        button.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        tab.Container.Visible = true
    end
    
    return tab
end

KuroUI.Notify = function(config)
    config = config or {}
    local title = config.Title or "Notification"
    local content = config.Content or ""
    local duration = config.Duration or 3
    
    -- Create notification frame
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 300, 0, 80)
    notif.Position = UDim2.new(1, -320, 1, -100)
    notif.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    notif.BorderSizePixel = 0
    notif.Parent = CoreGui:FindFirstChild("KuroHub") or CoreGui
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 8)
    notifCorner.Parent = notif
    
    local notifTitle = Instance.new("TextLabel")
    notifTitle.Size = UDim2.new(1, -20, 0, 25)
    notifTitle.Position = UDim2.new(0, 10, 0, 5)
    notifTitle.BackgroundTransparency = 1
    notifTitle.Text = title
    notifTitle.TextColor3 = Color3.fromRGB(200, 200, 255)
    notifTitle.TextXAlignment = Enum.TextXAlignment.Left
    notifTitle.Font = Enum.Font.GothamBlack
    notifTitle.TextSize = 16
    notifTitle.Parent = notif
    
    local notifContent = Instance.new("TextLabel")
    notifContent.Size = UDim2.new(1, -20, 0, 40)
    notifContent.Position = UDim2.new(0, 10, 0, 30)
    notifContent.BackgroundTransparency = 1
    notifContent.Text = content
    notifContent.TextColor3 = Color3.fromRGB(255, 255, 255)
    notifContent.TextXAlignment = Enum.TextXAlignment.Left
    notifContent.TextWrapped = true
    notifContent.Font = Enum.Font.Gotham
    notifContent.TextSize = 13
    notifContent.Parent = notif
    
    -- Animate in
    notif.Position = UDim2.new(1, -320, 1, -100)
    local tween = TweenService:Create(notif, TweenInfo.new(0.3), {Position = UDim2.new(1, -320, 1, -190)})
    tween:Play()
    
    -- Auto destroy
    task.wait(duration)
    local tweenOut = TweenService:Create(notif, TweenInfo.new(0.3), {Position = UDim2.new(1, -320, 1, -100)})
    tweenOut:Play()
    tweenOut.Completed:Connect(function()
        notif:Destroy()
    end)
end

-- ========== GAME CONFIG ==========
local config = {
    currentWord = "ROBLOX",
    usedWords = {["ROBLOX"] = true},
    lastPlayer = player.Name,
    score = 0,
    gameActive = true,
    autoMode = false,
    typingSpeed = 0.08,
    responseTime = 0.3,
    suggestions = {},
    font = "GothamBlack",
    sound = true,
    dailyChallenge = {
        active = false,
        word = "INDONESIA",
        streak = 0,
        target = 10
    },
    stats = {
        totalAnswers = 0,
        longestWord = "",
        favoriteLetter = "",
        letterCount = {}
    }
}

-- ========== DICTIONARY ==========
local dictionary = {
    A = {"AYAM", "ANJING", "APEL", "ANGIN", "AIR", "AKAR", "ALAT", "AMBIL", "ANAK", "ANGKA"},
    B = {"BUKU", "BURUNG", "BESAR", "BARU", "BAIK", "BAJU", "BAWAH", "BEBEK", "BENDA", "BERAT"},
    C = {"CICAK", "CERITA", "CEPAT", "CABAI", "CACING", "CANDI", "CAPAI", "CASIS", "CAHAYA", "CEMARA"},
    D = {"DADA", "DADU", "DAGING", "DAHULU", "DAKWAH", "DALAM", "DAMAR", "DANAU", "DAPAT", "DARAH"},
    E = {"EKOR", "ELANG", "EMPAT", "ENAM", "ENERGI", "ENGSEL", "ENTAH", "EKSIS", "EKRAN", "ELEMEN"},
    F = {"FAKTA", "FAMILI", "FANTA", "FASIH", "FATAL", "FAUNA", "FERI", "FIKIR", "FILM", "FINIS"},
    G = {"GAJAH", "GARAM", "GASAL", "GAUL", "GAYA", "GELAP", "GEMUK", "GENAP", "GIGI", "GILA"},
    H = {"HARIMAU", "HITAM", "HIJAU", "HALUS", "HAMPIR", "HANTU", "HARGA", "HATI", "HAUS", "HEBAT"},
    I = {"IKAN", "INDAH", "INGIN", "IRIS", "ISAP", "ISI", "ISTRI", "ISYA", "ITIK", "IZIN"},
    J = {"JALAN", "JAMBU", "JANTAN", "JARAK", "JARI", "JASA", "JATUH", "JAWA", "JEJAK", "JELAS"},
    K = {"KUCING", "KERTAS", "KECIL", "KAKI", "KALENG", "KAMAR", "KAMBING", "KANAN", "KANTOR", "KAPAL"},
    L = {"LAPAN", "LARI", "LAUT", "LEBAR", "LEBIH", "LEMARI", "LEMBU", "LIMA", "LINDUNGAN", "LISTRIK"},
    M = {"MEJA", "MOBIL", "MOTOR", "MAKAN", "MINUM", "MATA", "MALAM", "MANGGA", "MANTAN", "MANUSIA"},
    N = {"NAMA", "NANAS", "NAPAS", "NARKOBA", "NASI", "NATAL", "NEGARA", "NEKAT", "NENEK", "NERAKA"},
    O = {"OBAT", "OBJEK", "OBSESI", "OCEK", "ODOR", "OFFICE", "OKNUM", "OLAH", "OMBAK", "OMEL"},
    P = {"PINTU", "PAPAN", "PADI", "PAHIT", "PAKAI", "PAKET", "PALING", "PALU", "PANCASILA", "PANDAI"},
    Q = {"QURAN", "QASIDAH", "QAF", "QALBU", "QARI", "QASAR", "QATAR", "QIAN", "QIRAAT", "QORI"},
    R = {"RUMAH", "ROBLOX", "RUSA", "RABU", "RADAR", "RAHASIA", "RAJA", "RAKIT", "RAMAI", "RAMBUT"},
    S = {"SEMUT", "SAPI", "SAYA", "SABAR", "SABTU", "SADAR", "SAKIT", "SALAH", "SALAM", "SALJU"},
    T = {"TIKUS", "TANAH", "TANGAN", "TANTE", "TARI", "TAHU", "TAJAM", "TAKUT", "TALI", "TAMAN"},
    U = {"ULAR", "UBUR", "UDANG", "UJIAN", "UKIR", "ULANG", "ULAT", "ULAR", "ULAS", "UMAT"},
    V = {"VITAMIN", "VIRUS", "VALENTINE", "VARIASI", "VEGETARIAN", "VENA", "VENUE", "VERBAL", "VERSI", "VERTIKAL"},
    W = {"WARNA", "WAKTU", "WADAH", "WAJAH", "WAKIL", "WALI", "WANITA", "WARGA", "WARIS", "WARNA"},
    X = {"XENON", "XENIA", "XENOFOBIA", "XENON", "XENIA", "XEROS", "XILEM", "XILOFON", "XILOGRAF", "XILOID"},
    Y = {"YAKIN", "YAKUZA", "YANG", "YARD", "YATIM", "YAYASAN", "YOGURT", "YUDISIUM", "YUDIKATIF", "YURIS"},
    Z = {"ZAMAN", "ZEBRA", "ZAKAT", "ZALIM", "ZAMRUD", "ZAT", "ZEBRA", "ZENITH", "ZIGOT", "ZINA"}
}

-- ========== CREATE UI ==========
local KuroWindow = KuroUI:CreateWindow({
    Title = "Kuro Hub V3",
    SubTitle = "Dev: YAMA | Thanks: Hoshino",
    Size = UDim2.new(0, 650, 0, 500),
    Theme = "Dark"
})

-- ========== HOME TAB ==========
local HomeTab = KuroUI:Tab(KuroWindow, {
    Title = "🏠 Home",
    Icon = ""
})

local GameSection = HomeTab:Section({
    Title = "🎮 Game Status"
})

local currentWordLabel = GameSection:Label({
    Title = "Current Word:",
    Desc = config.currentWord
})

local lastPlayerLabel = GameSection:Label({
    Title = "Last Player:",
    Desc = config.lastPlayer
})

local scoreLabel = GameSection:Label({
    Title = "Your Score:",
    Desc = tostring(config.score)
})

local ChatSection = HomeTab:Section({
    Title = "💬 Chat Game"
})

local answerInput = ChatSection:Input({
    Title = "Jawaban Kamu",
    Desc = "Ketik kata sambungan...",
    Placeholder = "Contoh: MALAM (huruf M)"
})

ChatSection:Button({
    Title = "🔍 Suggest Jawaban",
    Desc = "Auto cari kata berdasarkan huruf terakhir",
    Callback = function()
        local lastChar = string.sub(config.currentWord, #config.currentWord, #config.currentWord)
        local suggestions = dictionary[lastChar] or {}
        
        local randomSugs = {}
        for i = 1, math.min(5, #suggestions) do
            local randIndex = math.random(1, #suggestions)
            table.insert(randomSugs, suggestions[randIndex])
        end
        
        config.suggestions = randomSugs
        
        KuroUI.Notify({
            Title = "💡 Kata Suggestions",
            Content = "Huruf " .. lastChar .. ": " .. table.concat(randomSugs, ", "),
            Duration = 5
        })
    end
})

ChatSection:Button({
    Title = "🚀 Kirim Jawaban",
    Desc = "Submit jawaban ke game",
    Callback = function()
        local answer = answerInput.Value
        if not answer or answer == "" then
            KuroUI.Notify({
                Title = "❌ Error",
                Content = "Isi jawaban dulu gblk 😭",
                Duration = 3
            })
            return
        end
        
        answer = string.upper(answer)
        
        local lastChar = string.sub(config.currentWord, #config.currentWord, #config.currentWord)
        local firstChar = string.sub(answer, 1, 1)
        
        if firstChar ~= lastChar then
            KuroUI.Notify({
                Title = "❌ Salah",
                Content = "Huruf pertama harus '" .. lastChar .. "' njir 😤",
                Duration = 3
            })
            return
        end
        
        local valid = false
        for _, word in ipairs(dictionary[firstChar] or {}) do
            if word == answer then
                valid = true
                break
            end
        end
        
        if not valid then
            KuroUI.Notify({
                Title = "❌ Gak Valid",
                Content = "Kata '" .. answer .. "' gak ada di kamus 😭",
                Duration = 3
            })
            return
        end
        
        if config.usedWords[answer] then
            KuroUI.Notify({
                Title = "❌ Udah Dipake",
                Content = "Kata '" .. answer .. "' udah pernah dipake",
                Duration = 3
            })
            return
        end
        
        config.usedWords[answer] = true
        config.currentWord = answer
        config.lastPlayer = player.Name
        config.score = config.score + 1
        config.stats.totalAnswers = config.stats.totalAnswers + 1
        
        if #answer > #config.stats.longestWord then
            config.stats.longestWord = answer
        end
        
        config.stats.letterCount[firstChar] = (config.stats.letterCount[firstChar] or 0) + 1
        
        currentWordLabel:Set(config.currentWord)
        scoreLabel:Set(tostring(config.score))
        lastPlayerLabel:Set(config.lastPlayer)
        
        KuroUI.Notify({
            Title = "✅ BERHASIL!",
            Content = "Kata '" .. answer .. "' diterima! 🔥",
            Duration = 3
        })
        
        answerInput:Set("")
    end
})

-- ========== AUTO TAB ==========
local AutoTab = KuroUI:Tab(KuroWindow, {
    Title = "🤖 Auto",
    Icon = ""
})

local AutoSection = AutoTab:Section({
    Title = "⚙️ Auto Settings"
})

local autoToggle = AutoSection:Toggle({
    Title = "Auto Mode",
    Desc = "Bot otomatis jawab",
    Default = config.autoMode,
    Callback = function(value)
        config.autoMode = value
        if value then
            KuroUI.Notify({
                Title = "🤖 AUTO MODE ON",
                Content = "Bot bakal jawab otomatis",
                Duration = 3
            })
            
            task.spawn(function()
                while config.autoMode and config.gameActive do
                    task.wait(config.responseTime)
                    local lastChar = string.sub(config.currentWord, #config.currentWord, #config.currentWord)
                    local suggestions = dictionary[lastChar] or {}
                    
                    local available = {}
                    for _, word in ipairs(suggestions) do
                        if not config.usedWords[word] then
                            table.insert(available, word)
                        end
                    end
                    
                    if #available > 0 then
                        local autoAnswer = available[math.random(1, #available)]
                        
                        config.usedWords[autoAnswer] = true
                        config.currentWord = autoAnswer
                        config.lastPlayer = player.Name .. " (BOT)"
                        config.score = config.score + 1
                        config.stats.totalAnswers = config.stats.totalAnswers + 1
                        
                        if #autoAnswer > #config.stats.longestWord then
                            config.stats.longestWord = autoAnswer
                        end
                        
                        currentWordLabel:Set(config.currentWord)
                        scoreLabel:Set(tostring(config.score))
                        lastPlayerLabel:Set(config.lastPlayer)
                        
                        KuroUI.Notify({
                            Title = "🤖 BOT JAWAB",
                            Content = autoAnswer,
                            Duration = 2
                        })
                    end
                    task.wait(config.typingSpeed)
                end
            end)
        else
            KuroUI.Notify({
                Title = "🤖 AUTO MODE OFF",
                Content = "Balik manual mode",
                Duration = 3
            })
        end
    end
})

AutoSection:Slider({
    Title = "Typing Speed",
    Desc = "Kecepatan ngetik bot (detik)",
    Min = 0.01,
    Max = 0.5,
    Default = config.typingSpeed,
    Decimals = 2,
    Callback = function(value)
        config.typingSpeed = value
    end
})

AutoSection:Slider({
    Title = "Response Delay",
    Desc = "Delay sebelum jawab (detik)",
    Min = 0.1,
    Max = 2,
    Default = config.responseTime,
    Decimals = 2,
    Callback = function(value)
        config.responseTime = value
    end
})

-- ========== DAILY TAB ==========
local DailyTab = KuroUI:Tab(KuroWindow, {
    Title = "📅 Daily",
    Icon = ""
})

local DailySection = DailyTab:Section({
    Title = "🔥 Daily Challenge"
})

DailySection:Label({
    Title = "Today's Word:",
    Desc = config.dailyChallenge.word
})

DailySection:Label({
    Title = "Streak:",
    Desc = tostring(config.dailyChallenge.streak) .. "/" .. tostring(config.dailyChallenge.target)
})

DailySection:Button({
    Title = "🎯 Start Challenge",
    Desc = "Coba sambung 10 kata berturut-turut",
    Callback = function()
        config.dailyChallenge.active = true
        config.dailyChallenge.streak = 0
        config.currentWord = config.dailyChallenge.word
        config.usedWords = {[config.dailyChallenge.word] = true}
        currentWordLabel:Set(config.currentWord)
        
        KuroUI.Notify({
            Title = "🔥 DAILY CHALLENGE",
            Content = "Sambung " .. config.dailyChallenge.target .. " kata! Mulai dari: " .. config.dailyChallenge.word,
            Duration = 5
        })
    end
})

-- ========== STATS TAB ==========
local StatsTab = KuroUI:Tab(KuroWindow, {
    Title = "📊 Stats",
    Icon = ""
})

local StatsSection = StatsTab:Section({
    Title = "📈 Your Statistics"
})

StatsSection:Label({
    Title = "Total Answers:",
    Desc = tostring(config.stats.totalAnswers)
})

StatsSection:Label({
    Title = "Longest Word:",
    Desc = config.stats.longestWord or "-"
})

local favoriteLetter = "A"
local maxCount = 0
for letter, count in pairs(config.stats.letterCount) do
    if count > maxCount then
        maxCount = count
        favoriteLetter = letter
    end
end

StatsSection:Label({
    Title = "Favorite Letter:",
    Desc = favoriteLetter
})

StatsSection:Button({
    Title = "🔄 Refresh Stats",
    Desc = "Update statistik",
    Callback = function()
        local fav = "A"
        local maxC = 0
        for l, c in pairs(config.stats.letterCount) do
            if c > maxC then
                maxC = c
                fav = l
            end
        end
        
        KuroUI.Notify({
            Title = "📊 Stats Updated",
            Content = "Favorite: " .. fav,
            Duration = 3
        })
    end
})

-- ========== SHOP TAB ==========
local ShopTab = KuroUI:Tab(KuroWindow, {
    Title = "🛒 Shop",
    Icon = ""
})

local ShopSection = ShopTab:Section({
    Title = "💎 Word Booster Pack"
})

ShopSection:Label({
    Title = "Your Points:",
    Desc = "💰 " .. tostring(config.score * 10)
})

local function buyItem(item, cost)
    if config.score * 10 >= cost then
        config.score = config.score - (cost / 10)
        scoreLabel:Set(tostring(config.score))
        KuroUI.Notify({
            Title = "✅ Purchased!",
            Content = "You got: " .. item,
            Duration = 3
        })
    else
        KuroUI.Notify({
            Title = "❌ Not Enough Points",
            Content = "Need " .. cost .. " points",
            Duration = 3
        })
    end
end

ShopSection:Button({
    Title = "📦 Rare Word Pack (50 pts)",
    Desc = "Dapat kata sulit untuk dijebak ke lawan",
    Callback = function()
        buyItem("Rare Word Pack", 50)
    end
})

ShopSection:Button({
    Title = "⚡ Speed Boost (30 pts)",
    Desc = "Kurangi response time 50% selama 5 ronde",
    Callback = function()
        buyItem("Speed Boost", 30)
    end
})

-- ========== SETTINGS TAB ==========
local SettingsTab = KuroUI:Tab(KuroWindow, {
    Title = "⚙️ Settings",
    Icon = ""
})

local SettingsSection = SettingsTab:Section({
    Title = "🛠️ Kuro Settings"
})

SettingsSection:Button({
    Title = "🔄 Reset Game",
    Desc = "Mulai game dari awal",
    Callback = function()
        config.currentWord = "ROBLOX"
        config.usedWords = {["ROBLOX"] = true}
        config.lastPlayer = player.Name
        config.score = 0
        
        currentWordLabel:Set(config.currentWord)
        scoreLabel:Set(tostring(config.score))
        lastPlayerLabel:Set(config.lastPlayer)
        
        KuroUI.Notify({
            Title = "🔄 Game Reset",
            Content = "Kata baru: ROBLOX",
            Duration = 3
        })
    end
})

SettingsSection:Toggle({
    Title = "Sound Effects",
    Desc = "Suara pas jawab bener/salah",
    Default = config.sound,
    Callback = function(value)
        config.sound = value
    end
})

local fontOptions = {"GothamBlack", "Gotham", "Arial", "ComicSans"}
SettingsSection:Dropdown({
    Title = "Font Style",
    Desc = "Ganti font teks",
    Values = fontOptions,
    Default = config.font,
    Callback = function(value)
        config.font = value
    end
})

SettingsSection:Button({
    Title = "📱 Join Telegram",
    Desc = "https://t.me/kurohubsofficial",
    Callback = function()
        setclipboard("https://t.me/kurohubsofficial")
        KuroUI.Notify({
            Title = "📋 Link Copied!",
            Content = "Telegram link copied to clipboard",
            Duration = 3
        })
    end
})

-- ========== ABOUT TAB ==========
local AboutTab = KuroUI:Tab(KuroWindow, {
    Title = "📌 About",
    Icon = ""
})

local AboutSection = AboutTab:Section({
    Title = "ℹ️ Information"
})

AboutSection:Label({
    Title = "Kuro Hub V3",
    Desc = "Sambung Kata Edition"
})

AboutSection:Label({
    Title = "Developer",
    Desc = "YAMA"
})

AboutSection:Label({
    Title = "Special Thanks",
    Desc = "Hoshino (Senpai/Oneechan)"
})

AboutSection:Label({
    Title = "Telegram",
    Desc = "@kurohubsofficial"
})

AboutSection:Button({
    Title = "💀 YAMA GANTENG",
    Desc = "Click untuk tribute",
    Callback = function()
        KuroUI.Notify({
            Title = "🙇 WELCOME SENSEI YAMA",
            Content = "Dan Oneechan Hoshino!",
            Duration = 5
        })
    end
})

-- Initial notification
KuroUI.Notify({
    Title = "🌪️ KURO HUB V3 LOADED",
    Content = "Welcome Sensei YAMA! 🙇",
    Duration = 5
})

return KuroHub
