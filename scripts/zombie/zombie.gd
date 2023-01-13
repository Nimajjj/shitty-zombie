extends StaticBody2D

@export var health: float = 100;
var speed: float = 350.0;

func _ready():
	modulate = Color(randf(), randf(), randf());
	speed = randi() % 300 + 300;
	health = randi() % 50 + 250;
	$ProgressBar.max_value = health;
	$ProgressBar.value = health;

func _physics_process(delta):
	if (Global.PC == null):
		return;
		
	var _direction = (Global.PC.global_position - global_position).normalized();
	var _velocity = _direction * speed * delta;
	
	position += _velocity;
	

func take_damage(dmg: float) -> void:
	health -= dmg;
	
	if (health <= 0):
		Global.ScoreUp(1);
		queue_free();
	
	$ProgressBar.value = health;
	$ProgressBar.visible = true;
