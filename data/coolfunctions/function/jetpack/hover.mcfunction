# Runs as the ascending player, mode 0 (jump held, fuel > 0).
# Cancels gravity (base 0.08 * (1 + -1) = 0) for as long as the player keeps hovering.
# The modifier is removed again in jetpack_utils ("Release") when the state ends.
execute unless entity @s[tag=cf.jetpack.hovering] run attribute @s minecraft:gravity modifier add coolfunctions:jetpack_hover -1 add_multiplied_total
tag @s add cf.jetpack.hovering
