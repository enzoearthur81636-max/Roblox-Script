-- LocalScript em StarterPlayerScripts

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Caixa estilo executor
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Parent = screenGui

-- Botão salvar
local saveButton = Instance.new("TextButton")
saveButton.Size = UDim2.new(0, 260, 0, 40)
saveButton.Position = UDim2.new(0, 20, 0, 40)
saveButton.Text = "Salvar Local"
saveButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
saveButton.TextColor3 = Color3.fromRGB(255,255,255)
saveButton.Parent = frame

-- Botão voltar
local returnButton = Instance.new("TextButton")
returnButton.Size = UDim2.new(0, 260, 0, 40)
returnButton.Position = UDim2.new(0, 20, 0, 100)
returnButton.Text = "Voltar ao Local"
returnButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
returnButton.TextColor3 = Color3.fromRGB(255,255,255)
returnButton.Parent = frame

-- Variável para guardar posição
local savedPosition = nil

-- Função salvar
saveButton.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        savedPosition = char.HumanoidRootPart.Position
        saveButton.Text = "Local Salvo!"
    end
end)

-- Função voltar
returnButton.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") and savedPosition then
        char.HumanoidRootPart.CFrame = CFrame.new(savedPosition + Vector3.new(0,5,0))
        returnButton.Text = "Teleportado!"
    end
end)
