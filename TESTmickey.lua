local function openHub()
    -- ================= KEY SYSTEM =================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local VALID_KEY = "MICKEY2026"

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "MickeyKeySystem"
KeyGui.Parent = player:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 420, 0, 240)
Main.Position = UDim2.new(0.5, -210, 0.5, -120)
Main.BackgroundColor3 = Color3.fromRGB(18,18,25)
Main.BorderSizePixel = 0
Main.Parent = KeyGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0,12)
UICorner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(70,120,255)
Stroke.Thickness = 2
Stroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,50)
Title.BackgroundTransparency = 1
Title.Text = "MICKEY HUB KEY SYSTEM"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.new(1,1,1)
Title.Parent = Main

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0,360,0,45)
KeyBox.Position = UDim2.new(0.5,-180,0,80)
KeyBox.PlaceholderText = "Enter Key..."
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 18
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.BackgroundColor3 = Color3.fromRGB(30,30,40)
KeyBox.Parent = Main

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0,8)
KeyCorner.Parent = KeyBox

local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0,170,0,45)
CheckBtn.Position = UDim2.new(0,30,0,150)
CheckBtn.Text = "CHECK KEY"
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextSize = 18
CheckBtn.TextColor3 = Color3.new(1,1,1)
CheckBtn.BackgroundColor3 = Color3.fromRGB(50,120,255)
CheckBtn.Parent = Main

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0,8)
BtnCorner.Parent = CheckBtn

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0,170,0,45)
GetKeyBtn.Position = UDim2.new(0,220,0,150)
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 18
GetKeyBtn.TextColor3 = Color3.new(1,1,1)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(90,90,90)
GetKeyBtn.Parent = Main

local GetCorner = Instance.new("UICorner")
GetCorner.CornerRadius = UDim.new(0,8)
GetCorner.Parent = GetKeyBtn

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1,0,0,30)
Status.Position = UDim2.new(0,0,1,-35)
Status.BackgroundTransparency = 1
Status.Text = ""
Status.Font = Enum.Font.Gotham
Status.TextSize = 16
Status.TextColor3 = Color3.new(1,1,1)
Status.Parent = Main

-- เปิดลิงก์รับคีย์
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://yourlink.com")
    Status.Text = "Link copied!"
    Status.TextColor3 = Color3.fromRGB(0,255,120)
end)

-- เช็คคีย์
local KeyCorrect = false

CheckBtn.MouseButton1Click:Connect(function()

    if KeyBox.Text == VALID_KEY then
        KeyCorrect = true

        Status.Text = "Access Granted"
        Status.TextColor3 = Color3.fromRGB(0,255,120)

        wait(1)

        KeyGui:Destroy()

        -- เปิด HUB ตรงนี้

    else
        Status.Text = "Invalid Key"
        Status.TextColor3 = Color3.fromRGB(255,70,70)
    end
end)

repeat wait() until KeyCorrect
-- Utility GUI (Rectangular design, smooth, shadow teleport)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- state
local flying = false
local noclip = false
local invisible = false
local espEnabled = true
local ghost = false
local speed = 50

local flyConnection, noclipConnection

-- Shadow teleport variables
local shadowCFrame = nil
local shadowPart = nil
local shadowPlaced = false

-- GUI root
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "UtilityGUI"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame (rectangular)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 700)
Frame.Position = UDim2.new(0, 12, 0, 12)
Frame.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 48)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(12, 95, 180)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -160, 1, 0)
Title.Position = UDim2.new(0, 16, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "MICKEY HUB"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

-- Title gradient
local TitleGrad = Instance.new("UIGradient")
TitleGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(18,95,180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10,60,140))
}
TitleGrad.Rotation = 0
TitleGrad.Parent = TitleBar

-- Buttons: Close and Minimize
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 70, 1, -8)
CloseBtn.Position = UDim2.new(1, -78, 0, 4)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "Close"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamSemibold
CloseBtn.TextSize = 14
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 70, 1, -8)
MinBtn.Position = UDim2.new(1, -156, 0, 4)
MinBtn.BackgroundColor3 = Color3.fromRGB(100,100,100)
MinBtn.Text = "Min"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.Font = Enum.Font.GothamSemibold
MinBtn.TextSize = 14
MinBtn.BorderSizePixel = 0
MinBtn.Parent = TitleBar

-- Content container
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -48)
Content.Position = UDim2.new(0, 0, 0, 48)
Content.BackgroundTransparency = 1
Content.Parent = Frame

