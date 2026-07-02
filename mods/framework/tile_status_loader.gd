class_name TileStatusLoader
extends RefCounted


static var added_statuses:Array[String]=[]
static var plastic_textures:Dictionary[String,Texture2D]={}
static var wood_textures:Dictionary[String,Array]={}
static var word_affects:Dictionary[String,Callable]={}
static var board_affects:Dictionary[String,Callable]={}
static var trigger_funcs:Array[Callable]=[]
## Color of the letter on the tile
static var tile_face_color:Dictionary[String,Array]={}
## Color of the value on the tile
static var tile_value_color:Dictionary[String,Array]={}
static var tile_value_multiplier_functions:Dictionary[String,Callable]={}

## [b]Add a new tile affect[/b][br]
## [code]wood_texture[/code] can either be a [Texture2D] or an [Array] or [Texture2D]s[br]
## [code]word_affect[/code] and [code]board_affect[/code] is a function that will called for every a tile with the affect in the word or board respecively. The instance of the status on the tile and the word builder will be passed as arguments in that order to the function. These should be used to invalidate the word or add intents, not apply any affects exept for changes in damage, defence, or healing[br]
## [code]trigger_func[/code] will be called when a word is submitted. This the where you should search you tiles with your status and apply your status' affect should apply. The tile board will be passed as an argument to this function.
static func add_tile_status(id:String,plastic_texture:Texture2D,wood_texture,word_affect=null,board_affect=null,trigger_func=null):
	added_statuses.append(id)
	plastic_textures[id]=plastic_texture
	if wood_texture is Texture2D:
		wood_textures[id]=[wood_texture]
	elif wood_texture is Array:
		wood_textures[id]=[wood_texture]
	else:
		push_error("wood_texture for tile_status "+id+" must be a Texture2D or an Array for Texture2Ds")
	if word_affect is Callable and word_affect!=null:
		word_affects[id]=word_affect
	if board_affect is Callable and board_affect!=null:
		board_affects[id]=board_affect
	if trigger_func is Callable and trigger_func!=null:
		trigger_funcs.append(trigger_func)
