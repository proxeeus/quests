#########################################################
# Marianna
# Zone:  Rathe Mountains
# Quest: Vambraces of Ro
# Author: Unknown
# Updated:  Andrew80k
#########################################################
sub EVENT_SAY { 
   if($text=~/Hail/i){
      quest::say("Rodcet Nife welcomes you into our noble camp.  I am the keeper of the [Vambraces of Ro].");
   }
   if($text=~/vambraces of ro/i){
      if($faction <=4){
         quest::say("The mold will be offered to you when you have performed a task for the Temple of Life.  The oceans near our home are host to a plague..  the plague sharks!!  They have been infected with a deadly malady which has been turning up in the Qeynos Hills.  Kill the sharks and bring me two of their rotten shark portions as proof.");
      } else {
         quest::say("Foolish person!! The word is out amongst the followers of the Prime Healer not to trust you."); 
      }
  }
}
sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount,12310=>2) && $faction <=4) {
      quest::say("You now own a mold for the Vambracers of Ro.  Go and ask Thomas of [Lord Searfire] for the final component.");  
      quest::summonitem(12300);
      quest::faction("280","1"); #Knights of Thunder
      quest::faction("221","-1"); # Bloodsabers
      quest::faction("341","1"); # Priests of Life
      quest::faction("262","1"); # Guards of Qeynos
      quest::faction("219","1"); # Antonius Bayle
   } 
   plugin::return_items(\%itemcount);
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Rodcet Nife!!  Give me strength to smite your foe!!");
  }
}

sub EVENT_DEATH_COMPLETE {
   quest::say("Your name has been stricken from the book of the Prime Healer!! I shall be avenged!");
}

#END of FILE Zone:rathemtn  ID:50114 -- Marianna
