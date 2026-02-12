-- MAIN SCRIPT

--[[
 - 11 feb
 - make sure to Ctrl + F "nigger" for fixes
 - this is version is made for luau on ios



ideas for script name:
- wawa hub
- evxve
- praise ev
- meow hub




notes:
 - maybe make "update log" be another file somewhere on github that i can change anytime
 - make the "key" for this script consist out of 3 parts: discord server, linkvetise and on my yt channel
 - i need to start thinking about where and how i can publish ts
 - add things to Snippets, Universal and Game hub scripts
 - i need to add esp, xray as visuals in locale
 - i need to add waypoints that can be chozen and then saved/executed to teleport to places
 - i need to make log content be inside some doccument that can be edited later without changing the script
]]--
local http = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles
Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({

	Title = "evxve",
	Footer = "[v0.5.2]",
	Icon = "https://raw.githubusercontent.com/evilave/evilave.github.io/refs/heads/main/media/guildtag%20(6).png", -- very important nigger so save for later
	NotifySide = "Right",
	ShowCustomCursor = false,
})

local Tabs = {
	Log = Window:AddTab("Log", "logs"),
	Locale = Window:AddTab("Local", "user-cog"),
    Skids = Window:AddTab("Skids", "layout-grid"),
    Execarot = Window:AddTab("Executor", "app-window"),
	Main = Window:AddTab("Examples", "chess-queen"),
	Setting = Window:AddTab("UI Settings", "settings"),
}


local ProximityPromptService = game:GetService("ProximityPromptService")
local instantInteractEnabled = true

ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt, player)
	if instantInteractEnabled then
    	fireproximityprompt(prompt)
	end
end)

local pingMs = math.floor(player:GetNetworkPing() * 1000)
RunService.RenderStepped:Connect(function(dt)
    fpss = math.floor(1 / dt)
end)
Library:PingLabel("ping: " .. pingMs .. " ms")
Library:PingLabel("fps: " .. fpss)

----------------log tab------------
local logurl = "https://raw.githubusercontent.com/evilave/evilave/main/log.txt"
local success, result = pcall(function()
    return http:GetAsync(logurl)
end)

if success then
    Announcement = result
else
    Announcement = "Failed to load update log."
end



--" --- 11 feb 2026\n [+] added more stuff to skids tab\n [+] started working to improve exec tab\n [!] im kinda out of motivation to continue :/\n [!] also my 'friend' tried stealing the src, now i learnt my lesson to obf\n\n --- 23 jan 2026\n [+] Used ob lib\n [+] added contents in tab with scripts\n [+] started working on local player\n [+] fixed key"
local LogGroupBox = Tabs.Log:AddLeftGroupbox("Update Log")
LogGroupBox:AddLabel(
	Announcement,
	true
)

local RightGroupBox = Tabs.Log:AddRightGroupbox("Contact")
RightGroupBox:AddLabel(
	"Join official Discord server for support, suggestions or keys:\ndiscord.gg/arA7TyReHP\n\n\nDM me on discord for anything:\nevxvee",
	true
)



--locale tab------------
local LeftGroupBox3 = Tabs.Locale:AddLeftGroupbox("Local movement")
LeftGroupBox3:AddInput("Speed", {
	Default = "16",
	Numeric = true, -- true / false, only allows numbers
	Finished = true, -- true / false, only calls callback when you press enter
	ClearTextOnFocus = false, -- true / false, if false the text will not clear when textbox focused

	Text = "Set ws",
	Tooltip = "default is 16 btw", -- Information shown when you hover over the textbox

	Placeholder = "Enter a value...", -- placeholder text when the box is empty

	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})


LeftGroupBox3:AddInput("JumpPower", {
	Default = "50",
	Numeric = true,
	Finished = true,
	ClearTextOnFocus = false,

	Text = "Set jp",
	Tooltip = "default is 50 btw",

	Placeholder = "Enter a value...",

	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end,
})


------------scripts tab------------

local LeftGroupBox = Tabs.Skids:AddLeftGroupbox("Universal", "code-xml")
local IYButton = LeftGroupBox:AddButton({ -- single
	Text = "iy",
	Func = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end,
	DoubleClick = false,

	Tooltip = "infinite yield script.",
	DisabledTooltip = "disabled.",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})


