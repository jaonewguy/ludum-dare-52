extends Node

var g_player_position setget set_player_position, get_player_position

func set_player_position(pos):
    g_player_position = pos
    
func get_player_position():
    return g_player_position
