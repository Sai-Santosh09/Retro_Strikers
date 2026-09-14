class_name UI extends CanvasLayer

@onready var flag_textures : Array[ TextureRect ] = [ %HomeFlagTexture, %AwayFlagTexture ]
@onready var score_label: Label = %ScoreLabel
@onready var player_label: Label = %PlayerLabel
@onready var time_label: Label = %TimeLabel


func _ready() -> void:
	update_score()
	update_flags()


func update_score() -> void:
	score_label.text = ScoreHelper.get_score_text( GameManager.score )


func update_flags() -> void:
	for i in flag_textures.size():
		flag_textures[i].texture
