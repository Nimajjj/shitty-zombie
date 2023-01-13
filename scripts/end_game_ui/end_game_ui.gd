extends Control

signal play_again;

@onready var ScoreLabel = $ScoreLabel;


func _ready():
	update();
	
	
func update() -> void:
	ScoreLabel.text = "Score : {0}\nMax Score : {1}\n".format(
		[Global.Score, Global.MaxScore]
	);


func _on_button_pressed() -> void:
	emit_signal("play_again");
