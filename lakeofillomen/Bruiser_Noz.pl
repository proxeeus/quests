#Quests covered in this file:
#Shaman Skull Quest 6

sub EVENT_SPAWN {
   quest::emote("is a battle-scarred lizard with arms the size of tree trunks. He approaches and speaks. You feel the lager-tinged breeze blast your skin. 'Stay out of this, Klok !! I didn't spend 30 seasons in the legion to be pestered by the likes of you!! Here I am, you little croak!! You want my skull? Come and get it!!'");
   quest::signalwith(85140, 50,0); #signal Klok_sargin to say something
}

sub EVENT_SIGNAL {
   quest::say("Ha!! Who dares to take what is Bruiser's!! I will make swamp mush out of them!!");
}
