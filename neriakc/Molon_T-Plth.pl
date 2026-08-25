sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Hey! What's up? If you want some real fun. go downstairs at the Maiden's Fancy."); }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("My dagger shall make quick work of you.");
  }
}

sub EVENT_SLAY {
  quest::say("How foolish! You were no threat to me!");
}

sub EVENT_DEATH_COMPLETE {
  quest::say("The Dead shall avenge my death!");
}

#END of FILE Zone:neriakc  ID:42040 -- Molon_T`Plth

