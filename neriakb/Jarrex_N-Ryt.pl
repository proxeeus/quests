#Jarrex N-Ryt.pl
#Orc Slayer Armor/Orc Slayer Weapon/Orc Slayer Shield


sub EVENT_SAY{
  if($text=~/Hail/i) {
    quest::say("What have we here? A new weakling that wishes to reap some sort of self-value and renown through service to the Indigo Brotherhood perhaps? Well speak up whelp!! Have you come to [destroy the enemies of Neriak] or are you a coward better suited to mop the filth from the back rooms of the Maidens Fancy.");
  }
  if($text=~/destroy the enemies of Neriak/i) {
    	quest::say("If you are going to be of any value to the Indigo Brotherhood you will need to outfit yourself in a suit of armor that will turn aside the blades of enemy forces. From the looks of you even the tiny fangs of a moss snake could bring you death. Take this request form to Issva H'Rugla to get yourself started on the assembly of your armor. When you have procured some protection for your weakling body return to me for [further instruction].");
    	quest::summonitem(31753);#Request Form
  }
  if($text=~/further instruction/i) {
    quest::say("Ah, you are eager to advance further within the Indigo Brotherhood. Although it is my duty to aid your training, do not allow your arrogance to blind you to your lowly position amongst the Kings most loyal subjects. Your next task is to assist the construction of a [weapon] and [shield] worthy of being wielded by a Warrior of the Indigo Brotherhood.");
  }
  if($text=~/weapon/i) {
    quest::say("Beyond the mouth of Neriak lies the Nektulos Forest. There the Deathfist Clan of Orcs has set up camps in an attempt to invade and claim the Nektulos Forest. Slay these invaders and bring to me an Orc Templar Scalp, an Orc Fibula bone, and an Orc Clavicle bone.");
  }
  if($text=~/shield/i) {
    quest::say("Young Kodiak Bears often wander into the Nektulos Forest from the Commonlands searching for food. You do not appear to have the strength to arm wrestle a pixie. If you prove me wrong by slaying Young Kodiaks and bringing me four Young Kodiak Femurs I will guide you in the construction of a shield worthy of a warrior of the Indigo Brotherhood.");
  }
}
sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 13791 => 1, 19565 => 1, 19564 => 1)) {	#Orc Scalp, Orc Clavicle, Orc Fibula
			quest::say("Excellent work $name. You do the Indigo Brotherhood proud on this day. Take this weapon, and wield it in the name of Innoruuk, our Lord and Creator!");#text made up
			quest::summonitem(19606);#Jagged Orc Slayer Sword
	}
	elsif(plugin::check_handin(\%itemcount, 19562 => 4)) {	#Young Kodiak Femurs
			quest::say("So you have more strength than you seem to. You may yet be useful to the Indigo Brotherhood then... Hmm, as promised...here is your shield, $name. Wield it with pride.");#text made up
			quest::summonitem(19609);#Black Femur Shield	
	}
  else {
  	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
}