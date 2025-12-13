tellraw @p[tag=morph] "§e[§2§lCF§r§e] §eNo entity found §7- §cYou'll be visible again in 10 seconds!"
effect clear @p[tag=morph] invisibility
effect clear @p[tag=morph] instant_health
effect give @p[tag=morph] invisibility 11 2 true
effect give @p[tag=morph] instant_health 11 5 true
attribute @p[tag=morph] minecraft:max_health base set 20
tag @p[tag=morph] remove morph