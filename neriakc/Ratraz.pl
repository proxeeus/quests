sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Spend your money or get out! This ain't no pansy social club!"); }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Come and feel the blade of the Dark Bargainers.");
  }
}

sub EVENT_SLAY {
  quest::say("Let that be a lesson to all!  Never cross a Dark Bargainer!");
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Unngh.. Why you kill me?? Probably for dumb bracers guard give to me. Dey not even Ratraz's.. You now cross da Dark Bargainers and all Neriak be gettin' revenge for Ratraz.");
}

#END of FILE Zone:neriakc  ID:42053 -- Ratraz

