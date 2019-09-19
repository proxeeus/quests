# forager/hunter named cycle random spawner
#

sub EVENT_SPAWN {
  $getnewloc = quest::ChooseRandom(1,2,3,4,5,6);
  if ($getnewloc == 1) {
    $newx = 1271.88;
    $newy = -1461.88;
    $newz = -284.75;
  }
  elsif ($getnewloc == 2) {
    $newx = 4264.87;
    $newy = 2517;
    $newz = -334.4;
  }
  elsif ($getnewloc == 3) {
    $newx = 1402;
    $newy = 2378;
    $newz = -235.4;
  }
  elsif ($getnewloc == 4) {
    $newx = 3341;
    $newy = 2364;
    $newz = -331.63;
  }
  elsif ($getnewloc == 5) {
    $newx = 1198;
    $newy = -1997;
    $newz = -311.5;
  }
  elsif ($getnewloc == 6) {
    $newx = 1543;
    $newy = -2037;
    $newz = -319.5;
  }
}

sub EVENT_DEATH_COMPLETE {
  $getnewmobid = quest::ChooseRandom(95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95107,95150,95155,95156,95158,95164,95165,95170,95175,95177,95178,95182,95206,95208);
  quest::spawn2($getnewmobid,0,0,$newx,$newy,$newz,0);
}

# EOF zone: trakanon

