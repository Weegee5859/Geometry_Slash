extends Node2D

var players: Array[CharacterBody2D]

func addPlayer(player):
	if player in players: return
	players.append(player)
	
	for i in players:
		print(player)
