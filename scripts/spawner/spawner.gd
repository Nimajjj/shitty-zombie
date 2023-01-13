extends Node2D


const MIN_DIST = Vector2(1500.0, 1000.0);
const RANDOM: int = 100;

@onready var Zombie: PackedScene = preload("res://scenes/zombie/zombie.tscn");


func _on_timer_timeout():
	if (Global.PC == null):
		return;
	
	var zombie: StaticBody2D = Zombie.instantiate();
	add_child(zombie);
	
	var pos: Vector2 = Global.PC.global_position;
	pos += Vector2(
		(randi() % RANDOM + MIN_DIST.x) * (1 if (randi() % 100 < 50) else -1),
		(randi() % RANDOM + MIN_DIST.y) * (1 if (randi() % 100 < 50) else -1)
	);
	zombie.position = pos;
	
	if ($Timer.wait_time > 0.37):
		$Timer.wait_time -= 0.01
	