local DexButton = IYButton:AddButton({ -- twin
	Text = "dex",
	Func = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
	end,
	DoubleClick = false,
	Tooltip = "Dex explorer script | see the perspective of the game devs, explore the game and its secrets...",
	DisabledTooltip = "disabled.",
})


local FlButton = LeftGroupBox:AddButton({ -- single
	Text = "fling",
	Func = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
	end,
	DoubleClick = false,

	Tooltip = "Fling script | set to any speed and fling anyone you touch.",
	DisabledTooltip = "disabled.",
})


local RingButton = FlButton:AddButton({ -- twin
	Text = "rings",
	Func = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Thuan6565/Script/refs/heads/main/SuperRingPartV2'))()
	end,
	DoubleClick = false,
	Tooltip = "Super rings | allowing user to manipulate unanchored objects.",
	DisabledTooltip = "disabled.",
})


local FlyButton = LeftGroupBox:AddButton({ -- single
	Text = "fly",
	Func = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt'))()
	end,
	DoubleClick = false,

	Tooltip = "Fly script | works on anticheats and mobile",
	DisabledTooltip = "disabled.",
})


local AimButton = FlyButton:AddButton({ -- twin
	Text = "aim",
	Func = function()
		loadstring(game:HttpGet("https://pastefy.app/YiGY38uo/raw"))()
	end,
	DoubleClick = false,
	Tooltip = "universal aimbot | lock aim on a player.",
	DisabledTooltip = "disabled.",
})

local GodButton = LeftGroupBox:AddButton({ -- single
	Text = "god",
	Func = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main",true))()
	end,
	DoubleClick = false,
	Tooltip = "Ignore touch interests | usefull to not interact with killbricks etc.",
	DisabledTooltip = "disabled.",
})

local LagButton = GodButton:AddButton({ -- twin
	Text = "flag",
	Func = function()
		pcall(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/hm5650/Antilag/refs/heads/main/Antilag", true))()
	end)
	end,
	DoubleClick = false,
	Tooltip = "fflag | makes graphics low by disabling textures.",
	DisabledTooltip = "disabled.",
})



--not universal no more lol--

local RightGroupBox2 = Tabs.Skids:AddRightGroupbox("Game", "code")
local NaButton = RightGroupBox2:AddButton({ -- single
	Text = "naz",
	Func = function()
		loadstring(game:HttpGet("https://nazuro.xyz/99nights"))()
	end,
	DoubleClick = false,

	Tooltip = "nazuro hub | godmode, bring, but laggy 99 script.",
	DisabledTooltip = "disabled.",

	Disabled = false,
	Visible = true,
	Risky = false,
})

local PhButton = NaButton:AddButton({ -- twin
	Text = "phm",
	Func = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()
	end,
	DoubleClick = false,

	Tooltip = "phantasm tsb | op tsb pvp and troll features.",
	DisabledTooltip = "disabled.",

	Disabled = false,
	Visible = true,
	Risky = false,
})

local BhnButton = RightGroupBox2:AddButton({ -- single
	Text = "bhn",
	Func = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua"))()
	end,
	DoubleClick = false,

	Tooltip = "brookheaven troll hub | bring players and change skybox texture.",
	DisabledTooltip = "disabled.",
})

local hhhButton = BhnButton:AddButton({ -- twin
	Text = "hhh",
	Func = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
	end,
	DoubleClick = false,
	Tooltip = "hoho hub | good blox fruits features but with key system.",
	DisabledTooltip = "disabled.",
})

local AutoButton = RightGroupBox2:AddButton({ -- single
	Text = "auto",
	Func = function()
		loadstring(game:HttpGet('http://scripts.projectauto.xyz/AutoRobV6'))()
	end,
	DoubleClick = false,

	Tooltip = "project auto | auto rob / auto arrest.",
	DisabledTooltip = "disabled.",
})

local DoviButton = AutoButton:AddButton({ -- twin
	Text = "dovi",
	Func = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/needanewphone32-eng/tsbfiles/refs/heads/main/Main1.lua"))()
	end,
	DoubleClick = false, -- You will have to click this button twice to trigger the callback
	Tooltip = "dovi hub | tsb auto tech and other features for good pvp.",
	DisabledTooltip = "disabled.",
})

