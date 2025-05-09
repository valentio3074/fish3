-- Codice per la pesca automatica in Roblox
local fishingGUI = Instance.new("ScreenGui")
fishingGUI.Name = "FishingGUI"
fishingGUI.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.Parent = fishingGUI

local fishDropdown = Instance.new("TextBox")
fishDropdown.Size = UDim2.new(0, 200, 0, 40)
fishDropdown.Position = UDim2.new(0.5, -100, 0, 20)
fishDropdown.PlaceholderText = "Seleziona il pesce"
fishDropdown.Parent = frame

local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0, 200, 0, 40)
startButton.Position = UDim2.new(0.5, -100, 0, 80)
startButton.Text = "Inizia la pesca"
startButton.Parent = frame

local autoFishing = false
local selectedFish = ""

local fishList = {
    "Roslit Volcano", "Ember Snapper", "Volcanic Geode", "Obsidian Salmon",
    "Obsidian Swordfish", "Herring", "Arctic Char", "Glacier Pike", "Pond Emperor",
    "Glacierfish", "Swamp Bass", "Bowfin", "Marsh Gar", "Alligator", "Haddock",
    "Mackerel", "Sea Bass", "Smallmouth Bass", "White Bass", "Golden Smallmouth Bass",
    "Gazerfish", "Globe Jellyfish", "Eyefestation", "Skate Tuna", "Phantom Ray",
    "Cockatoo Squid", "Shortfin Mako Shark", "Galleon Goliath", "Shipwreck Barracuda",
    "Captain’s Goldfish", "Deep-Sea Hatchetfish", "Deep-Sea Dragonfish", "Candy Fish",
    "Skelefish", "Lego Fish", "Phantom Megalodon", "Megalodon", "Ancient Megalodon"
}

-- Funzione per avviare la pesca automatica
local function startFishing()
    if not autoFishing then
        autoFishing = true
        startButton.Text = "Pesca in corso..."
        while autoFishing do
            if selectedFish ~= "" then
                -- Aggiungi la logica per pescare il pesce selezionato
                print("Pesca del pesce: " .. selectedFish)
            end
            wait(3) -- Tempo di attesa tra le pescate
        end
        startButton.Text = "Inizia la pesca"
    else
        autoFishing = false
        startButton.Text = "Pesca interrotta"
    end
end

-- Funzione per cambiare il pesce selezionato
local function changeSelectedFish()
    selectedFish = fishDropdown.Text
    print("Pesce selezionato: " .. selectedFish)
end

-- Azioni per i pulsanti
startButton.MouseButton1Click:Connect(startFishing)
fishDropdown.FocusLost:Connect(changeSelectedFish)

-- Carica la lista dei pesci nel menu a tendina
for _, fish in ipairs(fishList) do
    local fishOption = Instance.new("TextButton")
    fishOption.Size = UDim2.new(0, 200, 0, 40)
    fishOption.Text = fish
    fishOption.Parent = frame
    fishOption.MouseButton1Click:Connect(function()
        fishDropdown.Text = fish
        changeSelectedFish()
    end)
end
