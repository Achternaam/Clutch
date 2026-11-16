-- Alle RemoteEvents en RemoteFunctions op één plek.
-- Server maakt ze aan, client wacht erop. Gebruik: Remotes.Shoot:FireServer(...)
-- Valideer elke input op de server (zie CLAUDE.md).
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local EVENTS = {
	"Shoot", -- client -> server: schietverzoek
	"RoundState", -- server -> clients: rondestatus
}

local FUNCTIONS = {}

local isServer = RunService:IsServer()
local folder
if isServer then
	folder = Instance.new("Folder")
	folder.Name = "Remotes"
	folder.Parent = ReplicatedStorage
else
	folder = ReplicatedStorage:WaitForChild("Remotes")
end

local function get(name: string, className: string)
	if not isServer then
		return folder:WaitForChild(name)
	end
	local remote = Instance.new(className)
	remote.Name = name
	remote.Parent = folder
	return remote
end

local Remotes = {}
for _, name in EVENTS do
	Remotes[name] = get(name, "RemoteEvent")
end
for _, name in FUNCTIONS do
	Remotes[name] = get(name, "RemoteFunction")
end

return Remotes
