#Check for jetpack
execute as @a[nbt={equipment:{chest:{id:"minecraft:leather_chestplate",components:{"minecraft:custom_data":{jetpack:true}}}}}] run tag @s add cf.jetpack.has
execute as @a[nbt=!{equipment:{chest:{id:"minecraft:leather_chestplate",components:{"minecraft:custom_data":{jetpack:true}}}}}] run tag @s remove cf.jetpack.has

# Sync jetpack item fuel -> scoreboard when player has jetpack equipped
# Single data get per tick instead of two; cf.jetpack.fuel always mirrors the item,
execute as @a[tag=cf.jetpack.has] store result score @s cf.jetpack.fuel run data get entity @s equipment.chest.components.minecraft:custom_data.jetpackFuel
# Sync jetpack max fuel to scoreboard when player has jetpack equipped
execute as @a[tag=cf.jetpack.has] store result score @s cf.jetpack.fuel.max run data get entity @s equipment.chest.components.minecraft:custom_data.jetpackMaxFuel

#Check if cf.sneaking (tag = player is currently sneaking)
tag @a[scores={cf.sneaking=1..}] add cf.sneaking
tag @a[scores={cf.sneaking=0}] remove cf.sneaking
scoreboard players set @a[tag=cf.sneaking] cf.sneaking 0
# (removed: "tag @a[scores={cf.jetpack.fuel=..0}] remove cf.sneaking" - sneaking no longer ascends, and mode switching must work with an empty tank)

# Modes: 0 = hover, 1..4 = ascend 25/50/75/100%
# Players without a valid mode default to 4 (100%, same behaviour as before)
execute as @a[tag=cf.jetpack.has] unless score @s cf.jetpack.mode matches 0..4 run scoreboard players set @s cf.jetpack.mode 4
# Cycle mode on sneak PRESS only (rising edge), not while sneak is held
tag @a[tag=cf.jetpack.has,tag=cf.sneaking,tag=!cf.sneaking.held] add cf.sneak.pressed
execute as @a[tag=cf.sneak.pressed] at @s run function coolfunctions:jetpack/cycle_mode
tag @a[tag=cf.sneaking] add cf.sneaking.held
tag @a[tag=!cf.sneaking] remove cf.sneaking.held
# Timer that keeps the bar visible for a moment after a mode change
scoreboard players remove @a[scores={cf.jetpack.display=1..}] cf.jetpack.display 1

# Check for fuel < 0, if so set to 0
execute as @a[scores={cf.jetpack.fuel=..-1}] run scoreboard players set @s cf.jetpack.fuel 0

# Check for jump = ascend
execute as @a[tag=cf.jetpack.has] if predicate coolfunctions:jump unless score @s cf.jetpack.fuel matches ..0 run tag @s add cf.jetpack.ascending
execute as @a[tag=cf.jetpack.has] unless predicate coolfunctions:jump run tag @s remove cf.jetpack.ascending
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel matches ..0 run tag @s remove cf.jetpack.ascending

#Consume fuel (rate depends on the mode, see consume.mcfunction)
# #phase = gametime % 4, lets us burn less than 1 fuel per tick with integers only
execute store result score #phase cf.jetpack.temp run time query gametime
scoreboard players operation #phase cf.jetpack.temp %= const4 cf.const
execute as @a[tag=cf.jetpack.ascending,tag=cf.jetpack.has] run function coolfunctions:jetpack/consume
# (the item itself is updated from the scoreboard by sync_item below)

# Release: undo thrust levitation / hover gravity-cancel as soon as the player leaves that state
# (jump released, out of fuel, jetpack removed, or mode switched)
execute as @a[tag=cf.jetpack.thrusting] unless entity @s[tag=cf.jetpack.has,tag=cf.jetpack.ascending,scores={cf.jetpack.mode=1..4}] run effect clear @s minecraft:levitation
execute as @a[tag=cf.jetpack.thrusting] unless entity @s[tag=cf.jetpack.has,tag=cf.jetpack.ascending,scores={cf.jetpack.mode=1..4}] run tag @s remove cf.jetpack.thrusting
execute as @a[tag=cf.jetpack.hovering] unless entity @s[tag=cf.jetpack.has,tag=cf.jetpack.ascending,scores={cf.jetpack.mode=0}] run attribute @s minecraft:gravity modifier remove coolfunctions:jetpack_hover
execute as @a[tag=cf.jetpack.hovering] unless entity @s[tag=cf.jetpack.has,tag=cf.jetpack.ascending,scores={cf.jetpack.mode=0}] run tag @s remove cf.jetpack.hovering

#Jetpack go up
execute as @a[tag=cf.jetpack.ascending,tag=cf.jetpack.has] run advancement grant @s only coolfunctions:jetpack/use

execute as @a[tag=cf.jetpack.ascending,tag=cf.jetpack.has] run function coolfunctions:jetpack/height_above_ground

# Mode 1-4: levitation, scaled by mode (tier/height-band table lives in thrust.mcfunction)
execute as @a[tag=cf.jetpack.ascending,tag=cf.jetpack.has,scores={cf.jetpack.mode=1..4}] run function coolfunctions:jetpack/thrust
# Mode 0: hover (gravity cancelled while jump is held)
execute as @a[tag=cf.jetpack.ascending,tag=cf.jetpack.has,scores={cf.jetpack.mode=0}] run function coolfunctions:jetpack/hover

execute as @a[tag=cf.jetpack.ascending,tag=cf.jetpack.has] at @s run playsound minecraft:block.sand.idle neutral @s ~ ~ ~ 50 0.5
execute at @a[tag=cf.jetpack.ascending,tag=cf.jetpack.has] run particle flame ^-0.5 ^-1 ^-0.5 0.1 1 0.1 50 10 force

execute as @a[tag=cf.jetpack.ascending,tag=cf.jetpack.has] at @s run function coolfunctions:jetpack/sync_item

#Jetpack go down
execute as @a[tag=!cf.jetpack.ascending,tag=cf.jetpack.has,nbt=!{OnGround:true}] at @a[tag=!cf.jetpack.ascending,tag=cf.jetpack.has,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run effect give @s slow_falling 1 0 true
execute as @a[tag=!cf.jetpack.ascending,tag=cf.jetpack.has,nbt=!{OnGround:true}] at @a[tag=!cf.jetpack.ascending,tag=cf.jetpack.has,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run particle ash ~ ~ ~ 0.5 0 0.5 10 10 force
execute as @a[tag=!cf.jetpack.ascending,tag=cf.jetpack.has,nbt=!{OnGround:true}] at @a[tag=!cf.jetpack.ascending,tag=cf.jetpack.has,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run playsound minecraft:block.dry_grass.ambient neutral @s ~ ~ ~ 0.5 2
function coolfunctions:jetpack/jetpack_bar
# function coolfunctions:jetpack/jetpack_drop_craft #Crafting drop is now handled by the recipe advancement, so this function is no longer needed.
