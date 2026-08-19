tellraw @p[tag=morph] [{text:"C","color":"#D5D576","bold":true},{text:"o","color":"#AED991","bold":true},{text:"o","color":"#86DEAB","bold":true},{text:"l","color":"#73E0B8","bold":true},{text:"F","color":"#5FE2C5","bold":true},{text:"u","color":"#66E6AE","bold":true},{text:"n","color":"#6DEA96","bold":true},{text:"c","color":"#73ED7F","bold":true},{text:"t","color":"#7AF167","bold":true},{text:"i","color":"#7AF167","bold":true},{text:"o","color":"#7AF167","bold":true},{text:"n","color":"#7AF167","bold":true},{text:"s","color":"#7AF167","bold":true},{text:" >> ","bold":true,"color":"dark_gray"}, "§cAppearance reset to player"]
kill @e[type=!player,tag=morphmob]
execute at @p[tag=morphmob] run team leave @e[tag=morphmob,limit=1,distance=..2,sort=nearest] 
team leave @p[tag=morph]
effect clear @p[tag=morph] invisibility
effect clear @p[tag=morph] instant_health
effect give @p[tag=morph] instant_health 11 5 true
attribute @p[tag=morph] minecraft:max_health base set 20
tag @p[tag=morph] remove morph