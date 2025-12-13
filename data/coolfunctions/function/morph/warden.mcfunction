tag @p add morph
summon warden ~ ~ ~ {Tags:["morphmob"],PersistenceRequired:true}
team join noCollisions.COOLFUNCTIONS @e[tag=morphmob]
execute as @e[tag=morphmob] store result score @s morphMobHealth run attribute @s minecraft:max_health get
function coolfunctions:morph/mobhealthtoplayer
tellraw @p[tag=morph] "§e[§2§lCF§r§e] §aMorphed to a §5warden"