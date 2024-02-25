extends Node2D

const WALLET_ITEM: Item = preload("res://Resources/Items/Wallet.item.tres")

func interact(player_inventory: Inventory) -> void:
	var selected_item = player_inventory.selected_item
	
	if selected_item && selected_item.name == "FishingRod":
		player_inventory.removeSelectedItem()
		player_inventory.insert(WALLET_ITEM)
