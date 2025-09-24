extends Node

const scene_coal_town = preload("res://coal_town_centre.tscn")
const scene_coal_town_mine = preload("res://coal_town_mine.tscn")

var spawn_door_tag
var scene_to_load


func go_to_level(level_tag, destination_tag):
	match level_tag:
		"coal_town_centre":
			scene_to_load = scene_coal_town
		"coal_town_mine":
			scene_to_load = scene_coal_town_mine
	
	if scene_to_load != null:
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed.bind(scene_to_load).call_deferred()
		
