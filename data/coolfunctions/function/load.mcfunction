scoreboard objectives add cf.sneaking minecraft.custom:minecraft.sneak_time
scoreboard objectives add cf.jetpack.fuel dummy
scoreboard objectives add cf.jetpack.fuel.max dummy
scoreboard objectives add cf.jetpack.bar dummy
scoreboard objectives add cf.jetpack.temp dummy
scoreboard objectives add cf.const dummy
scoreboard objectives add cf.playerY dummy
scoreboard objectives add cf.groundY dummy
scoreboard objectives add cf.heightAboveGround dummy

team add noCollisions.COOLFUNCTIONS {text:"Cool Function's no Collisions Team"}
team modify noCollisions.COOLFUNCTIONS collisionRule never
team modify noCollisions.COOLFUNCTIONS seeFriendlyInvisibles false
team modify noCollisions.COOLFUNCTIONS friendlyFire true
team modify noCollisions.COOLFUNCTIONS nametagVisibility never
scoreboard objectives add morphMobHealth dummy
tellraw @a[gamemode=creative] [{text:"C","color":"#D5D576","bold":true},{text:"o","color":"#AED991","bold":true},{text:"o","color":"#86DEAB","bold":true},{text:"l","color":"#73E0B8","bold":true},{text:"F","color":"#5FE2C5","bold":true},{text:"u","color":"#66E6AE","bold":true},{text:"n","color":"#6DEA96","bold":true},{text:"c","color":"#73ED7F","bold":true},{text:"t","color":"#7AF167","bold":true},{text:"i","color":"#7AF167","bold":true},{text:"o","color":"#7AF167","bold":true},{text:"n","color":"#7AF167","bold":true},{text:"s","color":"#7AF167","bold":true},{text:" >> ","bold":true,"color":"dark_gray"}, "§aData Pack loaded successfully!"]
tellraw @a[gamemode=spectator] [{text:"C","color":"#D5D576","bold":true},{text:"o","color":"#AED991","bold":true},{text:"o","color":"#86DEAB","bold":true},{text:"l","color":"#73E0B8","bold":true},{text:"F","color":"#5FE2C5","bold":true},{text:"u","color":"#66E6AE","bold":true},{text:"n","color":"#6DEA96","bold":true},{text:"c","color":"#73ED7F","bold":true},{text:"t","color":"#7AF167","bold":true},{text:"i","color":"#7AF167","bold":true},{text:"o","color":"#7AF167","bold":true},{text:"n","color":"#7AF167","bold":true},{text:"s","color":"#7AF167","bold":true},{text:" >> ","bold":true,"color":"dark_gray"}, "§aData Pack loaded successfully!"]


# constants for bar computation (1..10)
scoreboard players set const1 cf.const 1
scoreboard players set const2 cf.const 2
scoreboard players set const3 cf.const 3
scoreboard players set const4 cf.const 4
scoreboard players set const5 cf.const 5
scoreboard players set const6 cf.const 6
scoreboard players set const7 cf.const 7
scoreboard players set const8 cf.const 8
scoreboard players set const9 cf.const 9
scoreboard players set const10 cf.const 10