-- Left panel for buttons
local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Size = UDim2.new(0, 280, 0, 360)
ButtonsFrame.Position = UDim2.new(0, 10, 0, 10)
ButtonsFrame.BackgroundColor3 = Color3.fromRGB(26, 32, 44)
ButtonsFrame.BorderSizePixel = 0
ButtonsFrame.Parent = Content

local ButtonsGrad = Instance.new("UIGradient")
ButtonsGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(28,34,48)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(22,28,40))
}
ButtonsGrad.Rotation = 90
ButtonsGrad.Parent = ButtonsFrame

local ButtonsStroke = Instance.new("UIStroke")
ButtonsStroke.Color = Color3.fromRGB(60,60,70)
ButtonsStroke.Thickness = 1
ButtonsStroke.Parent = ButtonsFrame

-- Helper: create rectangular button with hover tween and icon label
local function createButton(text, posY)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 260, 0, 46)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(45, 105, 185)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    btn.Parent = ButtonsFrame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(100,140,220)
    stroke.Transparency = 0.6
    stroke.Parent = btn

    -- hover effect
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(60,130,220)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(45,105,185)}):Play()
    end)
    return btn
end

-- Create main buttons
local FlyButton = createButton("Fly: OFF", 8)
local NoclipButton = createButton("Noclip: OFF", 64)
local InvisibleButton = createButton("Invisible: OFF", 120)
local ESPButton = createButton("ESP: ON", 176)
local GhostButton = createButton("Ghost: OFF", 232)

-- Shadow buttons (design-forward)
local PlaceShadowButton = createButton("Place Shadow", 288)
local ReturnShadowButton = createButton("Return to Shadow", 344)

-- Right panel: player list
local PlayerTitle = Instance.new("TextLabel")
PlayerTitle.Size = UDim2.new(0, 260, 0, 28)
PlayerTitle.Position = UDim2.new(0, 10, 0, 420)
PlayerTitle.BackgroundTransparency = 1
PlayerTitle.Text = "Players"
PlayerTitle.TextColor3 = Color3.fromRGB(220, 230, 255)
PlayerTitle.Font = Enum.Font.GothamBold
PlayerTitle.TextSize = 15
PlayerTitle.Parent = Content

local PlayerList = Instance.new("ScrollingFrame")
PlayerList.Size = UDim2.new(0, 280, 0, 240)
PlayerList.Position = UDim2.new(0, 10, 0, 456)
PlayerList.CanvasSize = UDim2.new(0,0,0,0)
PlayerList.ScrollBarThickness = 6
PlayerList.BackgroundColor3 = Color3.fromRGB(18,22,30)
PlayerList.BorderSizePixel = 0
PlayerList.Parent = Content

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0,8)
UIListLayout.Parent = PlayerList

-- Small helper: play click sound
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://142070127" -- subtle click (replace if desired)
clickSound.Volume = 0.6
clickSound.Parent = SoundService

local function playClick()
    pcall(function() clickSound:Play() end)
end

-- Smooth show/hide (minimize)
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(Frame, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 300, 0, 48)}):Play()
        Content.Visible = false
    else
        TweenService:Create(Frame, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 300, 0, 700)}):Play()
        wait(0.22)
        Content.Visible = true
    end
    playClick()
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
    playClick()
end)

-- ================= FLY =================
local function startFly()
    if flying then return end
    flying = true
    FlyButton.Text = "Fly: ON"
    FlyButton.BackgroundColor3 = Color3.fromRGB(50,220,50)
    playClick()

    local bv = Instance.new("BodyVelocity")
    bv.Name = "FlyVelocity"
    bv.MaxForce = Vector3.new(1e5,1e5,1e5)
    bv.Velocity = Vector3.zero
    bv.Parent = rootPart

    local bg = Instance.new("BodyGyro")
    bg.Name = "FlyGyro"
    bg.MaxTorque = Vector3.new(1e5,1e5,1e5)
    bg.P = 12500
    bg.Parent = rootPart

    flyConnection = RunService.Heartbeat:Connect(function()
        if not flying then return end
        local dir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += rootPart.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= rootPart.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= rootPart.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += rootPart.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0,1,0) end

        if dir.Magnitude > 0 then
            bv.Velocity = dir.Unit * speed
        else
            bv.Velocity = Vector3.zero
        end
        bg.CFrame = rootPart.CFrame
    end)
