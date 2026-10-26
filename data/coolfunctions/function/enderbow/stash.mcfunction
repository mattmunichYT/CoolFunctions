# as/at player: the offhand holds a real item that must not be wiped
execute unless score @s cf.id matches 1.. run function coolfunctions:enderbow/assign_id
execute store result storage coolfunctions:enderbow args.id int 1 run scoreboard players get @s cf.id

# Temporary holder used to copy the item into storage / back out of it
summon armor_stand ~ ~ ~ {Tags:["cf.holder"],Invisible:1b,Marker:1b,NoGravity:1b,Silent:1b,Invulnerable:1b}
item replace entity @n[type=armor_stand,tag=cf.holder] weapon.mainhand from entity @s weapon.offhand

# Free stash -> store it. Stash already used (player swapped the offhand manually during Ender Bow mode) -> send it to the inventory instead
# (bump first: stash_save adds the cf.hasStash tag)
execute if entity @s[tag=cf.hasStash] run function coolfunctions:enderbow/bump
execute if entity @s[tag=!cf.hasStash] run function coolfunctions:enderbow/stash_save with storage coolfunctions:enderbow args

# Empty the holder before removing it so nothing can drop (no dupe)
item replace entity @n[type=armor_stand,tag=cf.holder] weapon.mainhand with air
kill @e[type=armor_stand,tag=cf.holder]