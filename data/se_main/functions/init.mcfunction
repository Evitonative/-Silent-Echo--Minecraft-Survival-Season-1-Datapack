scoreboard objectives add se_data dummy
scoreboard players set #2 se_data 2
scoreboard players set #60 se_data 60
scoreboard objectives add sleep dummy
scoreboard objectives add hrs_calc dummy "Spielstunden"
scoreboard objectives add hrs dummy "Spielstunden"
scoreboard objectives add hc_playTimeShow dummy

scoreboard objectives add linked_players dummy
scoreboard objectives add linked_calc dummy

team add the_nether
team modify the_nether color dark_red
team modify the_nether seeFriendlyInvisibles false
team add overworld
team modify overworld color green
team modify overworld seeFriendlyInvisibles false
team add the_end
team modify the_end color dark_purple
team modify the_end seeFriendlyInvisibles false