#########################################################
# Trudo Frugrin (ID:57059)
# Zone:   Lesser Faydark (lfaydark)
# Quest:  Telescope Lenses
# Author: a_sewer_rat
#########################################################

sub EVENT_SAY {
   if($text=~/Hail/i){
      quest::say("What. what?!! I am quite busy here. I have studies to complete and charts to make!");
   }
   if($text=~/lens/i){
      quest::say("Yes, of course. Here you are. Now be off.");
      quest::summonitem(13275); #telescope lens [trudo's lens]
   }
}

sub EVENT_COMBAT {
   if($combat_state == 1) {
      quest::say("The power of the Eldritch Collective shall put an end to your vile life.");
   }
}

sub EVENT_DEATH_COMPLETE {
   quest::say("The entire Eldritch Collective shall feel the vibrations of my passing.  They will know of your foul deed.");
}

#END of FILE Zone:lfaydark  ID:57059 -- Trudo_Frugrin
