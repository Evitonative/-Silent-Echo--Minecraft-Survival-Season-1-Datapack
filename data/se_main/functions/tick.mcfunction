#define team hc_afk Afk

#dimension tag
execute unless score #dim_disabled se_data matches 1 in minecraft:overworld positioned 0 0 0 as @a[distance=0..] run scoreboard players set @s se_data 0
execute unless score #dim_disabled se_data matches 1 in minecraft:the_nether positioned 0 0 0 as @a[distance=0..] run scoreboard players set @s se_data -1
execute unless score #dim_disabled se_data matches 1 in minecraft:the_end positioned 0 0 0 as @a[distance=0..] run scoreboard players set @s se_data 1

team join the_nether @a[team=!hc_afk,scores={se_data=-1}]
team join overworld @a[team=!hc_afk,scores={se_data=0}]
team join the_end @a[team=!hc_afk,scores={se_data=1}]
execute if score #dim_disabled se_data matches 1 run scoreboard players reset @a[team=!hc_afk] se_data
execute if score #dim_disabled se_data matches 1 run team leave @a[team=!hc_afk] 

#multiplayer sleep
scoreboard players reset #50players se_data
execute as @a[team=!hc_afk,team=!the_end,team=!the_nether] run scoreboard players add #50players se_data 1
scoreboard players operation #50players se_data /= #2 se_data
execute as @a at @s store result score @s sleep run data get entity @s SleepTimer
scoreboard players reset #playersInBed se_data
execute as @a[scores={sleep=1..}] run scoreboard players add #playersInBed se_data 1
execute if score #playersInBed se_data >= #50players se_data run weather clear 4800
execute if score #playersInBed se_data >= #50players se_data run time add 250

#player teleport
scoreboard players reset @a[scores={linked_players=0}] linked_calc
scoreboard players reset @a[scores={linked_players=0}] linked_players
execute as @a[scores={linked_players=1..}] run scoreboard players operation @s linked_calc = @s linked_players
execute as @r[scores={linked_players=1..},gamemode=spectator] at @s run function se_main:spec_tp

#hrs
execute as @a at @s run scoreboard players operation @s hrs_calc > @s hc_playTimeShow
execute as @a at @s run scoreboard players operation @s hrs_calc /= #60 se_data
execute as @a at @s run scoreboard players operation @s hrs > @s hrs_calc