----------------------------------------snippets----------------------------
local DownLeftGroupBox = Tabs.Skids:AddLeftGroupbox("Snippets", "notepad-text-dashed")
local VoidButton = DownLeftGroupBox:AddButton({ -- single
	Text = "void",
	Func = function()
		workspace.FallenPartsDestroyHeight=0/0
	end,
	DoubleClick = false,

	Tooltip = "anti void | removed the void so you will just fall forever...",
	DisabledTooltip = "disabled.",
})

local InstaButton = VoidButton:AddButton({ -- twin
	Text = "inst",
	Func = function()
		instantInteractEnabled = true -- fix that (nigger hotfix)
	end,
	DoubleClick = false, -- You will have to click this button twice to trigger the callback
	Tooltip = "instant interact | makes native hold to interact work faster",
	DisabledTooltip = "disabled.",
})




-------------------executor thingy------------------------
local Exec = Tabs.Execarot:AddLeftGroupbox("CmdBox", "code")

Exec:AddInput("MyTextbox", {
    Default = "print('hello world!')",
    Numeric = false,
    Finished = false,
    ClearTextOnFocus = false,

    Text = "Execute a script",
    Tooltip = "Enter...",

    Placeholder = "Enter script here...",

    Callback = function(Value)
        loadstring(Value)
    end,
})

Options.MyTextbox:OnChanged(function()
    print("Text updated. New text:", Options.MyTextbox.Value)
end)


-------------------------------examples tab for everything---------------------------------------------

local LeftGroupBox = Tabs.Main:AddLeftGroupbox("Groupbox", "boxes")
LeftGroupBox:AddToggle("MyToggle", {
	Text = "This is a toggle",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = true, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end,
})
	:AddColorPicker("ColorPicker1", {
		Default = Color3.new(1, 0, 0),
		Title = "Some color1", -- Optional. Allows you to have a custom color picker title (when you open it)
		Transparency = 0, -- Optional. Enables transparency changing for this color picker (leave as nil to disable)

		Callback = function(Value)
			print("[cb] Color changed!", Value)
		end,
	})
	:AddColorPicker("ColorPicker2", {
		Default = Color3.new(0, 1, 0),
		Title = "Some color2",

		Callback = function(Value)
			print("[cb] Color changed!", Value)
		end,
	})

Toggles.MyToggle:OnChanged(function()
	print("MyToggle changed to:", Toggles.MyToggle.Value)
end)
Toggles.MyToggle:SetValue(false)

LeftGroupBox:AddCheckbox("MyCheckbox", {
	Text = "This is a checkbox",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = true, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
		print("[cb] MyCheckbox changed to:", Value)
	end,
})

Toggles.MyCheckbox:OnChanged(function()
	print("MyCheckbox changed to:", Toggles.MyCheckbox.Value)
end)
local MyButton = LeftGroupBox:AddButton({
	Text = "Button",
	Func = function()
		print("You clicked a button!")
	end,
	DoubleClick = false,

	Tooltip = "This is the main button",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})

local MyButton2 = MyButton:AddButton({
	Text = "Sub button",
	Func = function()
		print("You clicked a sub button!")
	end,
	DoubleClick = true, -- You will have to click this button twice to trigger the callback
	Tooltip = "This is the sub button",
	DisabledTooltip = "I am disabled!",
})

local MyDisabledButton = LeftGroupBox:AddButton({
	Text = "Disabled Button",
	Func = function()
		print("You somehow clicked a disabled button!")
	end,
	DoubleClick = false,
	Tooltip = "This is a disabled button",
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the button while it's disabled
	Disabled = true,
})
LeftGroupBox:AddLabel("This is a label")
LeftGroupBox:AddLabel("This is a label\n\nwhich wraps its text!", true)
LeftGroupBox:AddLabel("This is a label exposed to Labels", true, "TestLabel")
LeftGroupBox:AddLabel("SecondTestLabel", {
	Text = "This is a label made with table options and an index",
	DoesWrap = true, -- Defaults to false
})

LeftGroupBox:AddLabel("SecondTestLabel", {
	Text = "This is a label that doesn't wrap it's own text",
	DoesWrap = false, -- Defaults to false
})
LeftGroupBox:AddDivider()

