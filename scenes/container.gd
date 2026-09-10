class_name ActorsContainer extends Node2D

const PLAYER_PREFAB := preload( "res://scenes/characters/Player.tscn" )

@export var ball : Ball
@export var goal_left : Goal
@export var goal_right : Goal
@export var team_left : String
@export var team_right : String

@onready var spawns: Node2D = %Spawns

var squad_left : Array[ Player ] = []
var squad_right : Array[ Player ] = []

func _ready() -> void:
	squad_left = spawn_players( team_left, goal_left )
	spawns.scale.x = -1
	squad_right = spawn_players( team_right, goal_right )
	
	var player : Player = get_children().filter(func(p) : return p is Player)[4]
	player.control_scheme = Player.ControlScheme.P1
	player.set_control_texture()


func spawn_players( country : String, goal : Goal ) -> Array[ Player ]:
	var player_nodes : Array[ Player ] = []
	var players := DataLoader.get_squad( country )
	var target_goal := goal_right if goal == goal_left else goal_left
	for i in players.size():
		var player_position := spawns.get_child( i ).global_position as Vector2
		var player_data := players[ i ] as PlayerResource
		var player := spawn_player( player_position, goal, target_goal, player_data, country )
		player_nodes.append( player )
		add_child( player )
	return player_nodes


func spawn_player( player_position : Vector2, goal : Goal, target_goal : Goal, player_data : PlayerResource, country : String ) -> Player:
	var player := PLAYER_PREFAB.instantiate()
	player.initialize( player_position, ball, goal , target_goal, player_data, country )
	return player


func set_on_duty_weights() -> void:
	for squad in [ squad_right, squad_left ]:
		var cpu_players : Array[ Player ] = squad.filter(
			func( p : Player ) : return p.control_scheme == Player.ControlScheme.CPU and p.role != Player.Role.GOALIE
		)
		cpu_players.sort_custom( func( p1 : Player, p2 : Player ):
			return p1.spawn_position.distance_squared_to( ball.position ) < p2.spawn_position.distance_squared_to( ball.position ) 
			)
		
