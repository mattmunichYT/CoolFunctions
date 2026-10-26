# Runs as AND at the player who just pressed sneak (see jetpack_utils)
# 0 hover -> 1 (25%) -> 2 (50%) -> 3 (75%) -> 4 (100%) -> back to 0
scoreboard players add @s cf.jetpack.mode 1
execute if score @s cf.jetpack.mode matches 5.. run scoreboard players set @s cf.jetpack.mode 0

# Keep the actionbar visible for 2 seconds so the change is seen even when not ascending
scoreboard players set @s cf.jetpack.display 40

playsound minecraft:ui.button.click player @s ~ ~ ~ 1 1.6
tag @s remove cf.sneak.pressed