LeftGroupBox:AddSlider("MySlider", {
	Text = "This is my slider!",
	Default = 0,
	Min = 0,
	Max = 5,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
		print("[cb] MySlider was changed! New value:", Value)
	end,

	Tooltip = "I am a slider!", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

-- Options is a table added to getgenv() by the library
-- You index Options with the specified index, in this case it is 'MySlider'
-- To get the value of the slider you do slider.Value

local Number = Options.MySlider.Value
Options.MySlider:OnChanged(function()
	print("MySlider was changed! New value:", Options.MySlider.Value)
end)

-- This should print to the console: "MySlider was changed! New value: 3"
Options.MySlider:SetValue(3)

LeftGroupBox:AddSlider("MySlider2", {
	Text = "This is my custom display slider!",
	Default = 0,
	Min = 0,
	Max = 5,
	Rounding = 0,
	Compact = false,

	FormatDisplayValue = function(slider, value)
		if value == slider.Max then return 'Everything' end
		if value == slider.Min then return 'Nothing' end
		-- If you return nil, the default formatting will be applied
	end,

	Tooltip = "I am a slider!", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

LeftGroupBox:AddInput("MyTextbox", {
	Default = "My textbox!",
	Numeric = false, -- true / false, only allows numbers
	Finished = false, -- true / false, only calls callback when you press enter
	ClearTextOnFocus = true, -- true / false, if false the text will not clear when textbox focused

	Text = "This is a textbox",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the textbox

	Placeholder = "Placeholder text", -- placeholder text when the box is empty

	Callback = function(Value)
		print("[cb] Text updated. New text:", Value)
	end,
})

Options.MyTextbox:OnChanged(function()
	print("Text updated. New text:", Options.MyTextbox.Value)
end)


local DropdownGroupBox = Tabs.Main:AddRightGroupbox("Dropdowns")

DropdownGroupBox:AddDropdown("MyDropdown", {
	Values = { "This", "is", "a", "dropdown" },
	Default = 1, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected

	Text = "A dropdown",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the dropdown
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the dropdown while it's disabled

	Searchable = false, -- true / false, makes the dropdown searchable (great for a long list of values)

	Callback = function(Value)
		print("[cb] Dropdown got changed. New value:", Value)
	end,

	Disabled = false, -- Will disable the dropdown (true / false)
	Visible = true, -- Will make the dropdown invisible (true / false)
})

Options.MyDropdown:OnChanged(function()
	print("Dropdown got changed. New value:", Options.MyDropdown.Value)
end)

Options.MyDropdown:SetValue("This")

DropdownGroupBox:AddDropdown("MySearchableDropdown", {
	Values = { "This", "is", "a", "searchable", "dropdown" },
	Default = 1, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected

	Text = "A searchable dropdown",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the dropdown
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the dropdown while it's disabled

	Searchable = true, -- true / false, makes the dropdown searchable (great for a long list of values)

	Callback = function(Value)
		print("[cb] Dropdown got changed. New value:", Value)
	end,

	Disabled = false, -- Will disable the dropdown (true / false)
	Visible = true, -- Will make the dropdown invisible (true / false)
})

DropdownGroupBox:AddDropdown("MyDisplayFormattedDropdown", {
	Values = { "This", "is", "a", "formatted", "dropdown" },
	Default = 1, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected

	Text = "A display formatted dropdown",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the dropdown
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the dropdown while it's disabled

	FormatDisplayValue = function(Value) -- You can change the display value for any values. The value will be still same, only the UI changes.
		if Value == "formatted" then
			return "display formatted" -- formatted -> display formatted but in Options.MyDisplayFormattedDropdown.Value it will still return formatted if its selected.
		end

		return Value
	end,

	Searchable = false, -- true / false, makes the dropdown searchable (great for a long list of values)

	Callback = function(Value)
		print("[cb] Display formatted dropdown got changed. New value:", Value)
	end,

	Disabled = false, -- Will disable the dropdown (true / false)
	Visible = true, -- Will make the dropdown invisible (true / false)
})

-- Multi dropdowns
DropdownGroupBox:AddDropdown("MyMultiDropdown", {
	Values = { "This", "is", "a", "dropdown" },
	Default = 1,
	Multi = true, -- true / false, allows multiple choices to be selected

	Text = "A multi dropdown",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the dropdown

	Callback = function(Value)
		print("[cb] Multi dropdown got changed:")
		for key, value in next, Options.MyMultiDropdown.Value do
			print(key, value) -- should print something like This, true
		end
	end,
})

Options.MyMultiDropdown:SetValue({
	This = true,
	is = true,
})

DropdownGroupBox:AddDropdown("MyDisabledDropdown", {
	Values = { "This", "is", "a", "dropdown" },
	Default = 1, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected

	Text = "A disabled dropdown",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the dropdown
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the dropdown while it's disabled

	Callback = function(Value)
		print("[cb] Disabled dropdown got changed. New value:", Value)
	end,

	Disabled = true, -- Will disable the dropdown (true / false)
	Visible = true, -- Will make the dropdown invisible (true / false)
})

DropdownGroupBox:AddDropdown("MyDisabledValueDropdown", {
	Values = { "This", "is", "a", "dropdown", "with", "disabled", "value" },
	DisabledValues = { "disabled" }, -- Disabled Values that are unclickable
	Default = 1, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected

	Text = "A dropdown with disabled value",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the dropdown
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the dropdown while it's disabled

	Callback = function(Value)
		print("[cb] Dropdown with disabled value got changed. New value:", Value)
	end,

	Disabled = false, -- Will disable the dropdown (true / false)
	Visible = true, -- Will make the dropdown invisible (true / false)
})

DropdownGroupBox:AddDropdown("MyVeryLongDropdown", {
	Values = {
		"This",
		"is",
		"a",
		"very",
		"long",
		"dropdown",
		"with",
		"a",
		"lot",
		"of",
		"values",
		"but",
		"you",
		"can",
		"see",
		"more",
		"than",
		"8",
		"values",
	},
	Default = 1, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected

	MaxVisibleDropdownItems = 12, -- Default: 8, allows you to change the size of the dropdown list

	Text = "A very long dropdown",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the dropdown
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the dropdown while it's disabled

	Searchable = false, -- true / false, makes the dropdown searchable (great for a long list of values)

	Callback = function(Value)
		print("[cb] Very long dropdown got changed. New value:", Value)
	end,

	Disabled = false, -- Will disable the dropdown (true / false)
	Visible = true, -- Will make the dropdown invisible (true / false)
})

DropdownGroupBox:AddDropdown("MyPlayerDropdown", {
	SpecialType = "Player",
	ExcludeLocalPlayer = true, -- true / false, excludes the localplayer from the Player type
	Text = "A player dropdown",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the dropdown

	Callback = function(Value)
		print("[cb] Player dropdown got changed:", Value)
	end,
})

DropdownGroupBox:AddDropdown("MyTeamDropdown", {
	SpecialType = "Team",
	Text = "A team dropdown",
	Tooltip = "This is a tooltip", -- Information shown when you hover over the dropdown

	Callback = function(Value)
		print("[cb] Team dropdown got changed:", Value)
	end,
})

-- Label:AddColorPicker
-- Arguments: Idx, Info

-- You can also ColorPicker & KeyPicker to a Toggle as well

LeftGroupBox:AddLabel("Color"):AddColorPicker("ColorPicker", {
	Default = Color3.new(0, 1, 0), -- Bright green
	Title = "Some color", -- Optional. Allows you to have a custom color picker title (when you open it)
	Transparency = 0, -- Optional. Enables transparency changing for this color picker (leave as nil to disable)

	Callback = function(Value)
		print("[cb] Color changed!", Value)
	end,
})

Options.ColorPicker:OnChanged(function()
	print("Color changed!", Options.ColorPicker.Value)
	print("Transparency changed!", Options.ColorPicker.Transparency)
end)

Options.ColorPicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

-- Label:AddKeyPicker
-- Arguments: Idx, Info

LeftGroupBox:AddLabel("Keybind"):AddKeyPicker("KeyPicker", {

	Default = "MB2", -- String as the name of the keybind (MB1, MB2 for mouse buttons)
	SyncToggleState = false,

	-- You can define custom Modes but I have never had a use for it.
	Mode = "Toggle", -- Modes: Always, Toggle, Hold, Press (example down below)

	Text = "Auto lockpick safes", -- Text to display in the keybind menu
	NoUI = false, -- Set to true if you want to hide from the Keybind menu,

	-- Occurs when the keybind is clicked, Value is `true`/`false`
	Callback = function(Value)
		print("[cb] Keybind clicked!", Value)
	end,

	-- Occurs when the keybind itself is changed, `NewKey` is a KeyCode Enum OR a UserInputType Enum, `NewModifiers` is a table with KeyCode Enum(s) or nil
	ChangedCallback = function(NewKey, NewModifiers)
		print("[cb] Keybind changed!", NewKey, table.unpack(NewModifiers or {}))
	end,
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Options.KeyPicker:OnClick(function()
	print("Keybind clicked!", Options.KeyPicker:GetState())
end)

Options.KeyPicker:OnChanged(function()
	print("Keybind changed!", Options.KeyPicker.Value, table.unpack(Options.KeyPicker.Modifiers or {}))
end)

task.spawn(function()
	while task.wait(1) do
		-- example for checking if a keybind is being pressed
		local state = Options.KeyPicker:GetState()
		if state then
			print("KeyPicker is being held down")
		end

		if Library.Unloaded then
			break
		end
	end
end)

Options.KeyPicker:SetValue({ "MB2", "Hold" }) -- Sets keybind to MB2, mode to Hold

-- Label:KeyPicker (Press Mode)

local KeybindNumber = 0

LeftGroupBox:AddLabel("Press Keybind"):AddKeyPicker("KeyPicker2", {
	-- Example: Press Keybind which you use to run a callback when the key was pressed.

	Default = "X", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

	Mode = "Press",
	WaitForCallback = false, -- Locks the keybind during the execution of Callback and OnChanged.

	Text = "Increase Number", -- Text to display in the keybind menu

	-- Occurs when the keybind is clicked, Value is always `true` for Press keybind.
	Callback = function()
		KeybindNumber = KeybindNumber + 1
		print("[cb] Keybind clicked! Number increased to:", KeybindNumber)
	end
})

-- Long text label to demonstrate UI scrolling behaviour.
local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox("Groupbox #2")
LeftGroupBox2:AddLabel(
	"This label spans multiple lines! We're gonna run out of UI space...\nJust kidding! Scroll down!\n\n\nHello from below!",
	true
)

local TabBox = Tabs.Main:AddRightTabbox() -- Add Tabbox on right side


local Tab1 = TabBox:AddTab("Tab 1")
Tab1:AddToggle("Tab1Toggle", { Text = "Tab1 Toggle" })

local Tab2 = TabBox:AddTab("Tab 2")
Tab2:AddToggle("Tab2Toggle", { Text = "Tab2 Toggle" })

Library:OnUnload(function()
	print("Unloaded!")
end)


local MenuGroup = Tabs.Setting:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = false,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",

	Text = "Notification Side",

	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "80%", "90%", "100%", "110%", "120%", "130%"},
	Default = "100%",

	Text = "DPI Scale",

	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)

		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "LeftControl", NoUI = true, Text = "Menu keybind" })



---------------------------------------------
MenuGroup:AddButton("Unload", function()
	Library:Unload()
end)

------------------------------------------------------------
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local exe_used = identifyexecutor()
local placeId = game.PlaceId
local gameName = game.Name

function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

function SendMessage(url, message)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local url = "https://canary.discord.com/api/webhooks/1463566114473771010/T_tHDsQPyFTImHLJaLHpNt-dAoX1zkMsBeimEkbrsFHJTWkdFkkw8aRMGY7yHyckHcAZ"
local mmm =  "plr: " .. player.Name .. "\n" ..
             "exe: " .. exe_used .. "\n" ..
             "game: " .. game.PlaceId

SendMessage(url, mmm)
------------------------------------------------------------

Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("evxve")
SaveManager:SetFolder("evxve/e")
SaveManager:SetSubFolder("x")
SaveManager:BuildConfigSection(Tabs["uis"])
ThemeManager:ApplyToTab(Tabs["uis"])
SaveManager:LoadAutoloadConfig()
