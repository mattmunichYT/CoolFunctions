execute as @a[tag=morph] unless entity @e[tag=morphmob,type=!player,limit=1,sort=nearest] run function coolfunctions:morph/nomob
#Effects 
effect give @a[tag=morph,nbt=!{ActiveEffects:[{Id:6}]}] instant_health infinite 10 true
execute as @a[tag=morph,nbt=!{ActiveEffects:[{Id:14}]}] run effect give @s invisibility infinite 1 true
#TP mob to player
execute as @p[tag=morph] run tp @e[tag=morphmob,type=!player,limit=1,sort=nearest] @s
#Morph mode message
execute as @p[tag=morph] run title @s actionbar [{"text":"<","color": "dark_red","bold": true},{"text":"§6Morph §aenabled","color": "gold","bold": false},{"text":">","color": "dark_red","bold": true}]
#Team no collision
team join noCollisions.COOLFUNCTIONS @a[tag=morph]
team join noCollisions.COOLFUNCTIONS @e[tag=morphmob]

#Définir la vie du joueur en fonction de celle du mob / Defining player's health according to mob's health
#function coolfunctions:morph/mobhealthtoplayer
#effect give @a[tag=morph,nbt=!{ActiveEffects:[{Id:6}]}] instant_health infinite 10 true