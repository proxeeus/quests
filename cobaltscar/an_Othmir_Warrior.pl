sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Welcome strange one! I am on watch duty so I'm afraid I have not the time to converse. Perhaps when my shift is over we can exchange words over a bowl of spicy clam chowder.");
  }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("The might of the oceans is at my command, and with it I shall end your existence, strange one!!");
  }
}

#END of FILE Zone:cobaltscar  ID:117013 -- an_Othmir_warrior 

