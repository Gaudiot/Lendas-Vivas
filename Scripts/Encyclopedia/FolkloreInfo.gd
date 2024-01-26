extends Panel

@onready var folklore_image = $FolkloreImage
@onready var folklore_name = $FolkloreName
@onready var folklore_info_text = $FolkloreInfoText

func _on_book_page_turned(folklore: FolkloreInfo):
	folklore_image.texture = folklore.folklore_image
	folklore_name.text = folklore.folklore_name
	folklore_info_text.text = folklore.folklore_details
