extends Node3D

var speed := 5
var random_y = 2.0
var SPAWN_TIME = 1.5
var obs_spawn_time = SPAWN_TIME

var score = 0

var obs_scene = preload("res://obstacle.tscn")
@onready var obstacle: AnimatableBody3D = $Obstacle
@onready var spawn_loc = obstacle.position

func _ready() -> void:
	update_score_ui()

func _process(delta: float) -> void:
	obs_spawn_time -= delta
	if obs_spawn_time <= 0:
		obs_spawn_time = SPAWN_TIME
		spawn_obstacle()

func spawn_obstacle():
	var new_obs = obs_scene.instantiate()
	new_obs.position = spawn_loc
	new_obs.position.y = randf_range(-random_y,random_y)
	new_obs.obstacle_passed.connect(_on_obstacle_obstacle_passed)
	for c in new_obs.get_children():
		c.position.y += new_obs.position.y
	add_child(new_obs)

func _physics_process(delta: float) -> void:
	for o in get_children():
		o.position.x -= speed * delta 

func _on_obstacle_obstacle_passed() -> void:
	score += 1
	update_score_ui()

@onready var score_ui: Label = %ScoreUI

func update_score_ui():
	score_ui.text = str(score)
