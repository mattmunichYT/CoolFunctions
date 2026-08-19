#Check for jetpack
execute as @a[nbt={equipment:{chest:{id:"minecraft:leather_chestplate",components:{"minecraft:custom_data":{jetpack:true}}}}}] run tag @s add cf.jetpack.has
execute as @a[nbt=!{equipment:{chest:{id:"minecraft:leather_chestplate",components:{"minecraft:custom_data":{jetpack:true}}}}}] run tag @s remove cf.jetpack.has

# Sync jetpack item fuel -> scoreboard when player has jetpack equipped
# Single data get per tick instead of two; cf.jetpack.fuel always mirrors the item,
execute as @a[tag=cf.jetpack.has] store result score @s cf.jetpack.fuel run data get entity @s equipment.chest.components.minecraft:custom_data.jetpackFuel
# Sync jetpack max fuel to scoreboard when player has jetpack equipped
execute as @a[tag=cf.jetpack.has] store result score @s cf.jetpack.fuel.max run data get entity @s equipment.chest.components.minecraft:custom_data.jetpackMaxFuel

#Check if cf.sneaking
tag @a[scores={cf.sneaking=1..}] add cf.sneaking
tag @a[scores={cf.sneaking=0}] remove cf.sneaking
scoreboard players set @a[tag=cf.sneaking] cf.sneaking 0
tag @a[scores={cf.jetpack.fuel=..0}] remove cf.sneaking
execute as @a[scores={cf.jetpack.fuel=..-1}] run scoreboard players set @s cf.jetpack.fuel 0

#Consume fuel
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] store result entity @s equipment.chest.components.minecraft:custom_data.jetpackFuel int 1 run scoreboard players remove @s cf.jetpack.fuel 1

#Jetpack go up
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] run advancement grant @s only coolfunctions:jetpack/use

execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] run function coolfunctions:jetpack/height_above_ground

execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:1} if score @s cf.heightAboveGround matches ..9 run effect give @s levitation 1 9 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:1} if score @s cf.heightAboveGround matches 10..14 run effect give @s levitation 1 2 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:1} if score @s cf.heightAboveGround matches 15.. run effect give @s levitation 1 0 true

execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:2} if score @s cf.heightAboveGround matches ..22 run effect give @s levitation 1 12 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:2} if score @s cf.heightAboveGround matches 23..29 run effect give @s levitation 1 3 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:2} if score @s cf.heightAboveGround matches 30.. run effect give @s levitation 1 0 true

execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:3} if score @s cf.heightAboveGround matches ..32 run effect give @s levitation 1 16 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:3} if score @s cf.heightAboveGround matches 33..39 run effect give @s levitation 1 4 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:3} if score @s cf.heightAboveGround matches 40.. run effect give @s levitation 1 0 true

execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:4} if score @s cf.heightAboveGround matches ..58 run effect give @s levitation 1 22 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:4} if score @s cf.heightAboveGround matches 59..69 run effect give @s levitation 1 5 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:4} if score @s cf.heightAboveGround matches 70.. run effect give @s levitation 1 0 true

execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:5} if score @s cf.heightAboveGround matches ..84 run effect give @s levitation 1 25 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:5} if score @s cf.heightAboveGround matches 85..99 run effect give @s levitation 1 6 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:5} if score @s cf.heightAboveGround matches 100.. run effect give @s levitation 1 0 true

execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:10} run effect give @s levitation 1 30 true
execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] run playsound minecraft:block.sand.idle neutral @s ~ ~ ~ 50 0.5
execute positioned as @a[tag=cf.sneaking,tag=cf.jetpack.has] run particle flame ^-0.5 ^-1 ^-0.5 0.1 1 0.1 50 10 force

execute as @a[tag=cf.sneaking,tag=cf.jetpack.has] at @s run function coolfunctions:jetpack/sync_item

#Jetpack go down
execute as @a[tag=!cf.sneaking,tag=cf.jetpack.has,nbt=!{OnGround:true}] positioned as @a[tag=!cf.sneaking,tag=cf.jetpack.has,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run effect give @s slow_falling 1 0 true
execute as @a[tag=!cf.sneaking,tag=cf.jetpack.has,nbt=!{OnGround:true}] positioned as @a[tag=!cf.sneaking,tag=cf.jetpack.has,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run particle ash ~ ~ ~ 0.5 0 0.5 10 10 force
execute as @a[tag=!cf.sneaking,tag=cf.jetpack.has,nbt=!{OnGround:true}] positioned as @a[tag=!cf.sneaking,tag=cf.jetpack.has,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run playsound minecraft:block.dry_grass.ambient neutral @s ~ ~ ~ 0.5 2

function coolfunctions:jetpack/jetpack_bar
# function coolfunctions:jetpack/jetpack_drop_craft #Crafting drop is now handled by the recipe advancement, so this function is no longer needed.