extends CharacterBody2D

signal dead;

const MAX_SPEED: float = 650.0;
const ACCELERATION: float = 0.25;
const FRICTION: float = 0.15;

@export var health: float = 100;

var in_contact: Array = [];

@onready var AnimPlayer: AnimationPlayer = $AnimationPlayer;
@onready var Camera: Camera2D = $Camera2D;
@onready var HealthBar: ProgressBar = $Camera2D/InGameUI/HealthProgressBar;


func _ready():
	Camera.current = true;


func _physics_process(_delta):
	var direction = _get_direction();
	
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * MAX_SPEED, ACCELERATION);
		AnimPlayer.play("walk");
	else:
		velocity = lerp(velocity, Vector2.ZERO, FRICTION);
		AnimPlayer.stop();
	
	move_and_slide();


func _get_direction() -> Vector2:
	var d = Vector2.ZERO;
	
	d.x = Input.get_action_strength("right") - Input.get_action_strength("left");
	d.y = Input.get_action_strength("down") - Input.get_action_strength("up");
	
	return d;
	


func _on_hurt_box_body_entered(body) -> void:
	in_contact.push_back(body);


func _on_hurt_box_body_exited(body) -> void:
	in_contact.erase(body);


func _on_timer_timeout() -> void:
	for body in in_contact:
		if (body.is_in_group("enemies")):
			health -= 9;
			HealthBar.value = health;
			
			if (health <= 0):
				emit_signal("dead");
