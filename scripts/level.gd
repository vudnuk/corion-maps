extends Node2D

func _ready() -> void:
	if NavigationManager.spawn_door_tag != null:
		
func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
