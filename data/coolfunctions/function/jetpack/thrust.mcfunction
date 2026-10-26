# Runs as the ascending player, modes 1-4.
# Computes the levitation amplifier from tier + height band into cf.jetpack.amp; the mode scales it afterwards.
#
# Balance (100% power). Climb speed ~ 0.9 * (amp + 1) blocks/s.
# Tier | fuel (min / ticks) | full thrust amp (speed) | full thrust below | taper (amp) | ceiling (crawl, amp 0)
#  1   |   2 / 2400         |  8 (~8 b/s)             | 14 blocks         | 14..19 (2)  | 20+
#  2   |  5 / 6000        | 12 (~12 b/s)            | 33 blocks         | 33..39 (3)  | 40+
#  3   |  10 / 12000        | 16 (~15 b/s)            | 60 blocks         | 60..69 (4)  | 70+
#  4   |  20 / 24000        | 20 (~19 b/s)            | 88 blocks         | 88..99 (5)  | 100+
#  5   |  40 / 48000        | 25 (~24 b/s)            | 135 blocks        | 135..149 (6)| 150+
# Creative (tier 10): amp 30 (~28 b/s) at any height, infinite fuel.
# The fuel capacity itself is set where the jetpack is crafted/given (jetpackMaxFuel).

# -1 = no tier matched (no effect applied)
scoreboard players set @s cf.jetpack.amp -1

execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:1} if score @s cf.heightAboveGround matches ..13 run scoreboard players set @s cf.jetpack.amp 8
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:1} if score @s cf.heightAboveGround matches 14..19 run scoreboard players set @s cf.jetpack.amp 2
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:1} if score @s cf.heightAboveGround matches 20.. run scoreboard players set @s cf.jetpack.amp 0

execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:2} if score @s cf.heightAboveGround matches ..32 run scoreboard players set @s cf.jetpack.amp 12
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:2} if score @s cf.heightAboveGround matches 33..39 run scoreboard players set @s cf.jetpack.amp 3
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:2} if score @s cf.heightAboveGround matches 40.. run scoreboard players set @s cf.jetpack.amp 0

execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:3} if score @s cf.heightAboveGround matches ..59 run scoreboard players set @s cf.jetpack.amp 16
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:3} if score @s cf.heightAboveGround matches 60..69 run scoreboard players set @s cf.jetpack.amp 4
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:3} if score @s cf.heightAboveGround matches 70.. run scoreboard players set @s cf.jetpack.amp 0

execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:4} if score @s cf.heightAboveGround matches ..87 run scoreboard players set @s cf.jetpack.amp 20
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:4} if score @s cf.heightAboveGround matches 88..99 run scoreboard players set @s cf.jetpack.amp 5
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:4} if score @s cf.heightAboveGround matches 100.. run scoreboard players set @s cf.jetpack.amp 0

execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:5} if score @s cf.heightAboveGround matches ..134 run scoreboard players set @s cf.jetpack.amp 25
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:5} if score @s cf.heightAboveGround matches 135..149 run scoreboard players set @s cf.jetpack.amp 6
execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:5} if score @s cf.heightAboveGround matches 150.. run scoreboard players set @s cf.jetpack.amp 0

execute if data entity @s equipment.chest.components.minecraft:custom_data{jetpackTier:10} run scoreboard players set @s cf.jetpack.amp 30

# Scale by mode. Levitation speed is proportional to (amplifier + 1), so scale that:
#   level = amp + 1          (unmatched -1 -> 0)
#   level = ceil(level * mode / 4)    (+3 before /4 = round up, so a matched tier never drops below level 1)
#   amp   = level - 1        (unmatched stays -1; mode 4 gives the table amplifier back)
scoreboard players add @s cf.jetpack.amp 1
scoreboard players operation @s cf.jetpack.amp *= @s cf.jetpack.mode
scoreboard players add @s cf.jetpack.amp 3
scoreboard players operation @s cf.jetpack.amp /= const4 cf.const
scoreboard players remove @s cf.jetpack.amp 1

# Apply (the amplifier is dynamic, so this goes through a macro)
execute if score @s cf.jetpack.amp matches 0.. store result storage coolfunctions:tmp amp int 1 run scoreboard players get @s cf.jetpack.amp
execute if score @s cf.jetpack.amp matches 0.. run function coolfunctions:jetpack/thrust_effect with storage coolfunctions:tmp
