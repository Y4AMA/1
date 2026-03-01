-- Script Simple "Find Who Slapped"
-- Script By Neko

local Players = game:GetService("Players")
local Debris = game:GetService("Debris")

-- Fungsi efek slap (opsional, biar ada visual)
local function createSlapEffect(position)
    local part = Instance.new("Part")
    part.Shape = Enum.PartType.Ball
    part.Material = Enum.Material.Neon
    part.BrickColor = BrickColor.new("Bright red")
    part.Size = Vector3.new(2, 2, 2)
    part.CanCollide = false
    part.Position = position
    part.Parent = workspace
    
    game:GetService("TweenService"):Create(
        part,
        TweenInfo.new(0.5),
        {Size = Vector3.new(0, 0, 0)}
    ):Play()
    
    Debris:AddItem(part, 0.5)
end

-- Fungsi utama deteksi slap
local function onPlayerAdded(player)
    -- Deteksi ketika karakter muncul
    player.CharacterAdded:Connect(function(character)
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Deteksi ketika kena sentuh (touched)
        humanoidRootPart.Touched:Connect(function(hit)
            -- Cek apakah yang menyentuh adalah karakter pemain
            if hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
                local slapper = Players:GetPlayerFromCharacter(hit.Parent)
                local slappedPlayer = player
                
                -- Validasi: bukan diri sendiri dan slapper valid
                if slapper and slapper ~= slappedPlayer then
                    -- EFEK: bola merah di lokasi slap
                    createSlapEffect(hit.Position)
                    
                    -- NOTIFIKASI KE SEMUA PLAYER
                    local slapMessage = slapper.Name .. " menampar " .. slappedPlayer.Name .. "! 👋"
                    
                    -- Kirim notifikasi ke semua player
                    for _, p in ipairs(Players:GetPlayers()) do
                        local notification = Instance.new("Message")
                        notification.Text = slapMessage
                        notification.Parent = p:WaitForChild("PlayerGui")
                        Debris:AddItem(notification, 3) -- Hilang setelah 3 detik
                    end
                    
                    -- Opsional: print di console server
                    print(slapMessage)
                end
            end
        end)
    end)
end

-- Terapkan untuk semua pemain
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)
