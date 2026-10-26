# as/at player who left Ender Bow mode (Ender Arrow already cleared by enderbow_utils)
execute if entity @s[tag=cf.hasStash] run function coolfunctions:enderbow/restore_stash
tag @s remove cf.enderMode
