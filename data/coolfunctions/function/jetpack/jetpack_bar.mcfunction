# Decide who gets the actionbar this tick, then render it per player (bar_player.mcfunction).
# Shown while ascending, for 2s after a mode change, and while the tank is empty (as before).
tag @a remove cf.jetpack.showbar
tag @a[tag=cf.jetpack.has,tag=cf.jetpack.ascending] add cf.jetpack.showbar
tag @a[tag=cf.jetpack.has,scores={cf.jetpack.display=1..}] add cf.jetpack.showbar
tag @a[tag=cf.jetpack.has,scores={cf.jetpack.fuel=..0}] add cf.jetpack.showbar

execute as @a[tag=cf.jetpack.showbar] run function coolfunctions:jetpack/bar_player
