sub EVENT_SAY { 
    if($text=~/Hail/i){
    quest::say("Hail, good citizen! You are safe when you are near a sentinel of the High Guard. Feel free to rest and recuperate."); 
    }
}


sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Prepare to die, infidel!!");
  }
}

