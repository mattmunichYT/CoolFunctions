# Gives the player a persistent numeric id (used as the key of their stash in storage)
scoreboard players add #next cf.id 1
scoreboard players operation @s cf.id = #next cf.id
