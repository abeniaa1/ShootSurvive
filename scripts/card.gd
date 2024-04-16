extends Button

var bomb_png = load("res://resouce/icons/png/bomb.png")
var ele_png = load("res://resouce/icons/png/electric.png")
var kni_png = load("res://resouce/icons/png/knife.png")
var gun_png = load("res://resouce/icons/png/gun.png")
var shu_png = load("res://resouce/icons/png/suri.png")
var scy_png = load("res://resouce/icons/png/syth.png")
var vi = 0

func _ready():
	$AnimatedSprite.frame = 0
	$AnimatedSprite.playing = false

func card(type):
	var tex = $TextureRect
	var name = $Label
	var level = $nums
	if type <7:
		match type:
			1:
				level.frame = type
				tex.texture = bomb_png
				name.text = "bomb"
				
			2:
				name.text = "Lightning"
				tex.texture = ele_png
				level.frame = type
			3:
				name.text = "knives"
				tex.texture = kni_png
				level.frame = type
			4:
				name.text = "gun"
				tex.texture = gun_png
				level.frame = type
			5:
				name.text = "scythe"
				tex.texture = scy_png
				level.frame = type
			6: 
				name.text = "shuriken"
				tex.texture = shu_png
				level.frame = type





func _on_CARD_pressed():
	$AnimatedSprite.play("default")
	$AnimatedSprite.playing = true





func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.hide()