end

local function stopFly()
    flying = false
    FlyButton.Text = "Fly: OFF"
    FlyButton.BackgroundColor3 = Color3.fromRGB(220,50,50)
    if flyConnection then flyConnection:Disconnect() end
    if rootPart:FindFirstChild("FlyVelocity") then rootPart.FlyVelocity:Destroy() end
    if rootPart:FindFirstChild("FlyGyro") then rootPart.FlyGyro:Destroy() end
    playClick()
end

-- ================= NOCLIP =================
local function startNoclip()
    noclip = true
    NoclipButton.Text = "Noclip: ON"
    NoclipButton.BackgroundColor3 = Color3.fromRGB(50,220,50)
    playClick()
    noclipConnection = RunService.Stepped:Connect(function()
        if not noclip then return end
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

local function stopNoclip()
    noclip = false
    NoclipButton.Text = "Noclip: OFF"
    NoclipButton.BackgroundColor3 = Color3.fromRGB(220,50,50)
    if noclipConnection then noclipConnection:Disconnect() end
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end
    playClick()
end

-- ================= GHOST =================
local function setGhost(state)
    ghost = state
    GhostButton.Text = "Ghost: " .. (state and "ON" or "OFF")
    GhostButton.BackgroundColor3 = state and Color3.fromRGB(50,220,50) or Color3.fromRGB(220,50,50)
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
            part.CanTouch = not state
            part.CanQuery = not state
        end
    end
    playClick()
end

-- ================= INVISIBLE =================
local function setInvisible(state)
    invisible = state
    InvisibleButton.Text = "Invisible: " .. (state and "ON" or "OFF")
    InvisibleButton.BackgroundColor3 = state and Color3.fromRGB(50,220,50) or Color3.fromRGB(220,50,50)
    for _, obj in pairs(character:GetDescendants()) do
        if obj:IsA("BasePart") then
            if obj.Name ~= "HumanoidRootPart" then
                obj.Transparency = state and 1 or 0
            end
        elseif obj:IsA("Decal") then
            obj.Transparency = state and 1 or 0
        elseif obj:IsA("Accessory") then
            local handle = obj:FindFirstChild("Handle")
            if handle then handle.Transparency = state and 1 or 0 end
        end
    end
    playClick()
end

-- ================= ESP =================
local function createESP(plr)
    if plr == player then return end
    local function setup(char)
        local head = char:WaitForChild("Head")
        if head:FindFirstChild("PlayerESP") then return end

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "PlayerESP"
        billboard.Adornee = head
        billboard.Size = UDim2.new(0,200,0,50)
        billboard.StudsOffset = Vector3.new(0,3,0)
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = math.huge
        billboard.Enabled = espEnabled
        billboard.Parent = head

        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1,0,1,0)
        text.BackgroundTransparency = 1
        text.Text = plr.Name
        text.TextColor3 = Color3.fromRGB(255,0,0)
        text.TextStrokeTransparency = 0
        text.TextScaled = true
        text.Font = Enum.Font.GothamBold
        text.Parent = billboard

        local highlight = Instance.new("Highlight")
        highlight.FillTransparency = 1
        highlight.OutlineColor = Color3.fromRGB(255,0,0)
        highlight.Enabled = espEnabled
        highlight.Parent = char
    end

    if plr.Character then setup(plr.Character) end
    plr.CharacterAdded:Connect(setup)
end

for _, plr in pairs(Players:GetPlayers()) do createESP(plr) end
Players.PlayerAdded:Connect(createESP)

local function toggleESP()
    espEnabled = not espEnabled
    ESPButton.Text = "ESP: " .. (espEnabled and "ON" or "OFF")
    ESPButton.BackgroundColor3 = espEnabled and Color3.fromRGB(50,220,50) or Color3.fromRGB(220,50,50)
    for _, plr in pairs(Players:GetPlayers()) do
        if plr.Character then
            local head = plr.Character:FindFirstChild("Head")
            if head and head:FindFirstChild("PlayerESP") then
                head.PlayerESP.Enabled = espEnabled
            end
            local hl = plr.Character:FindFirstChildOfClass("Highlight")
            if hl then hl.Enabled = espEnabled end
        end
    end
    playClick()
end

-- ================= TELEPORT TO PLAYER =================
local function teleportToPlayer(target)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        rootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
    end
end

