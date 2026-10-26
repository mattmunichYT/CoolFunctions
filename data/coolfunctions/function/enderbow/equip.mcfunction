# as/at player holding an Ender Bow whose offhand is NOT the Ender Arrow
# 1. stash the real offhand item (if any)
execute if items entity @s weapon.offhand * run function coolfunctions:enderbow/stash
# 2. put the Ender Arrow in the offhand
item replace entity @s weapon.offhand with arrow[item_model="coolfunctions:ender_arrow",item_name=[{"color":"#1E14A6",text:"E"},{"color":"#321DAF",text:"n"},{"color":"#4626B8",text:"d"},{"color":"#5A2FC1",text:"e"},{"color":"#6E38CA",text:"r "},{"color":"#8341D3",text:"A"},{"color":"#974ADB",text:"r"},{"color":"#AB53E4",text:"r"},{"color":"#BF5CED",text:"o"},{"color":"#E76EFF",text:"w"}],custom_data={ender_arrow:true}] 1
tag @s add cf.enderMode
