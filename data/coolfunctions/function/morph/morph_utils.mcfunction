execute as @a[tag=morph] unless entity @e[tag=morphmob,type=!player,limit=1,sort=nearest] run function coolfunctions:morph/nomob
#Effects 
effect give @a[tag=morph,nbt=!{active_effects:[{id:"minecraft:instant_damage"}]}] instant_health infinite 10 true
execute as @a[tag=morph,nbt=!{active_effects:[{id:"minecraft:invisibility"}]}] run effect give @s invisibility infinite 1 true
#TP mob to player
execute as @p[tag=morph] run tp @e[tag=morphmob,type=!player,limit=1,sort=nearest] @s
#Morph mode message
execute as @p[tag=morph] run title @s actionbar {"text":"","extra":["§4<",{"text":"M","color":"#FFB900","bold":true},{"text":"o","color":"#FEBF17","bold":true},{"text":"r","color":"#FEC52E","bold":true},{"text":"p","color":"#FDCA45","bold":true},{"text":"h","color":"#FCD05C","bold":true},{"text":" "},{"text":"e","color":"#A6E848","bold":true},{"text":"n","color":"#7BF33E","bold":true},{"text":"a","color":"#50FF34","bold":true},{"text":"b","color":"#50FF34","bold":true},{"text":"l","color":"#50FF34","bold":true},{"text":"e","color":"#50FF34","bold":true},{"text":"d","color":"#50FF34","bold":true},"§4>"]}
#Team no collision
team join noCollisions.COOLFUNCTIONS @a[tag=morph]
team join noCollisions.COOLFUNCTIONS @e[tag=morphmob]