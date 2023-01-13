extends Node2D

@export var damage:  float = 10.0;
@export var fire_rate:  float = 100.0;

@onready var TimerNode: Timer = $Timer; 
@onready var BulletSpawn: Node2D = $BulletSpawn;
@onready var ShotEffect: Node2D = $ShotEffect/GPUParticles2D;

@onready var Bullet: PackedScene = preload("res://scenes/bullet/bullet.tscn");


func _ready():
	TimerNode.wait_time = 10.0 / fire_rate;


func _process(_delta):
	look_at(get_global_mouse_position());
	
	if (Input.is_action_just_pressed("shoot")):
		_on_timer_timeout();
		TimerNode.start();
	elif (Input.is_action_just_released("shoot")):
		TimerNode.stop();


func _on_timer_timeout() -> void:
	ShotEffect.emitting = true;
	var bullet = Bullet.instantiate();
	get_tree().get_root().add_child(bullet);
	
	bullet.shoot(get_global_mouse_position(), BulletSpawn.global_position);
	
	
