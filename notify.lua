local NotificationLibrary = {}

local AbyssGUI = Instance.new("ScreenGui")
AbyssGUI.Name = "Abyss"
AbyssGUI.Parent = game.CoreGui
AbyssGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function NotificationLibrary:Notify(TitleText, Desc, Delay, SoundId, IconId, Volume)
    local Notification = Instance.new("Frame")
    local Line = Instance.new("Frame")
    local Warning = Instance.new("ImageLabel")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Description = Instance.new("TextLabel")
    local Sound = Instance.new("Sound")

    Notification.Name = "Notification"
    Notification.Parent = AbyssGUI
    Notification.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Notification.BackgroundTransparency = 0.3
    Notification.BorderSizePixel = 0
    Notification.Position = UDim2.new(1, -455, 1, -80)
    Notification.Size = UDim2.new(0, 450, 0, 60)
    Notification.ClipsDescendants = true

    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Notification

    Line.Name = "Line"
    Line.Parent = Notification
    Line.BackgroundColor3 = Color3.fromRGB(241, 196, 15)
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0, 0, 0.95, 0)
    Line.Size = UDim2.new(0, 0, 0, 4)

    Warning.Name = "Warning"
    Warning.Parent = Notification
    Warning.BackgroundTransparency = 1.000
    Warning.Position = UDim2.new(0.03, 0, 0.15, 0)
    Warning.Size = UDim2.new(0, 40, 0, 40)
    Warning.Image = IconId or "rbxassetid://3944668821"
    Warning.ImageColor3 = Color3.fromRGB(241, 196, 15)

    Title.Name = "Title"
    Title.Parent = Notification
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.15, 0, 0.15, 0)
    Title.Size = UDim2.new(0, 300, 0, 15)
    Title.Text = TitleText
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Description.Name = "Description"
    Description.Parent = Notification
    Description.BackgroundTransparency = 1.000
    Description.Position = UDim2.new(0.15, 0, 0.5, 0)
    Description.Size = UDim2.new(0, 300, 0, 18)
    Description.Text = Desc
    Description.TextColor3 = Color3.fromRGB(200, 200, 200)
    Description.TextSize = 12
    Description.Font = Enum.Font.Gotham
    Description.TextXAlignment = Enum.TextXAlignment.Left

    Sound.Name = "NotificationSound"
    Sound.Parent = Notification
    Sound.SoundId = SoundId or "rbxassetid://911123820"
    Sound.Volume = Volume or 1
    Sound:Play()

    Notification:TweenPosition(UDim2.new(1, -455, 1, -120), "Out", "Sine", 0.35)
    wait(0.35)
    Line:TweenSize(UDim2.new(0, 450, 0, 4), "Out", "Linear", Delay)
    wait(Delay)
    Notification:TweenPosition(UDim2.new(1, -455, 1, 50), "Out", "Sine", 0.35)
    wait(0.35)
    Notification:Destroy()
end

getgenv().Notify = function(Title, Desc, Delay, SoundId, IconId, Volume)
    NotificationLibrary:Notify(Title, Desc, Delay, SoundId, IconId, Volume)
end

return NotificationLibrary
