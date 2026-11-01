local LimbCutter = {}

local DataStoreService = game:GetService("DataStoreService")
local limbhealthStore = DataStoreService:GetDataStore("LimbHealthDataStore")
local limbregenStore = DataStoreService:GetDataStore("LimbRegenDataStore")
local Run = game:GetService("RunService")
local TS = game:GetService("TweenService")
local Tweenstuff = TweenInfo.new(5)


LimbCutter.limbHealth = 100

function fadeLimb(limb)
	for i = 0, 1, 0.01 do
		limb.Transparency = i
		task.wait(0.01)
	end
end

function LimbCutter.loseRarm(player)

	player.Character.Archivable = true
	local newbody = player.Character:Clone()
	player.Character.Archivable = false
	
	local goneLimb = player.Character["Right Arm"]
	goneLimb.Transparency = 1
	
	newbody.Parent = game.Workspace
	
--	local blood = game.ReplicatedStorage.LimbCutter.Blood:Clone()
	
--	blood.Parent = player.Character
--	--blood.Position= 
--	--blood.Position += Vector3.new(0, 0.5, 0)
----	blood.CFrame = CFrame.lookAt(player.Character["Right Arm"].Position, player.Character["Torso"].Position)
--	blood.Position = player.Character["Torso"].Position + Vector3.new(0, 0, -0.75)

--	blood.Transparency = 1
--	blood.Position += Vector3.new(0, 0.5, 0)
	--local weld = Instance.new("WeldConstraint")
	--weld.Part0 = blood
	--weld.Part1 = player.Character.Torso
	--weld.Parent = blood
	
	
	
	
	local part = Instance.new("Part")
	part.Position = newbody.HumanoidRootPart.Position
	
	newbody.Torso["Right Shoulder"].Parent = part
	
	local rarm = newbody["Right Arm"]
	
	
	part.Parent = newbody
	newbody:FindFirstChild("Left Arm"):Destroy()
	newbody:FindFirstChild("Left Leg"):Destroy()
	newbody:FindFirstChild("Torso"):Destroy()
	newbody:FindFirstChild("Right Leg"):Destroy()
	newbody:FindFirstChild("Head"):Destroy()
	
	
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = rarm
	weld.Part1 = part
	weld.Parent = rarm
	
	part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0,0,-5)
	
	newbody.HumanoidRootPart.Orientation = Vector3.new(90, 0, 0)
	
	part.Position = rarm.Position
	
	part.Size = rarm.Size
	part.Orientation = rarm.Orientation
	part.Transparency = 1
	
	part.Orientation += Vector3.new(90, 0, 0)
	rarm.Orientation += Vector3.new(90, 0, 0)
	
	for i, v in pairs(newbody:GetChildren()) do
		if not v:isA("Part") and not v:isA("Right Arm") and not v:isA("Humanoid") and not v:isA("Shirt") then
			v:Destroy()
		end
	end
	
	
	local bv = Instance.new("LinearVelocity")
	bv.MaxForce = 5000 --Vector3.new(5000, 5000, 5000) 
	bv.Parent = part
	local attachment = Instance.new("Attachment")
	attachment.Parent = part
	bv.Attachment0 = attachment
	bv.VectorVelocity = Vector3.new(math.random(-50, 50), math.random(15, 45), math.random(-50, 50))






	for i = 0, 10 do
		part.Orientation *= Vector3.new(math.rad(18), math.rad(18), math.rad(18))
		rarm.Orientation *= Vector3.new(math.rad(18), math.rad(18), math.rad(18))

	end
	
	game.Debris:AddItem(bv, 0.1)
	
	local tim = os.clock()
	
	task.wait(LimbCutter.getRegenSpeed(player))
	--blood:Destroy()

	goneLimb.Transparency = 0
	
	
	fadeLimb(rarm)
	newbody:Destroy()
	
end

