# jetpack/sync_item.mcfunction — called as/at each ascending jetpack wearer
# Rebuilds the chestplate from the scoreboards (fuel, max fuel) and swaps it into the chest slot.
# The durability bar is the fuel gauge: damage = maxFuel - fuel, max_damage = maxFuel.
summon item ~ ~1 ~ {Item:{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:custom_data":{jetpack:1b,jetpackFuel:0,jetpackMaxFuel:0},"minecraft:equippable":{slot:"chest",equip_sound:{sound_id:"minecraft:none",range:0.1},asset_id:"minecraft:chestplate",damage_on_hurt:false},"minecraft:max_damage":1,"minecraft:damage":0,item_name:[{"text":"Jet Pack","color":"#FFD400"}]}},Tags:["tempJetpack"]}

execute store result entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:custom_data.jetpackFuel int 1 run scoreboard players get @s cf.jetpack.fuel
execute store result entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:custom_data.jetpackMaxFuel int 1 run scoreboard players get @s cf.jetpack.fuel.max
execute store result entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:custom_data.jetpackTier int 1 run data get entity @s equipment.chest.components.minecraft:custom_data.jetpackTier

# Durability = fuel. damage = max - fuel, clamped to 0..max-1 (never "broken", even at 0 fuel)
scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
scoreboard players operation @s cf.jetpack.temp -= @s cf.jetpack.fuel
execute if score @s cf.jetpack.temp matches ..-1 run scoreboard players set @s cf.jetpack.temp 0
execute if score @s cf.jetpack.temp >= @s cf.jetpack.fuel.max run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute if score @s cf.jetpack.temp >= @s cf.jetpack.fuel.max run scoreboard players remove @s cf.jetpack.temp 1
execute if score @s cf.jetpack.fuel.max matches 1.. store result entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:max_damage int 1 run scoreboard players get @s cf.jetpack.fuel.max
execute if score @s cf.jetpack.fuel.max matches 1.. store result entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:damage int 1 run scoreboard players get @s cf.jetpack.temp

item modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] container.0 coolfunctions:jetpack_lore

execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:1} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:item_name set value [{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"},"  §7| §aTier 1"]
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:2} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:item_name set value [{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"},"  §7| §2Tier 2"]
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:3} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:item_name set value [{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"},"  §7| §eTier 3"]
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:4} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:item_name set value [{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"},"  §7| §6Tier 4"]
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:5} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:item_name set value [{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"},"  §7| §5Tier 5"]
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:10} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:item_name set value [{"text":"","extra":[{"text":"C","color":"#0ECDF3"},{"text":"r","color":"#22B0EC"},{"text":"e","color":"#3592E5"},{"text":"a","color":"#4975DE"},{"text":"t","color":"#5C58D6"},{"text":"i","color":"#703BCF"},{"text":"v","color":"#831DC8"},{"text":"e ","color":"#9700C1"}]},{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"}]

execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:1} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:dyed_color set value 4473924
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:2} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:dyed_color set value 16755200
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:3} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:dyed_color set value 16051456
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:4} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:dyed_color set value 14176000
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:5} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:dyed_color set value 13850367
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:10} run data modify entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] Item.components.minecraft:dyed_color set value 16728063

item replace entity @s armor.chest from entity @e[type=item,tag=tempJetpack,limit=1,sort=nearest] container.0
kill @e[type=item,tag=tempJetpack,limit=1,sort=nearest]
