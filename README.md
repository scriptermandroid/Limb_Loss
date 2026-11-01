# Limb_Loss
script for losing limbs when taking dmg

LimbCutter.luau is the module script--this is the script that actually defines the functions and contains the code for the actual game mechanics. This is what you would put into your game if you were using the mechanics I scripted. However, the module script does nothing alone, because those functions have to actually be called by an actual script, either server or local, which is what Limbcharscript.luau did for the purpose of my testing and demonstration.

LimbCutter.luau does what it does because body parts in Roblox do not continue to exist without being attached to something (usually a HumanoidRootPart). To have the limbs fly off and not fall through the floor, I had to give them a new anchor. The new anchor was Part.
