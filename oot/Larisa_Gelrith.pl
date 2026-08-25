sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Raise your weapon!!  Let us begin the battle!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Th... the Sisterhood of Erollisi... and the Champions of Faydark... <cough>... shall... <cough>... avenge my... d... death!");
}

# EOF Zone: oot ID: 69014 NPC: Larisa_Gelrith
