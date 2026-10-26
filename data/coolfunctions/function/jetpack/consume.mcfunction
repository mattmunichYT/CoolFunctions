# Runs as the ascending player, every tick. Fuel is in ticks of full-power flight.
# Burn is expressed in quarters of a fuel unit per tick (4 = 1 fuel every tick, 1 = 1 fuel every 4 ticks).
# Tweak the numbers here to rebalance the modes.
#   mode 0  hover  -> 1  (0.25 fuel/tick)
#   mode 1  25%    -> 1  (0.25 fuel/tick)
#   mode 2  50%    -> 2  (0.50 fuel/tick)
#   mode 3  75%    -> 3  (0.75 fuel/tick)
#   mode 4  100%   -> 4  (1.00 fuel/tick, same as before)
execute if score @s cf.jetpack.mode matches 0..1 run scoreboard players set @s cf.jetpack.burn 1
execute if score @s cf.jetpack.mode matches 2 run scoreboard players set @s cf.jetpack.burn 2
execute if score @s cf.jetpack.mode matches 3 run scoreboard players set @s cf.jetpack.burn 3
execute if score @s cf.jetpack.mode matches 4 run scoreboard players set @s cf.jetpack.burn 4

# Spend 1 fuel on the first <burn> ticks of every 4-tick cycle
execute if score @s cf.jetpack.burn > #phase cf.jetpack.temp run scoreboard players remove @s cf.jetpack.fuel 1
