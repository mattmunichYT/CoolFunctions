tag @p add morph
summon iron_golem ~ ~ ~ {Tags:["morphmob"],PersistenceRequired:true}
execute as @e[tag=morphmob] store result score @s morphMobHealth run attribute @s minecraft:max_health get
function coolfunctions:morph/mobhealthtoplayer
tellraw @p[tag=morph] "§e[§2§lCF§r§e] §aMorphed to an §7iron golem"