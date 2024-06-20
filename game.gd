extends Node3D

@onready var berd: CharacterBody3D = $Berd
@onready var game_over_splash: Control = $GameOverSplash

func _ready() -> void:
	game_over_splash.visible = false

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and game_over_splash.visible:
		_on_restart_button_pressed()

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_berd_death() -> void:
	game_over_splash.visible = true
