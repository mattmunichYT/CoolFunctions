gamerule sendCommandFeedback false
scoreboard objectives add useGrap minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add sneaking minecraft.custom:minecraft.sneak_time
scoreboard objectives add hasJetPack dummy
team add noCollisions.COOLFUNCTIONS {"text":"Cool Function's no Collisions Team"}
team modify noCollisions.COOLFUNCTIONS collisionRule never
team modify noCollisions.COOLFUNCTIONS seeFriendlyInvisibles false
team modify noCollisions.COOLFUNCTIONS friendlyFire true
team modify noCollisions.COOLFUNCTIONS nametagVisibility never
scoreboard objectives add morphMobHealth dummy