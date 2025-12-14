tag @p add morph
summon warden ~ ~ ~ {Tags:["morphmob"],PersistenceRequired:true}
team join noCollisions.COOLFUNCTIONS @e[tag=morphmob]
execute as @e[tag=morphmob] store result score @s morphMobHealth run attribute @s minecraft:max_health get
function coolfunctions:morph/mobhealthtoplayer
tellraw @p[tag=morph] "§x§F§C§D§0§5§C§l[C§x§D§5§D§5§7§6§lo§x§A§E§D§9§9§1§lo§x§8§6§D§E§A§B§ll§x§5§F§E§2§C§5§lF§x§6§6§E§6§A§E§lu§x§6§D§E§A§9§6§ln§x§7§3§E§D§7§F§lc§x§7§A§F§1§6§7§lt§x§7§A§F§1§6§7§li§x§7§A§F§1§6§7§lo§x§7§A§F§1§6§7§ln§x§7§A§F§1§6§7§ls]§r §aMorphed to a §5warden"