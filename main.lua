-- Script untuk game "Find Who Slapped"
-- Script By Neko

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- SETTINGS
local slapRange = 15 -- Jarak deteksi tamparan
local notificationDuration = 3 -- Durasi notifikasi
local dodgeChance = 40 -- Persentase chance Dodge (0-100)
local slapCooldown = 1.5 -- Cooldown biar ga spam

-- BUAT AUDIO UNTUK DODGE
local function createDodgeSound()
    -- Cek apakah sound sudah ada
    local existingSound = LocalPlayer.PlayerGui:FindFirstChild("DodgeSound")
    if existingSound then return existingSound end
    
    -- Buat Sound object
    local sound = Instance.new("Sound")
    sound.Name = "DodgeSound"
    sound.SoundId = "rbxassetid://9120383136" -- Sound efek Dodge (bisa diganti)
    sound.Volume = 0.8
    sound.Parent = LocalPlayer.PlayerGui
    
    -- Alternative sound IDs (coba kalo yg atas ga work):
    -- 9120383136 (whoosh)
    -- 142660553 (slip)
    -- 2760979569 (cartoon dodge)
    
    return sound
end

-- BUAT GUI NOTIFIKASI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SlapNotificationGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Background notifikasi (atas)
local notificationFrame = Instance.new("Frame")
notificationFrame.Size = UDim2.new(0.5, 0, 0.12, 0)
notificationFrame.Position = UDim2.new(0.25, 0, 0.02, 0)
notificationFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notificationFrame.BackgroundTransparency = 0.4
notificationFrame.BorderSizePixel = 0
notificationFrame.Visible = false
notificationFrame.Parent = screenGui

-- Label notifikasi
local notificationLabel = Instance.new("TextLabel")
notificationLabel.Size = UDim2.new(1, 0, 1, 0)
notificationLabel.BackgroundTransparency = 1
notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationLabel.TextScaled = true
notificationLabel.Font = Enum.Font.GothamBold
notificationLabel.Text = ""
notificationLabel.Parent = notificationFrame

-- UI Corner
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = notificationFrame

-- Background notifikasi DODGE (bawah)
local dodgeFrame = Instance.new("Frame")
dodgeFrame.Size = UDim2.new(0.4, 0, 0.1, 0)
dodgeFrame.Position = UDim2.new(0.3, 0, 0.15, 0)
dodgeFrame.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
dodgeFrame.BackgroundTransparency = 0.3
dodgeFrame.BorderSizePixel = 0
dodgeFrame.Visible = false
dodgeFrame.Parent = screenGui

local dodgeLabel = Instance.new("TextLabel")
dodgeLabel.Size = UDim2.new(1, 0, 1, 0)
dodgeLabel.BackgroundTransparency = 1
dodgeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
dodgeLabel.TextScaled = true
dodgeLabel.Font = Enum.Font.GothamBlack
dodgeLabel.Text = "⚡ DODGE! ⚡"
dodgeLabel.Parent = dodgeFrame

local dodgeCorner = Instance.new("UICorner")
dodgeCorner.CornerRadius = UDim.new(0, 10)
dodgeCorner.Parent = dodgeFrame

-- Inisialisasi sound
local dodgeSound = createDodgeSound()

-- Fungsi untuk menampilkan notifikasi
local function showNotification(message, notifType)
    if notifType == "slap" then
        notificationFrame.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- Merah kena tampar
        notificationFrame.Visible = true
        notificationLabel.Text = message
        
        task.wait(notificationDuration)
        notificationFrame.Visible = false
        
    elseif notifType == "dodge" then
        dodgeFrame.Visible = true
        
        -- Mainkan suara Dodge
        if dodgeSound then
            dodgeSound:Play()
        end
        
        -- Efek getar dikit (kalo support)
        pcall(function()
            UserInputService:SetVibration(Enum.VibrationMotor.Medium, 0.3)
        end)
        
        task.wait(1.5)
        dodgeFrame.Visible = false
    end
end

-- Deteksi tamparan dengan sistem DODGE
local lastInteraction = {}
local playersInRange = {}

-- Fungsi untuk cek apakah bisa dodge
local function tryDodge()
    local chance = math.random(1, 100)
    return chance <= dodgeChance
end

-- Loop deteksi utama
spawn(function()
    print("🚀 Script Find Who Slapped + Dodge Aktif!")
    print("🎯 Chance Dodge: " .. dodgeChance .. "%")
    
    while task.wait(0.1) do
        local myChar = LocalPlayer.Character
        if not myChar then 
            -- Reset kalau karakter mati/respawn
            playersInRange = {}
            continue 
        end
        
        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then continue end
        
        local currentTime = tick()
        
        -- Reset list pemain dalam range
        local currentPlayersInRange = {}
        
        -- Cek semua pemain lain
        for _, player in ipairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            
            local theirChar = player.Character
            if not theirChar then continue end
            
            local theirRoot = theirChar:FindFirstChild("HumanoidRootPart")
            if not theirRoot then continue end
            
            -- Cek jarak
            local distance = (myRoot.Position - theirRoot.Position).Magnitude
            
            if distance < slapRange then
                table.insert(currentPlayersInRange, player)
                
                -- Deteksi apakah ini "tamparan" (pemain baru masuk range)
                local wasInRange = false
                for _, p in ipairs(playersInRange) do
                    if p == player then
                        wasInRange = true
                        break
                    end
                end
                
                -- Kalau baru masuk range (dianggap nyoba tampar)
                if not wasInRange then
                    local key = player.UserId
                    
                    -- Cek cooldown
                    if not lastInteraction[key] or (currentTime - lastInteraction[key]) > slapCooldown then
                        lastInteraction[key] = currentTime
                        
                        -- COBA DODGE!
                        if tryDodge() then
                            -- BERHASIL DODGE!
                            showNotification("💨 BERHASIL DODGE dari " .. player.Name .. "!", "dodge")
                            
                            -- Opsional: efek lompat dikit
                            pcall(function()
                                if myRoot then
                                    myRoot.Velocity = myRoot.Velocity + Vector3.new(0, 30, 0)
                                end
                            end)
                            
                        else
                            -- GAGAL DODGE, KENA TAMPAR!
                            showNotification("👋 KENA TAMPAR oleh " .. player.Name .. "!", "slap")
                        end
                        
                        -- Notifikasi ke semua (opsional, bisa dihapus kalo mau)
                        -- for _, p in ipairs(Players:GetPlayers()) do
                        --     if p ~= LocalPlayer then
                        --         -- Kirim sinyal kalo bisa (butuh remote event)
                        --     end
                        -- end
                    end
                end
            end
        end
        
        -- Update list pemain dalam range
        playersInRange = currentPlayersInRange
    end
end)

-- Fitur tambahan: Tampilkan info dengan menekan F
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F then
        local message = "🔔 FIND WHO SLAPPED + DODGE\n"
        message = message .. "🎯 Dodge Chance: " .. dodgeChance .. "%\n"
        message = message .. "📏 Range: " .. slapRange .. " studs\n"
        message = message .. "👥 Pemain dalam range: " .. #playersInRange
        
        showNotification(message, "slap")
    end
end)

-- Instruction di console
print("📌 Tekan F untuk info")
print("🎧 Audio Dodge aktif!")
