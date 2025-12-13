#- Craft EnderBow -
#Add killItem tag
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] as @e[distance=..1,type=item,nbt={Item:{id:"minecraft:ender_pearl",count:3}}] run tag @s add killItem
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:ender_pearl",count:3}}] as @e[type=item,nbt={Item:{id:"minecraft:bow"}},distance=..1] run tag @s add killItem

#Spawn effects
execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s as @e[distance=..1,type=item,nbt={Item:{id:"minecraft:ender_pearl",count:3}}] run particle minecraft:electric_spark ~ ~ ~ 0 0 0 2 100 normal
execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s as @e[distance=..1,type=item,nbt={Item:{id:"minecraft:ender_pearl",count:3}}] run playsound minecraft:block.redstone_torch.burnout block @a[distance=..10]
execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s as @e[distance=..1,type=item,nbt={Item:{id:"minecraft:ender_pearl",count:3}}] run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 2 1 normal
execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s as @e[distance=..1,type=item,nbt={Item:{id:"minecraft:ender_pearl",count:3}}] run playsound entity.generic.explode block @a[distance=..10]
execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s as @e[distance=..1,type=item,nbt={Item:{id:"minecraft:ender_pearl",count:3}}] run particle minecraft:cloud ~ ~ ~ 0 0 0 0.01 1000 normal
#Summon item
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] as @e[distance=..1,type=item,nbt={Item:{id:"minecraft:ender_pearl",count:3}}] run summon item ~ ~ ~ {Item:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":{floats:[1]},"minecraft:item_name":[{"color":"#F3FF87","text":"E"},{"color":"#F0EC96","text":"n"},{"color":"#EDD8A5","text":"d"},{"color":"#EAC5B4","text":"e"},{"color":"#E7B1C3","text":"r "},{"color":"#E49ED2","text":"B"},{"color":"#E18AE1","text":"o"},{"color":"#DB63FF","text":"w"}],"minecraft:max_damage":500,"minecraft:custom_data":{ender_bow:true}}}}

#Kill spawn items
execute positioned as @e[type=item,nbt={Item:{id:"minecraft:bow",count:1,components:{"minecraft:custom_data":{ender_bow:true}}}}] run kill @e[tag=killItem,distance=..1]
#- End craft Ender Bow -


#Check player has EnderBow
execute as @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_data":{ender_bow:true}}}}] run tag @s add hasEnderBow
execute as @a[nbt=!{SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_data":{ender_bow:true}}}}] run tag @s remove hasEnderBow

#Bow
execute as @a[tag=hasEnderBow] run item replace entity @s weapon.offhand with arrow[item_name=[{"color":"#1E14A6","text":"E"},{"color":"#321DAF","text":"n"},{"color":"#4626B8","text":"d"},{"color":"#5A2FC1","text":"e"},{"color":"#6E38CA","text":"r "},{"color":"#8341D3","text":"A"},{"color":"#974ADB","text":"r"},{"color":"#AB53E4","text":"r"},{"color":"#BF5CED","text":"o"},{"color":"#E76EFF","text":"w"}],custom_data={ender_arrow:true}] 1 
execute as @a[tag=!hasEnderBow] run clear @s minecraft:arrow[minecraft:custom_data={ender_arrow:true}]

execute as @a[nbt={RootVehicle:{Entity:{id:"minecraft:arrow",weapon:{id:"minecraft:bow",count:1,components:{"minecraft:custom_data":{ender_bow:true}}}}}}] run advancement grant @s only coolfunctions:ender_bow/use
execute as @a[nbt={RootVehicle:{Entity:{id:"minecraft:arrow",weapon:{id:"minecraft:bow",count:1,components:{"minecraft:custom_data":{ender_bow:true}}}}}}] run data merge entity @e[type=minecraft:arrow,limit=1,distance=..3,sort=furthest] {pickup:0b}

execute as @a[tag=hasEnderBow] run ride @s mount @e[type=minecraft:arrow,limit=1,sort=nearest,nbt={weapon:{id:"minecraft:bow",components:{"minecraft:custom_data":{ender_bow:true}}}}]

execute at @e[type=minecraft:arrow,nbt={weapon:{id:"minecraft:bow",count:1,components:{"minecraft:damage":1,"minecraft:custom_data":{ender_bow:true}}}}] if block ~ ~ ~ minecraft:water run ride @p dismount
execute as @e[type=minecraft:arrow,nbt={weapon:{id:"minecraft:bow",count:1,components:{"minecraft:damage":1,"minecraft:custom_data":{ender_bow:true}}}}] if block ~ ~ ~ minecraft:water run kill @s
execute as @e[type=minecraft:arrow,nbt={weapon:{id:"minecraft:bow",count:1,components:{"minecraft:damage":1,"minecraft:custom_data":{ender_bow:true}}}}] unless block ~ ~-1 ~ #minecraft:air run kill @s