-- ================= PLAYER LIST =================
local function refreshPlayerList()
    for _, child in pairs(PlayerList:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1,-8,0,36)
            btn.Text = plr.Name
            btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.BorderSizePixel = 0
            btn.Parent = PlayerList
            btn.MouseButton1Click:Connect(function()
                teleportToPlayer(plr)
            end)
        end
    end
    PlayerList.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
end

refreshPlayerList()
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

-- ================= SHADOW MARKER HELPERS =================
local function createShadowMarker(cf)
    if shadowPart and shadowPart.Parent then
        shadowPart.CFrame = cf
        return
    end
    local part = Instance.new("Part")
    part.Name = "ShadowMarker"
    part.Size = Vector3.new(1.2,1.2,1.2)
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 0.45
    part.Material = Enum.Material.Neon
    part.Color = Color3.fromRGB(140, 80, 255)
    part.CFrame = cf
    part.Parent = workspace

    -- pulse tween (transparency oscillation)
    local tweenInfo = TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    local tween = TweenService:Create(part, tweenInfo, {Transparency = 0.75})
    tween:Play()

    -- subtle size pulse
    local sizeTween = TweenService:Create(part, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Size = Vector3.new(1.6,1.6,1.6)})
    sizeTween:Play()

    shadowPart = part
end

local function removeShadowMarker()
    if shadowPart then
        pcall(function() shadowPart:Destroy() end)
        shadowPart = nil
    end
end

-- Place shadow at current root position
local function placeShadow()
    if not rootPart then return end
    shadowCFrame = rootPart.CFrame
    shadowPlaced = true
    createShadowMarker(shadowCFrame)
    -- quick feedback
    TweenService:Create(PlaceShadowButton, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(90,160,255)}):Play()
    wait(0.12)
    TweenService:Create(PlaceShadowButton, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(45,105,185)}):Play()
    playClick()
end

-- Teleport back to shadow
local function returnToShadow()
    if not shadowPlaced or not shadowCFrame then return end
    if not character or not character.Parent then return end

    -- safety: raycast up a bit to avoid being stuck inside ground
    local targetCFrame = shadowCFrame
    -- try to ensure space above ground
    local checkPos = targetCFrame.Position + Vector3.new(0, 3, 0)
    rootPart.CFrame = CFrame.new(checkPos)
    -- optional: keep shadow persistent; comment out next two lines to make single-use
    -- shadowPlaced = false
    -- removeShadowMarker()

    TweenService:Create(ReturnShadowButton, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(90,160,255)}):Play()
    wait(0.12)
    TweenService:Create(ReturnShadowButton, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(45,105,185)}):Play()
    playClick()
end

-- ================= BUTTON CONNECTIONS =================
FlyButton.MouseButton1Click:Connect(function()
    if flying then stopFly() else startFly() end
end)

NoclipButton.MouseButton1Click:Connect(function()
    if noclip then stopNoclip() else startNoclip() end
end)

InvisibleButton.MouseButton1Click:Connect(function()
    setInvisible(not invisible)
end)

ESPButton.MouseButton1Click:Connect(function()
    toggleESP()
end)

GhostButton.MouseButton1Click:Connect(function()
    setGhost(not ghost)
end)

PlaceShadowButton.MouseButton1Click:Connect(function()
    placeShadow()
end)

ReturnShadowButton.MouseButton1Click:Connect(function()
    returnToShadow()
end)

-- Keyboard shortcuts (Q = place, E = return)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.Q then
            placeShadow()
        elseif input.KeyCode == Enum.KeyCode.E then
            returnToShadow()
        end
    end
end)

-- Cleanup on respawn
player.CharacterAdded:Connect(function(newChar)
    stopFly()
    stopNoclip()
    invisible = false
    ghost = false
    character = newChar
    rootPart = newChar:WaitForChild("HumanoidRootPart")
    humanoid = newChar:WaitForChild("Humanoid")
    
    shadowCFrame = nil
    shadowPlaced = false
    removeShadowMarker()
end)


    local KeyCorrect = false

    CheckBtn.MouseButton1Click:Connect(function()
        if KeyBox.Text == VALID_KEY then
            KeyCorrect = true
            Status.Text = "Access Granted"
            Status.TextColor3 = Color3.fromRGB(0,255,120)
            wait(1)
            KeyGui:Destroy()
            
           
        else
            Status.Text = "Invalid Key"
            Status.TextColor3 = Color3.fromRGB(255,70,70)
        end
    end)
end


openHub()
