#Add kill tag to items
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:coal_block",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:leather_chestplate",count:1}}] run tag @e[distance=..1,type=item,nbt={Item:{id:"minecraft:iron_ingot",count:3}}] add kill
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:leather_chestplate",count:1}}] run tag @e[distance=..1,type=item,nbt={Item:{id:"minecraft:coal_block",count:3}}] add kill
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:coal_block",count:3}}] run tag @e[distance=..1,type=item,nbt={Item:{id:"minecraft:leather_chestplate",count:1}}] add kill

#Summon effects
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:coal_block",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:leather_chestplate",count:1}}] run particle minecraft:electric_spark ~ ~ ~ 0 0 0 2 100 normal
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:coal_block",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:leather_chestplate",count:1}}] run playsound minecraft:block.redstone_torch.burnout block @a[distance=..10]
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:coal_block",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:leather_chestplate",count:1}}] run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 2 1 normal
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:coal_block",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:leather_chestplate",count:1}}] run playsound entity.generic.explode block @a[distance=..10]
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:coal_block",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:leather_chestplate",count:1}}] run particle minecraft:cloud ~ ~ ~ 0 0 0 0.01 1000 normal

#Summon Jetpack
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:coal_block",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:leather_chestplate",count:1}}] run summon item ~ ~ ~ {Item:{id:"leather_chestplate",count:1,components:{"minecraft:custom_model_data":{floats:[2f]},"minecraft:custom_data":{jetpack:true},"minecraft:item_name":[{"color":"#FFF700","text":"J"},{"color":"#FFD400","text":"e"},{"color":"#FFB000","text":"t "},{"color":"#FF8D00","text":"P"},{"color":"#FF6A00","text":"a"},{"color":"#FF4700","text":"c"},{"color":"#FF0000","text":"k"}]}}}

#Kill craft items
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:coal_block",count:3}}] if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:leather_chestplate",count:1}}] run kill @e[tag=kill,type=item,distance=..2]

#Check for jetpack
execute as @a[nbt={equipment:{chest:{id:"minecraft:leather_chestplate",components:{"minecraft:custom_model_data":{floats:[2f]},"minecraft:custom_data":{jetpack:true}}}}}] run tag @s add hasJetPack
execute as @a[nbt=!{equipment:{chest:{id:"minecraft:leather_chestplate",components:{"minecraft:custom_model_data":{floats:[2f]},"minecraft:custom_data":{jetpack:true}}}}}] run tag @s remove hasJetPack

#Check if sneaking
tag @a[scores={sneaking=1}] add sneaking
tag @a[scores={sneaking=0}] remove sneaking
scoreboard players set @a[tag=sneaking] sneaking 0

#Jetpack go up
execute as @a[tag=sneaking,tag=hasJetPack] run advancement grant @s only coolfunctions:jetpack/use
execute as @a[tag=sneaking,tag=hasJetPack] run effect give @s levitation 1 10 true
execute as @a[tag=sneaking,tag=hasJetPack] run playsound minecraft:block.sand.idle neutral @s ~ ~ ~ 50 0.5
execute positioned as @a[tag=sneaking,tag=hasJetPack] run particle flame ~ ~-5 ~ 0.1 3 0.1 1 25 force

#Jetpack go down
execute as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] positioned as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run effect give @s slow_falling 1 0 true
execute as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] positioned as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run particle ash ~ ~ ~ 0.5 0 0.5 10 10 force
execute as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] positioned as @a[tag=!sneaking,tag=hasJetPack,nbt=!{OnGround:true}] if block ~ ~-2 ~ #minecraft:air run playsound minecraft:block.dry_grass.ambient neutral @s ~ ~ ~ 0.5 2