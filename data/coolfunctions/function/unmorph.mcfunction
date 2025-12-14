tellraw @p[tag=morph] "§x§F§C§D§0§5§C§l[C§x§D§5§D§5§7§6§lo§x§A§E§D§9§9§1§lo§x§8§6§D§E§A§B§ll§x§5§F§E§2§C§5§lF§x§6§6§E§6§A§E§lu§x§6§D§E§A§9§6§ln§x§7§3§E§D§7§F§lc§x§7§A§F§1§6§7§lt§x§7§A§F§1§6§7§li§x§7§A§F§1§6§7§lo§x§7§A§F§1§6§7§ln§x§7§A§F§1§6§7§ls]§r §cAppearance reset to player"
kill @e[type=!player,tag=morphmob]
execute at @p[tag=morphmob] run team leave @e[tag=morphmob,limit=1,distance=..2,sort=nearest] 
team leave @p[tag=morph]
effect clear @p[tag=morph] invisibility
effect clear @p[tag=morph] instant_health
effect give @p[tag=morph] instant_health 11 5 true
attribute @p[tag=morph] minecraft:max_health base set 20
tag @p[tag=morph] remove morph