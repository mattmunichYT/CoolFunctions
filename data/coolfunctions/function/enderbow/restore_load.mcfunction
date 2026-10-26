# macro: $(id) = player id
$data modify entity @n[type=armor_stand,tag=cf.holder] equipment.mainhand set from storage coolfunctions:enderbow stash.p$(id)
# Offhand free -> put it back there. Occupied (e.g. the player swapped hands with F) -> inventory instead
# (bump first so the two lines can't both fire)
execute if items entity @s weapon.offhand * run function coolfunctions:enderbow/bump
execute unless items entity @s weapon.offhand * run item replace entity @s weapon.offhand from entity @n[type=armor_stand,tag=cf.holder] weapon.mainhand
$data remove storage coolfunctions:enderbow stash.p$(id)
tag @s remove cf.hasStash
