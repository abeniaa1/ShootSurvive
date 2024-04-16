extends CanvasLayer

var HP = 0
var max_hp = 0
var eye = 0
onready var upgrades = get_parent().get_node("player2/upgrades_handler")
onready var cards = preload("res://scenes/card.tscn")

func _ready():
	HP = get_parent().get_node("player2").hp
	max_hp = HP
	for i in $HBOX.get_children():
		i.hide()

func upgrade():
	var card =  $Container
	card.show()
	for i in card.get_children():
		i.card(int(rand_range(1,6)))

func _process(_delta):
	HP = get_parent().get_node("player2").hp
	$HSlider.value = HP
	$HSlider.max_value = max_hp
	eye = Global.score
	$VSlider.value = eye
	$score.text = var2str(eye)
	

func map_value(original_value):
	return 1 - original_value / max_hp


func _on_HSlider_value_changed(value):
	$skull.material.set_shader_param('effectControl', map_value(HP))



func _physics_process(delta):
	if upgrades.gun:
		$HBOX/gun.show()
	if upgrades.shuriken:
		$HBOX/shuriken.show()
	if upgrades.electric:
		$HBOX/electric.show()
	if upgrades.bomb:
		$HBOX/bomb.show()
	if upgrades.scythe:
		$HBOX/scythe.show()
	if upgrades.knive:
		$HBOX/knife.show()

		
