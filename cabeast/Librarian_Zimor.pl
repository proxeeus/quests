#Librarian Zimor is for the Greenmist quest and administers the eighth and final quest in the line.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Hail, citizen, I hope that you are here to assist. We are gathering Crusaders to make an assault on the Libraries of Chardok. The slave creations have thrived in their sanctuary for too long. The tomes and texts they have stolen to fill their library belong us. They are even rumored to have a text on the Sacred Khukri of Rile, the Greenmist. If you see such a tome, you must bring it to me immediately. May Cazic-Thule guide you!");
  }
}

sub EVENT_ITEM {
  if(($itemcount{3887} == 1)){ #Crusaders of Greenmist (Greenmist Quest 8/8)
  quest::emote("looks disturbed as he examines the book. His hands tremble as he mouths the words on the ancient parchment pages. 'This book may alter the reality you see before you, $name,' the scholar says as he continues to read the tome. 'The information that has been waiting in this book may have been brought to us by your hand, but your fate has obviously been chosen by our Lord. Our mystics have conveyed a new vision to us in this most recent season. Please take this note to Hierophant Oxyn, while I continue to translate this tome.' The Librarian hands you a note and turns his attention back to the book.");
  quest::summonitem(3895);
  quest::exp(5000);
  quest::ding();
  quest::faction(442,20);
  quest::faction(441,10);
 }
 if(($itemcount{3893} == 1)){ #Crusaders of Greenmist (Greenmist Quest 8/8)
  quest::say("I am very glad you have returned. Your discovery of the tynnonium is extraordinary! This Sarnak tome has been an incredible source of information. It appears that they have been studying the Greenmist for some time. I'm sure they sought it as nothing more than a trinket to be collected. Their shortsightedness will be their eventual undoing. I have compiled a book of notes that will aid you in your quest for the Greenmist. Please take care to keep this information out of the grasp of our enemies.");
  quest::summonitem(18320);
  quest::exp(5000);
  quest::ding();
  quest::faction(442,20);
  quest::faction(441,10);
 }
 plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE 
{
	quest::say("You are nothing compared to the dark power of the Brood of Kotiz.");
}

sub EVENT_SLAY
{
	quest::say("You are nothing compared to the dark power of the Brood of Kotiz.");
}

sub EVENT_COMBAT {
   if($combat_state == 1) {
   quest::say("Begin your prayers, young simpleton!!  Your time on this realm has expired.");
   }
}

#Submitted by: Jim Mills
