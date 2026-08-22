################################
# NPC: Ronn_Castekin.pl
# Zone: Qcat
# By Andrew80k

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Bow to Bertoxxulous!...  Argh... Kill me...  Please...");
  }
}

sub EVENT_SLAY {
  quest::say("The power of the Bertoxxulous is absolute.  As you have learned too late.");
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Argh!.. Mer.. o..na.. it's.. not.. your fault.. arhhh...");
}
