sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Excuse me, strange one, for my rudeness, but I must finish collecting the shellfish for tonight's feast in time for them to be properly prepared.");
  }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("The might of the oceans is at my command, and with it I shall end your existence, strange one!!");
  }
}

#END of FILE Zone:cobaltscar  ID:117037 -- a_shellfish_collector 

