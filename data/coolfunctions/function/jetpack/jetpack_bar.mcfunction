
# Build and show a 10-segment actionbar fuel display per player (green █ = remaining)
execute as @a[tag=hasJetPack] run scoreboard players set @s jetpackBar 0

execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp = @s jetpackMax
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp *= const1 jetpackConst
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp /= const10 jetpackConst
execute as @a[tag=hasJetPack] if score @s jetpackFuel >= @s jetpackTemp run scoreboard players add @s jetpackBar 1

execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp = @s jetpackMax
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp *= const2 jetpackConst
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp /= const10 jetpackConst
execute as @a[tag=hasJetPack] if score @s jetpackFuel >= @s jetpackTemp run scoreboard players add @s jetpackBar 1

execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp = @s jetpackMax
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp *= const3 jetpackConst
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp /= const10 jetpackConst
execute as @a[tag=hasJetPack] if score @s jetpackFuel >= @s jetpackTemp run scoreboard players add @s jetpackBar 1

execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp = @s jetpackMax
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp *= const4 jetpackConst
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp /= const10 jetpackConst
execute as @a[tag=hasJetPack] if score @s jetpackFuel >= @s jetpackTemp run scoreboard players add @s jetpackBar 1

execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp = @s jetpackMax
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp *= const5 jetpackConst
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp /= const10 jetpackConst
execute as @a[tag=hasJetPack] if score @s jetpackFuel >= @s jetpackTemp run scoreboard players add @s jetpackBar 1

execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp = @s jetpackMax
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp *= const6 jetpackConst
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp /= const10 jetpackConst
execute as @a[tag=hasJetPack] if score @s jetpackFuel >= @s jetpackTemp run scoreboard players add @s jetpackBar 1

execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp = @s jetpackMax
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp *= const7 jetpackConst
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp /= const10 jetpackConst
execute as @a[tag=hasJetPack] if score @s jetpackFuel >= @s jetpackTemp run scoreboard players add @s jetpackBar 1

execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp = @s jetpackMax
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp *= const8 jetpackConst
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp /= const10 jetpackConst
execute as @a[tag=hasJetPack] if score @s jetpackFuel >= @s jetpackTemp run scoreboard players add @s jetpackBar 1

execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp = @s jetpackMax
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp *= const9 jetpackConst
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp /= const10 jetpackConst
execute as @a[tag=hasJetPack] if score @s jetpackFuel >= @s jetpackTemp run scoreboard players add @s jetpackBar 1

execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp = @s jetpackMax
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp *= const10 jetpackConst
execute as @a[tag=hasJetPack] run scoreboard players operation @s jetpackTemp /= const10 jetpackConst
execute as @a[tag=hasJetPack] if score @s jetpackFuel >= @s jetpackTemp run scoreboard players add @s jetpackBar 1

# Show actionbar based on jetpackBar (0..10)
execute as @a[tag=hasJetPack,scores={jetpackFuel=..0}] if score @s jetpackBar matches 0 run title @s actionbar {"text":"§e[§7□□□□□□□□□□§e]§4 0% Fuel"}
execute as @a[tag=hasJetPack,tag=sneaking] if score @s jetpackBar matches 0..1 run title @s actionbar {"text":"§e[§a█§7□□□□□□□□□§e]§4 10% Fuel"}
execute as @a[tag=hasJetPack,tag=sneaking] if score @s jetpackBar matches 1..2 run title @s actionbar {"text":"§e[§a██§7□□□□□□□□§e]§c 20% Fuel"}
execute as @a[tag=hasJetPack,tag=sneaking] if score @s jetpackBar matches 2..3 run title @s actionbar {"text":"§e[§a███§7□□□□□□□§e]§6 30% Fuel"}
execute as @a[tag=hasJetPack,tag=sneaking] if score @s jetpackBar matches 3..4 run title @s actionbar {"text":"§e[§a████§7□□□□□□§e]§6 40% Fuel"}
execute as @a[tag=hasJetPack,tag=sneaking] if score @s jetpackBar matches 4..5 run title @s actionbar {"text":"§e[§a█████§7□□□□□§e]§e 50% Fuel"}
execute as @a[tag=hasJetPack,tag=sneaking] if score @s jetpackBar matches 5..6 run title @s actionbar {"text":"§e[§a██████§7□□□□§e]§e 60% Fuel"}
execute as @a[tag=hasJetPack,tag=sneaking] if score @s jetpackBar matches 6..7 run title @s actionbar {"text":"§e[§a███████§7□□□§e]§a 70% Fuel"}
execute as @a[tag=hasJetPack,tag=sneaking] if score @s jetpackBar matches 7..8 run title @s actionbar {"text":"§e[§a████████§7□□§e]§a 80% Fuel"}
execute as @a[tag=hasJetPack,tag=sneaking] if score @s jetpackBar matches 8..9 run title @s actionbar {"text":"§e[§a█████████§7□]§2 90% Fuel"}
execute as @a[tag=hasJetPack,tag=sneaking] if score @s jetpackBar matches 9..10 run title @s actionbar {"text":"§e[§a██████████§e]§2 100% Fuel"}