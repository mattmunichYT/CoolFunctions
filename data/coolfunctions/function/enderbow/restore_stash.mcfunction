execute store result storage coolfunctions:enderbow args.id int 1 run scoreboard players get @s cf.id
summon armor_stand ~ ~ ~ {Tags:["cf.holder"],Invisible:1b,Marker:1b,NoGravity:1b,Silent:1b,Invulnerable:1b}
function coolfunctions:enderbow/restore_load with storage coolfunctions:enderbow args
item replace entity @n[type=armor_stand,tag=cf.holder] weapon.mainhand with air
kill @e[type=armor_stand,tag=cf.holder]
