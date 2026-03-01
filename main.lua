-- Script untuk "Find Who Slapped" Game
-- Tempatkan script ini di ServerScriptService

local Players = game:GetService("Players")
local Debris = game:GetService("Debris")

-- Fungsi untuk membuat efek slap
local function createSlapEffect(position)
    local part = Instance.new("Part")
    part.Shape = Enum.PartType.Ball
    part.Material = Enum.Material.Neon
    part.BrickColor = BrickColor.new("Bright red")
    part.Size = Vector3.new(2, 2, 2)
    part.CanCollide = false
    part.Position = position
    part.Parent = workspace
    
    -- Animasi part (mengecil dan menghilang)
    game:GetService("TweenService"):Create(
        part,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = Vector3.new(0, 0, 0)}
    ):Play()
    
    Debris:AddItem(part, 0.5)
end

-- Fungsi utama slap detection
local function onPlayerAdded(player)
    print(player.Name .. " bergabung ke dalam game!")
    
    -- Buat GUI untuk player
    local gui = Instance.new("ScreenGui")
    gui.Parent = player:WaitForChild("PlayerGui")
    gui.Name = "SlapGUI"
    
    -- Label informasi
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
    infoLabel.Position = UDim2.new(0.25, 0, 0.02, 0)
    infoLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    infoLabel.BackgroundTransparency = 0.5
    infoLabel.TextColor3 = Color3.new(1, 1, 1)
    infoLabel.TextScaled = true
    infoLabel.Font = Enum.Font.GothamBold
    infoLabel.Text = "Menunggu Slap..."
    infoLabel.Parent = gui
    
    -- Label slap info
    local slapLabel = Instance.new("TextLabel")
    slapLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
    slapLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
    slapLabel.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
    slapLabel.BackgroundTransparency = 0.3
    slapLabel.TextColor3 = Color3.new(1, 1, 1)
    slapLabel.TextScaled = true
    slapLabel.Font = Enum.Font.GothamBlack
    slapLabel.Text = ""
    slapLabel.Parent = gui
    
    -- Frame untuk animation
    local animationFrame = Instance.new("Frame")
    animationFrame.Size = UDim2.new(0, 200, 0, 200)
    animationFrame.Position = UDim2.new(0.5, -100, 0.5, -100)
    animationFrame.BackgroundColor3 = Color3.new(1, 0, 0)
    animationFrame.BackgroundTransparency = 1
    animationFrame.Parent = gui
    
    -- Slap button
    local slapButton = Instance.new("TextButton")
    slapButton.Size = UDim2.new(0.3, 0, 0.1, 0)
    slapButton.Position = UDim2.new(0.35, 0, 0.8, 0)
    slapButton.BackgroundColor3 = Color3.new(1, 0.5, 0)
    slapButton.TextColor3 = Color3.new(1, 1, 1)
    slapButton.TextScaled = true
    slapButton.Font = Enum.Font.GothamBold
    slapButton.Text = "SLAP ORANG"
    slapButton.Parent = gui
    
    -- Handle karakter player
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Touch connection untuk slap detection
        local touchConnection
        touchConnection = humanoidRootPart.Touched:Connect(function(hit)
            if hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
                local slappedPlayer = Players:GetPlayerFromCharacter(hit.Parent)
                if slappedPlayer and slappedPlayer ~= player then
                    -- Player kena slap!
                    infoLabel.Text = "KAMU DI-SLAP OLEH: " .. slappedPlayer.Name .. "!"
                    slapLabel.Text = slappedPlayer.Name .. " MENAMPARMU!"
                    
                    -- Efek visual di server untuk semua player
                    createSlapEffect(hit.Position)
                    
                    -- Shake effect di client
                    local bindable = Instance.new("BindableFunction")
                    bindable.OnInvoke = function()
                        -- Client effects
                    end
                    
                    -- Notifikasi ke semua player
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= player then
                            local notification = Instance.new("Message")
                            notification.Text = player.Name .. " di-slap oleh " .. slappedPlayer.Name .. "!"
                            notification.Parent = p:WaitForChild("PlayerGui")
                            Debris:AddItem(notification, 3)
                        end
                    end
                    
                    -- Reset setelah 3 detik
                    wait(3)
                    infoLabel.Text = "Menunggu Slap..."
                    slapLabel.Text = ""
                end
            end
        end)
        
        -- Cleanup
        character.Humanoid.Died:Connect(function()
            touchConnection:Disconnect()
        end)
    end)
    
    -- Slap button functionality
    slapButton.MouseButton1Click:Connect(function()
        -- Cari target terdekat
        local character = player.Character
        if not character then return end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then return end
        
        local closestPlayer = nil
        local closestDistance = math.huge
        local slapRange = 20 -- Range slap
        
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar then
                    local otherRoot = otherChar:FindFirstChild("HumanoidRootPart")
                    if otherRoot then
                        local distance = (humanoidRootPart.Position - otherRoot.Position).magnitude
                        if distance < closestDistance and distance < slapRange then
                            closestDistance = distance
                            closestPlayer = otherPlayer
                        end
                    end
                end
            end
        end
        
        if closestPlayer then
            -- Slap target terdekat
            local slappedChar = closestPlayer.Character
            if slappedChar and slappedChar:FindFirstChild("Humanoid") then
                -- Efek slap
                createSlapEffect(slappedChar.HumanoidRootPart.Position)
                
                -- Kirim message ke slapper
                local message = Instance.new("Message")
                message.Text = "Kamu menampar " .. closestPlayer.Name .. "!"
                message.Parent = player:WaitForChild("PlayerGui")
                Debris:AddItem(message, 2)
                
                -- Update label untuk target
                local targetGui = closestPlayer:FindFirstChild("PlayerGui"):FindFirstChild("SlapGUI")
                if targetGui then
                    local infoLabel = targetGui:FindFirstChild("infoLabel")
                    local slapLabel = targetGui:FindFirstChild("slapLabel")
                    if infoLabel and slapLabel then
                        infoLabel.Text = "KAMU DI-SLAP OLEH: " .. player.Name .. "!"
                        slapLabel.Text = player.Name .. " MENAMPARMU!"
                        
                        -- Reset
                        delay(3, function()
                            if infoLabel and infoLabel.Parent then
                                infoLabel.Text = "Menunggu Slap..."
                                slapLabel.Text = ""
                            end
                        end)
                    end
                end
            end
        else
            -- Tidak ada target dalam range
            local message = Instance.new("Message")
            message.Text = "Tidak ada pemain dalam jangkauan!"
            message.Parent = player:WaitForChild("PlayerGui")
            Debris:AddItem(message, 2)
        end
    end)
end

-- Handle player bergabung
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)

-- Leaderboard untuk stats slap
local function setupLeaderboard(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    
    local slapStat = Instance.new("NumberValue")
    slapStat.Name = "Slaps"
    slapStat.Value = 0
    
    slapStat.Parent = leaderstats
    leaderstats.Parent = player
end

Players.PlayerAdded:Connect(setupLeaderboard)
for _, player in ipairs(Players:GetPlayers()) do
    setupLeaderboard(player)
end
