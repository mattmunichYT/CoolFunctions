# Get ground Y under the player using the motion_blocking heightmap (fast, no raycasting)
execute as @a[tag=cf.jetpack.has] at @s positioned over motion_blocking_no_leaves run summon marker ~ ~ ~ {Tags:["groundMarker"]}
execute as @a[tag=cf.jetpack.has] store result score @s cf.groundY run data get entity @e[type=marker,tag=groundMarker,limit=1,sort=nearest] Pos[1]
execute as @a[tag=cf.jetpack.has] store result score @s cf.playerY run data get entity @s Pos[1]
kill @e[type=marker,tag=groundMarker]

scoreboard players operation @s cf.heightAboveGround = @s cf.playerY
scoreboard players operation @s cf.heightAboveGround -= @s cf.groundY