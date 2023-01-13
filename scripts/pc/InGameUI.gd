extends Control

@onready var KillLabel = $KillLabel;
@onready var MaxKillLabel = $MaxKillLabel;


func _process(_delta):
	KillLabel.text = "Score : {0}".format([Global.Score]);
	MaxKillLabel.text = "Max Score : {0}".format([Global.MaxScore]);
