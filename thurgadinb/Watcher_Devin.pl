sub EVENT_SAY { 
if($text=~/Hail/i){
quest::emote("glances towards you, looking you up and down then continues about their duty. It is apparent to you that this guard does not wish to speak with you."); }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Invaders!!  To arms, my fellow guardsmen!  Defend the Keep!  Protect the Dain!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Defeated by the likes of you!? Avenge me, brothers!");
}

#END of FILE Zone:thurgadinb  ID:129054 -- Watcher_Devin

