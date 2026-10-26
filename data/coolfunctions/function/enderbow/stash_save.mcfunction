# macro: $(id) = player id
$data modify storage coolfunctions:enderbow stash.p$(id) set from entity @n[type=armor_stand,tag=cf.holder] equipment.mainhand
tag @s add cf.hasStash