function LimbCutter.loseLarm(player)

	player.Character.Archivable = true
	local newbody = player.Character:Clone()
	player.Character.Archivable = false

	local goneLimb = player.Character["Left Arm"]
	goneLimb.Transparency = 1

	newbody.Parent = game.Workspace

	--local blood = game.ReplicatedStorage.LimbCutter.Blood:Clone()

	--blood.Parent = player.Character
	----blood.Position= 
	----blood.Position += Vector3.new(0, 0.5, 0)
	----	blood.CFrame = CFrame.lookAt(player.Character["Right Arm"].Position, player.Character["Torso"].Position)
	--blood.Position = player.Character["Torso"].Position + Vector3.new(0, 0, 0.75)

	--blood.Transparency = 1
	--blood.Position += Vector3.new(0, 0.5, 0)
	--local weld = Instance.new("WeldConstraint")
	--weld.Part0 = blood
	--weld.Part1 = player.Character.Torso
	--weld.Parent = blood




	local part = Instance.new("Part")
	part.Position = newbody.HumanoidRootPart.Position

	newbody.Torso["Left Shoulder"].Parent = part

	local rarm = newbody["Left Arm"]


	part.Parent = newbody
	newbody:FindFirstChild("Right Arm"):Destroy()
	newbody:FindFirstChild("Left Leg"):Destroy()
	newbody:FindFirstChild("Torso"):Destroy()
	newbody:FindFirstChild("Right Leg"):Destroy()
	newbody:FindFirstChild("Head"):Destroy()


	local weld = Instance.new("WeldConstraint")
	weld.Part0 = rarm
	weld.Part1 = part
	weld.Parent = rarm

	part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0,0,-5)

	newbody.HumanoidRootPart.Orientation = Vector3.new(90, 0, 0)

	part.Position = rarm.Position

	part.Size = rarm.Size
	part.Orientation = rarm.Orientation
	part.Transparency = 1

	part.Orientation += Vector3.new(90, 0, 0)
	rarm.Orientation += Vector3.new(90, 0, 0)

	for i, v in pairs(newbody:GetChildren()) do
		if not v:isA("Part") and not v:isA("Left Arm") and not v:isA("Humanoid") and not v:isA("Shirt") then
			v:Destroy()
		end
	end

	local bv = Instance.new("LinearVelocity")
	bv.MaxForce = 5000 --Vector3.new(5000, 5000, 5000) 
	bv.Parent = part
	local attachment = Instance.new("Attachment")
	attachment.Parent = part
	bv.Attachment0 = attachment
	bv.VectorVelocity = Vector3.new(math.random(-50, 50), math.random(15, 45), math.random(-50, 50))

	for i = 0, 10 do
		part.Orientation *= Vector3.new(math.rad(18), math.rad(18), math.rad(18))
		rarm.Orientation *= Vector3.new(math.rad(18), math.rad(18), math.rad(18))

	end

	game.Debris:AddItem(bv, 0.1)

	
	task.wait(LimbCutter.getRegenSpeed(player))
	--blood:Destroy()

	goneLimb.Transparency = 0
	
	fadeLimb(rarm)

	newbody:Destroy()
end


function LimbCutter.loseLleg(player)

	player.Character.Archivable = true
	local newbody = player.Character:Clone()
	player.Character.Archivable = false

	local goneLimb = player.Character["Left Leg"]
	goneLimb.Transparency = 1

	newbody.Parent = game.Workspace

	--local blood = game.ReplicatedStorage.LimbCutter.Blood:Clone()

	--blood.Parent = player.Character
	----blood.Position= 
	----blood.Position += Vector3.new(0, 0.5, 0)
	----	blood.CFrame = CFrame.lookAt(player.Character["Right Arm"].Position, player.Character["Torso"].Position)
	--blood.Position = player.Character["Left Leg"].Position + Vector3.new(0, 0.5, 0)

	--blood.Transparency = 1
	--blood.Position += Vector3.new(0, 0.5, 0)
	--local weld = Instance.new("WeldConstraint")
	--weld.Part0 = blood
	--weld.Part1 = player.Character.Torso
	--weld.Parent = blood




	local part = Instance.new("Part")
	part.Position = newbody.HumanoidRootPart.Position

	newbody.Torso["Left Hip"].Parent = part

	local rarm = newbody["Left Leg"]


	part.Parent = newbody
	newbody:FindFirstChild("Right Arm"):Destroy()
	newbody:FindFirstChild("Left Arm"):Destroy()
	newbody:FindFirstChild("Torso"):Destroy()
	newbody:FindFirstChild("Right Leg"):Destroy()
	newbody:FindFirstChild("Head"):Destroy()


	local weld = Instance.new("WeldConstraint")
	weld.Part0 = rarm
	weld.Part1 = part
	weld.Parent = rarm

	part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0,0,-5)

	newbody.HumanoidRootPart.Orientation = Vector3.new(90, 0, 0)

	part.Position = rarm.Position

	part.Size = rarm.Size
	part.Orientation = rarm.Orientation
	part.Transparency = 1

	part.Orientation += Vector3.new(90, 0, 0)
	rarm.Orientation += Vector3.new(90, 0, 0)

	for i, v in pairs(newbody:GetChildren()) do
		if not v:isA("Part") and not v:isA("Left Leg") and not v:isA("Humanoid") and not v:isA("Pants") then
			v:Destroy()
		end
	end
	
	local bv = Instance.new("LinearVelocity")
	bv.MaxForce = 5000 --Vector3.new(5000, 5000, 5000) 
	bv.Parent = part
	local attachment = Instance.new("Attachment")
	attachment.Parent = part
	bv.Attachment0 = attachment
	bv.VectorVelocity = Vector3.new(math.random(-50, 50), math.random(15, 45), math.random(-50, 50))

	for i = 0, 10 do
		part.Orientation *= Vector3.new(math.rad(18), math.rad(18), math.rad(18))
		rarm.Orientation *= Vector3.new(math.rad(18), math.rad(18), math.rad(18))

	end

	game.Debris:AddItem(bv, 0.1)

	task.wait(LimbCutter.getRegenSpeed(player))
	--blood:Destroy()

	goneLimb.Transparency = 0
	
	fadeLimb(rarm)

	newbody:Destroy()
