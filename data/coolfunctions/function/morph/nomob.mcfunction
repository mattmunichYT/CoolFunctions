tellraw @p[tag=morph] [{"text":"C","color":"#D5D576","bold":true},{"text":"o","color":"#AED991","bold":true},{"text":"o","color":"#86DEAB","bold":true},{"text":"l","color":"#73E0B8","bold":true},{"text":"F","color":"#5FE2C5","bold":true},{"text":"u","color":"#66E6AE","bold":true},{"text":"n","color":"#6DEA96","bold":true},{"text":"c","color":"#73ED7F","bold":true},{"text":"t","color":"#7AF167","bold":true},{"text":"i","color":"#7AF167","bold":true},{"text":"o","color":"#7AF167","bold":true},{"text":"n","color":"#7AF167","bold":true},{"text":"s","color":"#7AF167","bold":true},{"text":" >> ","bold":true,"color":"dark_gray"}, "§eNo entity found §7- §cYou'll be visible again in 10 seconds!"]
effect clear @p[tag=morph] invisibility
effect clear @p[tag=morph] instant_health
effect give @p[tag=morph] invisibility 11 2 true
effect give @p[tag=morph] instant_health 11 5 true
attribute @p[tag=morph] minecraft:max_health base set 20
tag @p[tag=morph] remove morph