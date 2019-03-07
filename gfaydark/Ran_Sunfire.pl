#sub written by Kilelean
sub DoRandomPatchwork {
	my $a;
	$a = int(rand(100)); 
	#Change the 20 in the if to change the % chance.
	if ($a <= 100) {
		quest::summonitem(quest::ChooseRandom(2104, 2106, 2108, 2111, 2112));#Patchwork Tunic, Patchwork Cloak, Patchwork Sleeves, Patchwork Pants, Patchwork Boots
	}
	else {
		#Do nothing
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. $name! I trust you are not afraid of heights. Kelethin is a grand city, but it is also a safe haven from predators and evil beings. About the only thing to fear are the [pixie tricksters].");
}
if($text=~/pixie tricksters/i){
quest::say("An irritating lot of fairy folk. They have been starting fires in our great forest. They may just burn our grand community down. We will have to [exterminate the pixies]. It is unfortunate, but it is for the good of the entire forest.");
}
if($text=~/exterminate the pixies/i){
quest::say("Then I give you this pouch. Should you fill and combine it with pixie dust, I shall pay you greatly for your deeds. We may even find a use for the dust itself. Careful, small though they may be, many are quite strong. Search for the weak ones for now."); 
quest::summonitem(17957);
}
}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 12109 => 1)) {#Pouch of Pixie Dust
		quest::say("We thank you for your deed. Here, then, is a small reward. Nothing more than long forgotten equipment, but it may be useful to a young ranger.");
		&DoRandomPatchwork();
		quest::givecash("0","2","0","0");
		quest::faction(316, 10);#Scouts of Tunare
		quest::exp(800);#10% of level 3 experience.  Newbie quest, being a bit generous compared to the guidelines.
	} 

  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:gfaydark  ID:54104 -- Ran_Sunfire 
