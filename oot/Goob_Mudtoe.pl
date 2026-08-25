sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Smash you. . . No one bash better than Mudtoe.");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Oooh!!  That hurt.  Oggok ogres find you.  Smash you.");
}

# EOF Zone: oot ID: 69125 NPC: Goob_Mudtoe
