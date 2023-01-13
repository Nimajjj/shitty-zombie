extends Node


var PC: CharacterBody2D = null; 

var MaxScore: int = 0;
var Score: int = 0;


func ScoreUp(amount: int) -> void:
	Score += amount;
	if (Score > MaxScore):
		MaxScore = Score;
