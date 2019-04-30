extends Node

var TILESET_TEST_WALL
var TILESET_TEST_FLOOR
var TILESET_TEST_WATER

var DIALOGUE_VIGNETTE
var DIALOGUE_BACKGROUND_WIDE

var PORTRAIT_TEST_1
var PORTRAIT_TEST_2

var STAR_GOLD
var STAR_GREY

var FLAG

func _ready():
	TILESET_TEST_WALL = [preload("res://assets/images/TILESET_TEST/0-0-0.png"),
						preload("res://assets/images/TILESET_TEST/0-0-1.png"),
						preload("res://assets/images/TILESET_TEST/0-0-2.png"),
						preload("res://assets/images/TILESET_TEST/0-0-3.png"),
						preload("res://assets/images/TILESET_TEST/0-0-4.png"),
						preload("res://assets/images/TILESET_TEST/0-0-5.png"),
						preload("res://assets/images/TILESET_TEST/0-0-6.png"),
						preload("res://assets/images/TILESET_TEST/0-0-7.png"),
						preload("res://assets/images/TILESET_TEST/0-0-8.png"),
						preload("res://assets/images/TILESET_TEST/0-0-9.png"),
						preload("res://assets/images/TILESET_TEST/0-0-10.png"),
						preload("res://assets/images/TILESET_TEST/0-0-11.png"),
						preload("res://assets/images/TILESET_TEST/0-0-12.png"),
						preload("res://assets/images/TILESET_TEST/0-0-13.png"),
						preload("res://assets/images/TILESET_TEST/0-0-14.png"),
						preload("res://assets/images/TILESET_TEST/0-0-15.png"),
						preload("res://assets/images/TILESET_TEST/0-0-16.png"),
						preload("res://assets/images/TILESET_TEST/0-0-17.png"),
						preload("res://assets/images/TILESET_TEST/0-0-18.png"),
						preload("res://assets/images/TILESET_TEST/0-0-19.png"),
						preload("res://assets/images/TILESET_TEST/0-0-20.png"),
						preload("res://assets/images/TILESET_TEST/0-0-21.png"),
						preload("res://assets/images/TILESET_TEST/0-0-22.png"),
						preload("res://assets/images/TILESET_TEST/0-0-23.png"),
						preload("res://assets/images/TILESET_TEST/0-0-24.png"),
						preload("res://assets/images/TILESET_TEST/0-0-25.png"),
						preload("res://assets/images/TILESET_TEST/0-0-26.png"),
						preload("res://assets/images/TILESET_TEST/0-0-27.png"),
						preload("res://assets/images/TILESET_TEST/0-0-28.png"),
						preload("res://assets/images/TILESET_TEST/0-0-29.png"),
						preload("res://assets/images/TILESET_TEST/0-0-30.png"),
						preload("res://assets/images/TILESET_TEST/0-0-31.png"),
						preload("res://assets/images/TILESET_TEST/0-0-32.png"),
						preload("res://assets/images/TILESET_TEST/0-0-33.png"),
						preload("res://assets/images/TILESET_TEST/0-0-34.png"),
						preload("res://assets/images/TILESET_TEST/0-0-35.png"),
						preload("res://assets/images/TILESET_TEST/0-0-36.png"),
						preload("res://assets/images/TILESET_TEST/0-0-37.png"),
						preload("res://assets/images/TILESET_TEST/0-0-38.png"),
						preload("res://assets/images/TILESET_TEST/0-0-39.png"),
						preload("res://assets/images/TILESET_TEST/0-0-40.png"),
						preload("res://assets/images/TILESET_TEST/0-0-41.png"),
						preload("res://assets/images/TILESET_TEST/0-0-42.png"),
						preload("res://assets/images/TILESET_TEST/0-0-43.png"),
						preload("res://assets/images/TILESET_TEST/0-0-44.png"),
						preload("res://assets/images/TILESET_TEST/0-0-45.png"),
						preload("res://assets/images/TILESET_TEST/0-0-46.png"),
						preload("res://assets/images/TILESET_TEST/0-0-47.png"),
						preload("res://assets/images/TILESET_TEST/0-0-48.png"),
						preload("res://assets/images/TILESET_TEST/0-0-49.png"),
						preload("res://assets/images/TILESET_TEST/0-0-50.png"),
						preload("res://assets/images/TILESET_TEST/0-0-51.png"),
						preload("res://assets/images/TILESET_TEST/0-0-52.png")]
		
	TILESET_TEST_FLOOR = [preload("res://assets/images/TILESET_TEST/0-1-0.png"),
						preload("res://assets/images/TILESET_TEST/0-1-1.png"),
						preload("res://assets/images/TILESET_TEST/0-1-2.png"),
						preload("res://assets/images/TILESET_TEST/0-1-3.png"),
						preload("res://assets/images/TILESET_TEST/0-1-4.png"),
						preload("res://assets/images/TILESET_TEST/0-1-5.png"),
						preload("res://assets/images/TILESET_TEST/0-1-6.png"),
						preload("res://assets/images/TILESET_TEST/0-1-7.png"),
						preload("res://assets/images/TILESET_TEST/0-1-8.png"),
						preload("res://assets/images/TILESET_TEST/0-1-9.png"),
						preload("res://assets/images/TILESET_TEST/0-1-10.png"),
						preload("res://assets/images/TILESET_TEST/0-1-11.png"),
						preload("res://assets/images/TILESET_TEST/0-1-12.png"),
						preload("res://assets/images/TILESET_TEST/0-1-13.png"),
						preload("res://assets/images/TILESET_TEST/0-1-14.png"),
						preload("res://assets/images/TILESET_TEST/0-1-15.png")]
						
	TILESET_TEST_WATER = [preload("res://assets/images/TILESET_TEST/0-2-0.png"),
				preload("res://assets/images/TILESET_TEST/0-2-1.png"),
				preload("res://assets/images/TILESET_TEST/0-2-2.png"),
				preload("res://assets/images/TILESET_TEST/0-2-3.png"),
				preload("res://assets/images/TILESET_TEST/0-2-4.png"),
				preload("res://assets/images/TILESET_TEST/0-2-5.png"),
				preload("res://assets/images/TILESET_TEST/0-2-6.png"),
				preload("res://assets/images/TILESET_TEST/0-2-7.png"),
				preload("res://assets/images/TILESET_TEST/0-2-8.png"),
				preload("res://assets/images/TILESET_TEST/0-2-9.png"),
				preload("res://assets/images/TILESET_TEST/0-2-10.png"),
				preload("res://assets/images/TILESET_TEST/0-2-11.png"),
				preload("res://assets/images/TILESET_TEST/0-2-12.png"),
				preload("res://assets/images/TILESET_TEST/0-2-13.png"),
				preload("res://assets/images/TILESET_TEST/0-2-14.png"),
				preload("res://assets/images/TILESET_TEST/0-2-15.png"),
				preload("res://assets/images/TILESET_TEST/0-2-16.png"),
				preload("res://assets/images/TILESET_TEST/0-2-17.png"),
				preload("res://assets/images/TILESET_TEST/0-2-18.png"),
				preload("res://assets/images/TILESET_TEST/0-2-19.png"),
				preload("res://assets/images/TILESET_TEST/0-2-20.png"),
				preload("res://assets/images/TILESET_TEST/0-2-21.png"),
				preload("res://assets/images/TILESET_TEST/0-2-22.png"),
				preload("res://assets/images/TILESET_TEST/0-2-23.png"),
				preload("res://assets/images/TILESET_TEST/0-2-24.png"),
				preload("res://assets/images/TILESET_TEST/0-2-25.png"),
				preload("res://assets/images/TILESET_TEST/0-2-26.png"),
				preload("res://assets/images/TILESET_TEST/0-2-27.png"),
				preload("res://assets/images/TILESET_TEST/0-2-28.png"),
				preload("res://assets/images/TILESET_TEST/0-2-29.png"),
				preload("res://assets/images/TILESET_TEST/0-2-30.png"),
				preload("res://assets/images/TILESET_TEST/0-2-31.png"),
				preload("res://assets/images/TILESET_TEST/0-2-32.png"),
				preload("res://assets/images/TILESET_TEST/0-2-33.png"),
				preload("res://assets/images/TILESET_TEST/0-2-34.png"),
				preload("res://assets/images/TILESET_TEST/0-2-35.png"),
				preload("res://assets/images/TILESET_TEST/0-2-36.png"),
				preload("res://assets/images/TILESET_TEST/0-2-37.png"),
				preload("res://assets/images/TILESET_TEST/0-2-38.png"),
				preload("res://assets/images/TILESET_TEST/0-2-39.png"),
				preload("res://assets/images/TILESET_TEST/0-2-40.png"),
				preload("res://assets/images/TILESET_TEST/0-2-41.png"),
				preload("res://assets/images/TILESET_TEST/0-2-42.png"),
				preload("res://assets/images/TILESET_TEST/0-2-43.png"),
				preload("res://assets/images/TILESET_TEST/0-2-44.png"),
				preload("res://assets/images/TILESET_TEST/0-2-45.png"),
				preload("res://assets/images/TILESET_TEST/0-2-46.png")]
				
	DIALOGUE_VIGNETTE = preload("res://assets/images/dialogue/vignette.png")
	DIALOGUE_BACKGROUND_WIDE = preload("res://assets/images/dialogue/widebg.png")
	
	PORTRAIT_TEST_1 = preload("res://assets/images/portraits/defaultprofile1.png")
	PORTRAIT_TEST_2 = preload("res://assets/images/portraits/defaultprofile2.png")
	
	STAR_GOLD = preload("res://assets/images/levelselect/goldstar.png")
	STAR_GREY = preload("res://assets/images/levelselect/greystar.png")
	
	FLAG = preload("res://assets/images/levelselect/flaganim.png")