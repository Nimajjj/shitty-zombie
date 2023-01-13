extends Area2D

var direction = Vector2()
var speed: float = 2500.0
var damage: float = 35.0;


func _physics_process(delta):
	# Equivalent of move and slide for non CharacterBody node :
	position += direction * speed * delta


func shoot(aim_position: Vector2, gun_position: Vector2) -> void:
	global_position = gun_position;
	direction = (aim_position - gun_position).normalized();
	rotation = direction.angle();


func _on_area_entered(area) -> void:
	if (area.get_parent().is_in_group("enemies")):
		area.take_damage(damage);
	queue_free();
