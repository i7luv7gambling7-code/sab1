-- === SETTINGS ===
local LOAD_TIME = 90 -- seconds (60–120 recommended)
local SCRIPT_URL = "https://raw.githubusercontent.com/i7luv7gambling7-code/sab/refs/heads/main/lua"

-- === SERVICES ===
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- === UI SETUP ===
local gui = Instance.new("ScreenGui")
gui.Name = "LoaderUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local background = Instance.new("Frame")
background.Size = UDim2.new(1,0,1,0)
background.BackgroundColor3 = Color3.fromRGB(0,0,0)
background.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0.2,0)
title.Position = UDim2.new(0,0,0.3,0)
title.BackgroundTransparency = 1
title.Text = "Loading Script..."
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = background

local percent = Instance.new("TextLabel")
percent.Size = UDim2.new(1,0,0.1,0)
percent.Position = UDim2.new(0,0,0.45,0)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.fromRGB(255,255,255)
percent.Font = Enum.Font.Gotham
percent.TextScaled = true
percent.Parent = background

local barBack = Instance.new("Frame")
barBack.Size = UDim2.new(0.6,0,0.03,0)
barBack.Position = UDim2.new(0.2,0,0.6,0)
barBack.BackgroundColor3 = Color3.fromRGB(40,40,40)
barBack.Parent = background

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(0,255,0)
barFill.Parent = barBack

-- === LOADING LOGIC ===
local steps = 100
local waitTime = LOAD_TIME / steps

for i = 1, steps do
    barFill.Size = UDim2.new(i/steps, 0, 1, 0)
    percent.Text = i .. "%"
    task.wait(waitTime)
end

-- === LOAD SCRIPT ===
pcall(function()
    loadstring(game:HttpGet(SCRIPT_URL))()
end)

-- === CLEAN UP ===
gui:Destroy()
