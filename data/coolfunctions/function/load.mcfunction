scoreboard objectives add useGrap minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add sneaking minecraft.custom:minecraft.sneak_time
scoreboard objectives add hasJetPack dummy
scoreboard objectives add jetpackFuel dummy
scoreboard objectives add jetpackMax dummy
scoreboard objectives add jetpackBar dummy
scoreboard objectives add jetpackTemp dummy
scoreboard objectives add jetpackConst dummy
scoreboard objectives add jetpackItemFuel dummy
team add noCollisions.COOLFUNCTIONS {"text":"Cool Function's no Collisions Team"}
team modify noCollisions.COOLFUNCTIONS collisionRule never
team modify noCollisions.COOLFUNCTIONS seeFriendlyInvisibles false
team modify noCollisions.COOLFUNCTIONS friendlyFire true
team modify noCollisions.COOLFUNCTIONS nametagVisibility never
scoreboard objectives add morphMobHealth dummy
tellraw @a[gamemode=creative] "§x§F§C§D§0§5§C§l[C§x§D§5§D§5§7§6§lo§x§A§E§D§9§9§1§lo§x§8§6§D§E§A§B§ll§x§5§F§E§2§C§5§lF§x§6§6§E§6§A§E§lu§x§6§D§E§A§9§6§ln§x§7§3§E§D§7§F§lc§x§7§A§F§1§6§7§lt§x§7§A§F§1§6§7§li§x§7§A§F§1§6§7§lo§x§7§A§F§1§6§7§ln§x§7§A§F§1§6§7§ls]§r §aData Pack loaded successfully!"
tellraw @a[gamemode=spectator] "§x§F§C§D§0§5§C§l[C§x§D§5§D§5§7§6§lo§x§A§E§D§9§9§1§lo§x§8§6§D§E§A§B§ll§x§5§F§E§2§C§5§lF§x§6§6§E§6§A§E§lu§x§6§D§E§A§9§6§ln§x§7§3§E§D§7§F§lc§x§7§A§F§1§6§7§lt§x§7§A§F§1§6§7§li§x§7§A§F§1§6§7§lo§x§7§A§F§1§6§7§ln§x§7§A§F§1§6§7§ls]§r §aData Pack loaded successfully!"

# constants for bar computation (1..10)
scoreboard players set const1 jetpackConst 1
scoreboard players set const2 jetpackConst 2
scoreboard players set const3 jetpackConst 3
scoreboard players set const4 jetpackConst 4
scoreboard players set const5 jetpackConst 5
scoreboard players set const6 jetpackConst 6
scoreboard players set const7 jetpackConst 7
scoreboard players set const8 jetpackConst 8
scoreboard players set const9 jetpackConst 9
scoreboard players set const10 jetpackConst 10