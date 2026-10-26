# Macro, runs as the player. Called from thrust.mcfunction with storage coolfunctions:tmp {amp:<int>}
# Clear first: otherwise a previous higher-amplifier levitation (1s duration) would keep overriding
# the new, lower one, which would break both the mode scaling and the height caps.
effect clear @s minecraft:levitation
$effect give @s minecraft:levitation 1 $(amp) true
tag @s add cf.jetpack.thrusting
