# Bzzazzt n°2, spawning 3 mobs on death (Bazzazzt 71110)
my $x;

my $y;

my $z;

my $h;

my $entid1;

my $entid2;
my $entid3;

my $mob1;

my $mob2;

my $mobnpc1;

my $mobnpc2;



sub EVENT_DEATH {

  $x = $npc->GetX();

  $y = $npc->GetY();

  $z = $npc->GetZ();

  $h = $npc->GetHeading();

  $entid1 = quest::spawn2(71110,0,0,$x+10,$y,$z,$h);

  $entid2 = quest::spawn2(71110,0,0,$x-10,$y,$z,$h);
  $entid2 = quest::spawn2(71110,0,0,$x,$y,$z,$h);

  $mob1 = $entity_list->GetMobID($entid1);

  $mob2 = $entity_list->GetMobID($entid2);

  $mobnpc1 = $mob1->CastToNPC();

  $mobnpc2 = $mob2->CastToNPC();

  $mobnpc1->AddToHateList($npc->GetHateTop());

  $mobnpc2->AddToHateList($npc->GetHateTop());

}

