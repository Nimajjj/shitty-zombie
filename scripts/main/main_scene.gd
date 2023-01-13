extends Node2D


@onready var PC = preload("res://scenes/pc/pc.tscn");
@onready var Spawner = preload("res://scenes/spawner/spawner.tscn");
@onready var EndGameUI = preload("res://scenes/end_game_ui/end_game_ui.tscn");

var pc: CharacterBody2D = null;
var spawner: Node2D = null;
var end_game_ui: Control = null;


func _ready():
	# random seed
	seed(69420); 
	
	end_game_ui = EndGameUI.instantiate();
	end_game_ui.connect("play_again", Callable(self, "_start_game"));
	add_child(end_game_ui);
	
	_start_game();
	

func _start_game() -> void:
	end_game_ui.visible = false;
	
	Global.Score = 0;
	
	pc = PC.instantiate();
	pc.connect("dead", Callable(self, "_on_dead"));
	add_child(pc);
	Global.PC = pc;
	
	spawner = Spawner.instantiate();
	add_child(spawner);


func _on_dead() -> void:
	spawner.queue_free();
	pc.queue_free();
	
	Global.PC = null;
	end_game_ui.visible = true;
	end_game_ui.update();
