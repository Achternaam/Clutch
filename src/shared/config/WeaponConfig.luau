-- Elk wapen noemt alleen wat afwijkt van Defaults; de rest komt via __index.
-- Let op: pairs() over een wapen toont alleen de afwijkingen, niet de defaults.
local Defaults = {
	damage = 25,
	headshotMultiplier = 2,
	fireRate = 0.5, -- seconden tussen schoten
	range = 300, -- studs
	magazineSize = 10,
	reloadTime = 2, -- seconden
	pellets = 1,
	spread = 0, -- graden
}

local Weapons = {
	Sniper = {
		damage = 90,
		fireRate = 1.5,
		range = 1000,
		magazineSize = 5,
		reloadTime = 3,
	},
	Shotgun = {
		damage = 12, -- per hagelkorrel
		headshotMultiplier = 1.5,
		fireRate = 0.9,
		range = 60,
		magazineSize = 6,
		pellets = 8,
		spread = 8,
	},
}

for _, weapon in Weapons do
	setmetatable(weapon, { __index = Defaults })
end

return {
	Defaults = Defaults,
	Weapons = Weapons,
}
