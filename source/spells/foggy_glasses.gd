extends TileModifierSpell

const letter_transformations={
    "q":"p",
    "p":"q",
    "d":"b",
    "b":"d",
    "m":"n",
    "n":"m",
    "i":"j",
    "j":"i"
}

#func set_status_tooltips():
 #status_tooltips = [TileStatus.DEFAULT]


func apply_to_tile(tile: Tile, _real_tile: Tile, is_preview: bool, _is_preview_update: bool):
 if tile.face=="/":
    var slashed_faces=tile.tile_face.slashed_faces
    for i in slashed_faces.size():
        if slashed_faces[i] in letter_transformations:
            slashed_faces[i]=letter_transformations[slashed_faces[i]]
    tile.update()
 else:
    tile.set_face(letter_transformations[tile.face])

 if not is_preview:
  tile.add_poofcloud(tile.get_color())


func is_tile_selectable(tile: Tile):
 return (tile.face in letter_transformations or (tile.face=="/" and Array(tile.tile_face.slashed_faces).any(func(face:String)->bool:return face in letter_transformations))) and not tile.has_status(TileStatus.CAPITAL)
