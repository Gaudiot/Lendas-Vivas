extends Panel

@onready var folklore_image: TextureRect = %FolkloreImage
@onready var folklore_name: Label = %FolkloreName
@onready var folklore_info_text: RichTextLabel = %FolkloreInfoText

func _on_book_page_turned(folklore: FolkloreInfo):
	if folklore.folklore_image:
		folklore_image.texture = folklore.folklore_image
	else:
		folklore_image.texture = preload("res://Assets/Icons/Question.png")
		
	if folklore.folklore_name.length() > 12:
		folklore_info_text.size.y = 320
	else:
		folklore_info_text.size.y = 410
		
	folklore_name.text = folklore.folklore_name
	folklore_info_text.text = folklore.folklore_details
