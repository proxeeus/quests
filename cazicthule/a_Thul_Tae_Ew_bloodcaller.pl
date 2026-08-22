sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::emote("begins to murmur a grotesque incantation...");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::emote("froths at the mouth as it curls on the ground!");
}

sub EVENT_DEATH {
   my $random_result = int(rand(100));


   my $a = 48426;

    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();

   if ($random_result<=50){
      #Spawns my mob at the location that just died
      quest::spawn2($a,0,0,$x,$y,$z,$h);
   }
   else {
   }

}