end

function LimbCutter.loseRleg(player)

	player.Character.Archivable = true
	local newbody = player.Character:Clone()
	player.Character.Archivable = false

	local goneLimb = player.Character["Right Leg"]
	goneLimb.Transparency = 1

	newbody.Parent = game.Workspace

	--[[local blood = game.ReplicatedStorage.LimbCutter.Blood:Clone()

	blood.Parent = player.Character
	--blood.Position= 
	--blood.Position += Vector3.new(0, 0.5, 0)
	--	blood.CFrame = CFrame.lookAt(player.Character["Right Arm"].Position, player.Character["Torso"].Position)
	blood.Position = player.Character["Right Leg"].Position + Vector3.new(0, 0.5, 0)

	blood.Transparency = 1
	blood.Position += Vector3.new(0, 0.5, 0)
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = blood
	weld.Part1 = player.Character.Torso
	weld.Parent = blood]]




	local part = Instance.new("Part")
	part.Position = newbody.HumanoidRootPart.Position

	newbody.Torso["Right Hip"].Parent = part

	local rarm = newbody["Right Leg"]


	part.Parent = newbody
	newbody:FindFirstChild("Right Arm"):Destroy()
	newbody:FindFirstChild("Left Arm"):Destroy()
	newbody:FindFirstChild("Torso"):Destroy()
	newbody:FindFirstChild("Left Leg"):Destroy()
	newbody:FindFirstChild("Head"):Destroy()


	local weld = Instance.new("WeldConstraint")
	weld.Part0 = rarm
	weld.Part1 = part
	weld.Parent = rarm

	part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0,0,-5)

	newbody.HumanoidRootPart.Orientation = Vector3.new(90, 0, 0)

	part.Position = rarm.Position

	part.Size = rarm.Size
	part.Orientation = rarm.Orientation
	part.Transparency = 1

	part.Orientation += Vector3.new(90, 0, 0)
	rarm.Orientation += Vector3.new(90, 0, 0)

	for i, v in pairs(newbody:GetChildren()) do
		if not v:isA("Part") and not v:isA("Right Leg") and not v:isA("Humanoid") and not v:isA("Pants") then
			v:Destroy()
		end
	end

	local bv = Instance.new("LinearVelocity")
	bv.MaxForce = 5000 --Vector3.new(5000, 5000, 5000) 
	bv.Parent = part
	local attachment = Instance.new("Attachment")
	attachment.Parent = part
	bv.Attachment0 = attachment
	bv.VectorVelocity = Vector3.new(math.random(-50, 50), math.random(15, 45), math.random(-50, 50))


	for i = 0, 10 do
		part.Orientation *= Vector3.new(math.rad(18), math.rad(18), math.rad(18))
		rarm.Orientation *= Vector3.new(math.rad(18), math.rad(18), math.rad(18))

	end

	game.Debris:AddItem(bv, 0.1)

	task.wait(LimbCutter.getRegenSpeed(player))
	--blood:Destroy()
	
	goneLimb.Transparency = 0
	
	fadeLimb(rarm)
	
	newbody:Destroy()
end

function LimbCutter.loseRandomLimb(player)
	local random = math.random(1, 4)
	local Rleggone = false
	local Lleggone = false
	local Rarmgone = false
	local Larmgone = false
	
	if random == 1 and not Rleggone then
		LimbCutter.loseRleg(player)
	elseif random == 2 and not Lleggone then
		LimbCutter.loseLleg(player)
	elseif random == 3 and not Rarmgone then
		LimbCutter.loseRarm(player)
	elseif random == 4 and not Larmgone then
		LimbCutter.loseLarm(player)
	end
end

function LimbCutter.setRegenSpeed(player, tme)

	local success, err = pcall(function()
		limbhealthStore:SetAsync(player.UserId, tme) 
	end)
	
	if success then
		--
	else
		warn("Error saving data: " .. err)
	end

end

function LimbCutter.setLimbHealth(player, amt)

	local success, err = pcall(function()
		limbregenStore:SetAsync(player.UserId, amt) 
	end)
	
	if success then
		--
	else
		warn("Error saving data: " .. err)
	end

end

function LimbCutter.getLimbHealth(player)
	return limbhealthStore:GetAsync(player.UserId) or 100
end

function LimbCutter.getRegenSpeed(player)
	return limbregenStore:GetAsync(player.UserId) or 3
end



return LimbCutter
