# Runs as the player. Builds the actionbar: [fuel bar] N% Fuel | Mode: X
# Per-player on purpose: the mode label goes through shared storage, which only works one player at a time.

# bar = number of filled segments (0..10) = fuel * 10 / max
scoreboard players operation @s cf.jetpack.bar = @s cf.jetpack.fuel
scoreboard players operation @s cf.jetpack.bar *= const10 cf.const
scoreboard players operation @s cf.jetpack.bar /= @s cf.jetpack.fuel.max

# Mode label -> storage (read back below with "interpret")
execute if score @s cf.jetpack.mode matches 0 run data modify storage coolfunctions:tmp mode set value {text:"HOVER",color:"aqua",bold:true}
execute if score @s cf.jetpack.mode matches 1 run data modify storage coolfunctions:tmp mode set value {text:"25%",color:"green",bold:true}
execute if score @s cf.jetpack.mode matches 2 run data modify storage coolfunctions:tmp mode set value {text:"50%",color:"yellow",bold:true}
execute if score @s cf.jetpack.mode matches 3 run data modify storage coolfunctions:tmp mode set value {text:"75%",color:"gold",bold:true}
execute if score @s cf.jetpack.mode matches 4 run data modify storage coolfunctions:tmp mode set value {text:"100%",color:"red",bold:true}

# Fuel bar + mode (ranges no longer overlap; at least 1 segment is shown while there is any fuel)
execute if score @s cf.jetpack.fuel matches ..0 run title @s actionbar [{"text":"§e[§7□□□□□□□□□□§e]§4 0% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
execute if score @s cf.jetpack.fuel matches 1.. if score @s cf.jetpack.bar matches ..1 run title @s actionbar [{"text":"§e[§a█§7□□□□□□□□□§e]§4 10% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
execute if score @s cf.jetpack.fuel matches 1.. if score @s cf.jetpack.bar matches 2 run title @s actionbar [{"text":"§e[§a██§7□□□□□□□□§e]§c 20% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
execute if score @s cf.jetpack.fuel matches 1.. if score @s cf.jetpack.bar matches 3 run title @s actionbar [{"text":"§e[§a███§7□□□□□□□§e]§6 30% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
execute if score @s cf.jetpack.fuel matches 1.. if score @s cf.jetpack.bar matches 4 run title @s actionbar [{"text":"§e[§a████§7□□□□□□§e]§6 40% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
execute if score @s cf.jetpack.fuel matches 1.. if score @s cf.jetpack.bar matches 5 run title @s actionbar [{"text":"§e[§a█████§7□□□□□§e]§e 50% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
execute if score @s cf.jetpack.fuel matches 1.. if score @s cf.jetpack.bar matches 6 run title @s actionbar [{"text":"§e[§a██████§7□□□□§e]§e 60% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
execute if score @s cf.jetpack.fuel matches 1.. if score @s cf.jetpack.bar matches 7 run title @s actionbar [{"text":"§e[§a███████§7□□□§e]§a 70% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
execute if score @s cf.jetpack.fuel matches 1.. if score @s cf.jetpack.bar matches 8 run title @s actionbar [{"text":"§e[§a████████§7□□§e]§a 80% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
execute if score @s cf.jetpack.fuel matches 1.. if score @s cf.jetpack.bar matches 9 run title @s actionbar [{"text":"§e[§a█████████§7□]§2 90% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
execute if score @s cf.jetpack.fuel matches 1.. if score @s cf.jetpack.bar matches 10.. run title @s actionbar [{"text":"§e[§a██████████§e]§2 100% Fuel"},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]

# Infinite fuel (the fuel * 10 above can overflow here, so this line always wins)
execute if score @s cf.jetpack.fuel.max matches 999999999 unless score @s cf.jetpack.fuel matches 0 run title @s actionbar [{text:"§5[§d██████████§5] "},{"text":"","extra":[{"text":"∞","color":"#9863E7","bold":true},{"text":" "},{"text":"F","color":"#8582E9","bold":true},{"text":"u","color":"#7B92EA","bold":true},{"text":"e","color":"#72A1EB","bold":true},{"text":"l","color":"#68B1EC","bold":true}]},{"text":" §8| §7Mode: "},{"nbt":"mode","storage":"coolfunctions:tmp","interpret":true}]
