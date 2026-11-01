local caller = require(game.ReplicatedStorage.LimbCutter)

--task.wait(5)

local character = script.Parent
local player = game.Players:GetPlayerFromCharacter(character)
local humanoid = character:WaitForChild("Humanoid")

humanoid.MaxHealth = 1000
humanoid.Health = 1000

local health = humanoid.Health
local limbhealth = caller.getLimbHealth(player)

local yo = humanoid.HealthChanged:Connect(function(newHealth)

	--print(limbhealth)
--	print(health)
	if health > newHealth then
		
		
		local change = health - newHealth
		health = newHealth
		
		limbhealth -= change
		
	
		if limbhealth <= 0 then
			caller.loseRandomLimb(player)
			limbhealth = caller.getLimbHealth(player)
		end
	else
		health = newHealth
	end
	
	
end)

local bro
bro = humanoid.Died:Connect(function()
	yo:Disconnect()
	bro:Disconnect()
end)
--caller.loseRandomLimb(game.Players.ptl483)
