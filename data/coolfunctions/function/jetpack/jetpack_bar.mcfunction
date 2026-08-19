
# Build and show a 10-segment actionbar fuel display per player (green █ = remaining)
execute as @a[tag=cf.jetpack.has] run scoreboard players set @s cf.jetpack.bar 0

execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp *= const1 cf.const
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp /= const10 cf.const
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel >= @s cf.jetpack.temp run scoreboard players add @s cf.jetpack.bar 1

execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp *= const2 cf.const
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp /= const10 cf.const
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel >= @s cf.jetpack.temp run scoreboard players add @s cf.jetpack.bar 1

execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp *= const3 cf.const
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp /= const10 cf.const
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel >= @s cf.jetpack.temp run scoreboard players add @s cf.jetpack.bar 1

execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp *= const4 cf.const
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp /= const10 cf.const
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel >= @s cf.jetpack.temp run scoreboard players add @s cf.jetpack.bar 1

execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp *= const5 cf.const
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp /= const10 cf.const
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel >= @s cf.jetpack.temp run scoreboard players add @s cf.jetpack.bar 1

execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp *= const6 cf.const
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp /= const10 cf.const
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel >= @s cf.jetpack.temp run scoreboard players add @s cf.jetpack.bar 1

execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp *= const7 cf.const
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp /= const10 cf.const
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel >= @s cf.jetpack.temp run scoreboard players add @s cf.jetpack.bar 1

execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp *= const8 cf.const
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp /= const10 cf.const
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel >= @s cf.jetpack.temp run scoreboard players add @s cf.jetpack.bar 1

execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp *= const9 cf.const
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp /= const10 cf.const
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel >= @s cf.jetpack.temp run scoreboard players add @s cf.jetpack.bar 1

execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp = @s cf.jetpack.fuel.max
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp *= const10 cf.const
execute as @a[tag=cf.jetpack.has] run scoreboard players operation @s cf.jetpack.temp /= const10 cf.const
execute as @a[tag=cf.jetpack.has] if score @s cf.jetpack.fuel >= @s cf.jetpack.temp run scoreboard players add @s cf.jetpack.bar 1

# Show actionbar based on cf.jetpack.bar (0..10)
execute as @a[tag=cf.jetpack.has,scores={cf.jetpack.fuel=..0}] if score @s cf.jetpack.bar matches 0 run title @s actionbar {"text":"§e[§7□□□□□□□□□□§e]§4 0% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.bar matches 0..1 run title @s actionbar {"text":"§e[§a█§7□□□□□□□□□§e]§4 10% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.bar matches 1..2 run title @s actionbar {"text":"§e[§a██§7□□□□□□□□§e]§c 20% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.bar matches 2..3 run title @s actionbar {"text":"§e[§a███§7□□□□□□□§e]§6 30% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.bar matches 3..4 run title @s actionbar {"text":"§e[§a████§7□□□□□□§e]§6 40% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.bar matches 4..5 run title @s actionbar {"text":"§e[§a█████§7□□□□□§e]§e 50% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.bar matches 5..6 run title @s actionbar {"text":"§e[§a██████§7□□□□§e]§e 60% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.bar matches 6..7 run title @s actionbar {"text":"§e[§a███████§7□□□§e]§a 70% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.bar matches 7..8 run title @s actionbar {"text":"§e[§a████████§7□□§e]§a 80% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.bar matches 8..9 run title @s actionbar {"text":"§e[§a█████████§7□]§2 90% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.bar matches 9..10 run title @s actionbar {"text":"§e[§a██████████§e]§2 100% Fuel"}
execute as @a[tag=cf.jetpack.has,tag=cf.sneaking] if score @s cf.jetpack.fuel.max matches 999999999 unless score @s cf.jetpack.fuel matches 0 run title @s actionbar [{text:"§5[§d██████████§5] "},{"text":"","extra":[{"text":"∞","color":"#9863E7","bold":true},{"text":" "},{"text":"F","color":"#8582E9","bold":true},{"text":"u","color":"#7B92EA","bold":true},{"text":"e","color":"#72A1EB","bold":true},{"text":"l","color":"#68B1EC","bold":true}]}]