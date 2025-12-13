tellraw @p[tag=morph] "§e[§2§lCF§r§e] §cAppearance reset to player"
kill @e[type=!player,tag=morphmob]
execute at @p[tag=morphmob] run team leave @e[tag=morphmob,limit=1,distance=..2,sort=nearest] 
team leave @p[tag=morph]
effect clear @p[tag=morph] invisibility
effect clear @p[tag=morph] instant_health
effect give @p[tag=morph] instant_health 11 5 true
attribute @p[tag=morph] minecraft:max_health base set 20
tag @p[tag=morph] remove morph