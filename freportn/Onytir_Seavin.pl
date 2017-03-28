# Onytir Seavin story dialogue
# by Proxeeus.

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Hail, $name. Do you like [riddles]?");
	}
	if($text=~/yes i like riddles/i){
		quest::emote("chuckles. 'Well I don't have any riddles for you today. However I do have a [story] to tell about some adventures who were very adept at solving riddles.'");
	}
	if($text=~/story/i){
		quest::say("Not too long ago there were a group of adventurers, some were friends and some were not. These adventurers traveled far to meet with each other, and this rag-tag crew was thrown together, united for a [common goal].");
	}
	if($text=~/common goal/i){
		quest::emote("smiles. 'What other common goal do most people in this land share? The accumulation of wealth of course, that isn't to say they didn't serve a greater good, they helped all sorts in their travels, gnomes, dancing bixies, dragons, scarecrows, pixies, elves, nearly anything you can imagine. It was quite a sight to see, they were not the only [participants] in this grand adventure, however they were the ones who finished with the most to coin show for it.'");
	}
	if($text=~/participants/i){
		quest::say("As I said, there were all manner of participants, however our victors were, Livius Maximus, Moonglumm Riptear, Rhuigha Spirithealer, Littlun Bigheart, Jaras Loupgeist, Balshazzar Synapse, Ironking, Riverraine, Dolaf, Breezar and Wichy Wolfpup, Valthor Runefang, Niborris, and Rixma");
	}
}