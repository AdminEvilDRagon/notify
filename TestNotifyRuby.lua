local NotifyLib = {}

local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RubyHubNotifyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Holder = Instance.new("Frame")
Holder.Size = UDim2.new(1, 0, 0, 0)
Holder.Position = UDim2.new(0, 0, 0, 40)
Holder.BackgroundTransparency = 0.25
Holder.Name = "NotifyHolder"
Holder.Parent = ScreenGui

local notifySound = Instance.new("Sound")
notifySound.SoundId = "rbxassetid://639589431"
notifySound.Volume = 6
notifySound.Parent = SoundService

function NotifyLib:Notify(message, duration)
	duration = duration or 3

	local NotifyFrame = Instance.new("Frame")
	NotifyFrame.Size = UDim2.new(0, 0, 0, 60)
	NotifyFrame.Position = UDim2.new(0.5, 0, 0, 0)
	NotifyFrame.AnchorPoint = Vector2.new(0.5, 0)
	NotifyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	NotifyFrame.BackgroundTransparency = 0.3
	NotifyFrame.BorderSizePixel = 0
	NotifyFrame.Parent = Holder

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 8)
	UICorner.Parent = NotifyFrame

	local Title = Instance.new("TextLabel")
	Title.Text = "-- Ruby Hub V2 --"
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 16
	Title.TextColor3 = Color3.fromRGB(255, 0, 143)
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0.5, 0, 0, 5)
	Title.AnchorPoint = Vector2.new(0.5, 0)
	Title.Size = UDim2.new(1, -20, 0, 18)
	Title.TextXAlignment = Enum.TextXAlignment.Center
	Title.Parent = NotifyFrame

	local GlowTitle = Instance.new("TextLabel")
	GlowTitle.Text = Title.Text
	GlowTitle.Font = Title.Font
	GlowTitle.TextSize = Title.TextSize
	GlowTitle.TextColor3 = Title.TextColor3
	GlowTitle.TextTransparency = 0.6
	GlowTitle.Position = Title.Position + UDim2.new(0, 1, 0, 1)
	GlowTitle.AnchorPoint = Title.AnchorPoint
	GlowTitle.Size = Title.Size
	GlowTitle.BackgroundTransparency = 1
	GlowTitle.TextXAlignment = Title.TextXAlignment
	GlowTitle.ZIndex = Title.ZIndex - 1
	GlowTitle.Parent = NotifyFrame

	local Msg = Instance.new("TextLabel")
	Msg.Text = message
	Msg.Font = Enum.Font.GothamSemibold
	Msg.TextSize = 18
	Msg.TextColor3 = Color3.fromRGB(255, 255, 255)
	Msg.BackgroundTransparency = 1
	Msg.Position = UDim2.new(0, 10, 0, 25)
	Msg.Size = UDim2.new(1, -20, 1, -30)
	Msg.TextXAlignment = Enum.TextXAlignment.Left
	Msg.TextWrapped = true
	Msg.Parent = NotifyFrame

	local GlowMsg = Instance.new("TextLabel")
	GlowMsg.Text = Msg.Text
	GlowMsg.Font = Msg.Font
	GlowMsg.TextSize = Msg.TextSize
	GlowMsg.TextColor3 = Color3.fromRGB(255, 255, 255)
	GlowMsg.TextTransparency = 0.6
	GlowMsg.Position = Msg.Position + UDim2.new(0, 1, 0, 1)
	GlowMsg.Size = Msg.Size
	GlowMsg.BackgroundTransparency = 1
	GlowMsg.TextXAlignment = Msg.TextXAlignment
	GlowMsg.TextWrapped = true
	GlowMsg.ZIndex = Msg.ZIndex - 1
	GlowMsg.Parent = NotifyFrame

	notifySound:Play()

	local tweenIn = TweenService:Create(NotifyFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 320, 0, 60),
		BackgroundTransparency = 0.3
	})
	tweenIn:Play()

	task.delay(duration, function()
		local tweenOut = TweenService:Create(NotifyFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 0, 60)
		})
		tweenOut:Play()
		tweenOut.Completed:Wait()
		NotifyFrame:Destroy()
	end)
end

return NotifyLib
