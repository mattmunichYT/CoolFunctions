#Check for jetpack
execute as @a[nbt={equipment:{chest:{id:"minecraft:leather_chestplate",components:{"minecraft:custom_data":{jetpack:true}}}}}] run tag @s add hasJetPack
execute as @a[nbt=!{equipment:{chest:{id:"minecraft:leather_chestplate",components:{"minecraft:custom_data":{jetpack:true}}}}}] run tag @s remove hasJetPack

# Sync jetpack item fuel -> scoreboard when player has jetpack equipped
# Read the equipped chestplate's fuel into `jetpackTemp` and only update
# the player's `jetpackFuel`/`jetpackMax` if that value changed (detect refill/change).
execute as @a[tag=hasJetPack] store result score @s jetpackTemp run data get entity @s equipment.chest.components.minecraft:custom_data.jetpackFuel
execute as @a[tag=hasJetPack] unless score @s jetpackTemp = @s jetpackItemFuel run scoreboard players operation @s jetpackFuel = @s jetpackTemp
execute as @a[tag=hasJetPack] unless score @s jetpackTemp = @s jetpackItemFuel run scoreboard players operation @s jetpackItemFuel = @s jetpackTemp
execute as @a[tag=hasJetPack] store result score @s jetpackFuel run data get entity @s equipment.chest.components.minecraft:custom_data.jetpackFuel
execute as @a[tag=hasJetPack] unless score @s jetpackTemp = @s jetpackItemFuel store result score @s jetpackMax run data get entity @s equipment.chest.components.minecraft:custom_data.jetpackMaxFuel

#Check if sneaking
tag @a[scores={sneaking=1..}] add sneaking
tag @a[scores={sneaking=0}] remove sneaking
tag @a[scores={jetpackFuel=..0}] remove sneaking
execute as @a[scores={jetpackFuel=..-1}] run scoreboard players set @s jetpackFuel 0
scoreboard players set @a[tag=sneaking] sneaking 0

#Jetpack go up
execute as @a[tag=sneaking,tag=hasJetPack] run advancement grant @s only coolfunctions:jetpack/use
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:1b} run effect give @s levitation 1 9 true
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:2b} run effect give @s levitation 1 12 true
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:3b} run effect give @s levitation 1 16 true
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:4b} run effect give @s levitation 1 22 true
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:5b} run effect give @s levitation 1 25 true
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:10b} run effect give @s levitation 1 30 true
execute as @a[tag=sneaking,tag=hasJetPack] run scoreboard players remove @s jetpackFuel 1
execute as @a[tag=sneaking,tag=hasJetPack] run playsound minecraft:block.sand.idle neutral @s ~ ~ ~ 50 0.5
execute positioned as @a[tag=sneaking,tag=hasJetPack] run particle flame ^-0.5 ^-1 ^-0.5 0.1 1 0.1 50 10 force

# Persist updated fuel back into the equipped jetpack item by building a temp
# item entity, writing scoreboard values into its NBT, replacing the player's
# chest slot from that entity, then removing the temp item. Works reliably in 1.21.
execute as @a[tag=sneaking,tag=hasJetPack] at @s run summon item ~ ~1 ~ {Item:{id:"minecraft:leather_chestplate",count:1b,components:{"minecraft:custom_data":{jetpack:1b,jetpackFuel:0,jetpackMaxFuel:0},item_name:[{"text":"Jet Pack","color":"#FFD400"}]}},Tags:["tempJetpack"]}
execute as @a[tag=sneaking,tag=hasJetPack] at @s run execute store result entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:custom_data.jetpackFuel int 1 run scoreboard players get @s jetpackFuel
execute as @a[tag=sneaking,tag=hasJetPack] at @s run execute store result entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:custom_data.jetpackMaxFuel int 1 run scoreboard players get @s jetpackMax
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:1b} run data modify entity @e[type=item,tag=tempJetpack,sort=nearest,limit=1] Item.components.minecraft:item_name set value [{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"},"  §7| §aTier 1"]
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:2b} run data modify entity @e[type=item,tag=tempJetpack,sort=nearest,limit=1] Item.components.minecraft:item_name set value [{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"},"  §7| §2Tier 2"]
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:3b} run data modify entity @e[type=item,tag=tempJetpack,sort=nearest,limit=1] Item.components.minecraft:item_name set value [{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"},"  §7| §eTier 3"]
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:4b} run data modify entity @e[type=item,tag=tempJetpack,sort=nearest,limit=1] Item.components.minecraft:item_name set value [{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"},"  §7| §6Tier 4"]
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:5b} run data modify entity @e[type=item,tag=tempJetpack,sort=nearest,limit=1] Item.components.minecraft:item_name set value [{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"},"  §7| §5Tier 5"]
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:10b} run data modify entity @e[type=item,tag=tempJetpack,sort=nearest,limit=1] Item.components.minecraft:item_name set value [{"text":"","extra":[{"text":"C","color":"#0ECDF3"},{"text":"r","color":"#22B0EC"},{"text":"e","color":"#3592E5"},{"text":"a","color":"#4975DE"},{"text":"t","color":"#5C58D6"},{"text":"i","color":"#703BCF"},{"text":"v","color":"#831DC8"},{"text":"e ","color":"#9700C1"}]},{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"}]
execute as @a[tag=sneaking,tag=hasJetPack] if data entity @s equipment.chest.components.minecraft:custom_data.jetpackTier run data modify entity @e[type=item,tag=tempJetpack,sort=nearest,limit=1] Item.components.minecraft:custom_data.jetpackTier set from entity @s equipment.chest.components.minecraft:custom_data.jetpackTier
execute as @a[tag=sneaking,tag=hasJetPack] at @s run item replace entity @s armor.chest from entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] container.0
execute as @a[tag=sneaking,tag=hasJetPack] at @s run kill @e[type=item,tag=tempJetpack,limit=1,sort=nearest]

#Jetpack go down
execute as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] positioned as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run effect give @s slow_falling 1 0 true
execute as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] positioned as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run particle ash ~ ~ ~ 0.5 0 0.5 10 10 force
execute as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] positioned as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run playsound minecraft:block.dry_grass.ambient neutral @s ~ ~ ~ 0.5 2

function coolfunctions:jetpack/jetpack_bar
# function coolfunctions:jetpack/jetpack_drop_craft