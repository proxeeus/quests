sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  # Set proximity
  quest::set_proximity($x-50,$x+50,$y-50,$y+50);
}

sub EVENT_ENTER {
  # Monk Epic 1.0
  quest::attack($name);
}

sub EVENT_DEATH_COMPLETE {
  quest::shout("Grraaaagghhhh!! NOT.. POSSIBLE!");
}
# End of File