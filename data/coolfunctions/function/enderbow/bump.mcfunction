# as/at player: drops the item held by the cf.holder stand at the player's feet, instantly picked up into the inventory
summon item ~ ~ ~ {Tags:["cf.bump"],PickupDelay:0s,Item:{id:"minecraft:stone",count:1}}
data modify entity @n[type=item,tag=cf.bump] Item set from entity @n[type=armor_stand,tag=cf.holder] equipment.mainhand
tag @e[type=item,tag=cf.bump] remove cf.bump
