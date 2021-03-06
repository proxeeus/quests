sub EVENT_SAY {
 if($text =~ /hail/i) {
	quest::emote("turns to you and snorts in anger. Some mucus lands on your cheek. 'Troopers! I thought I ordered you to keep all new recruits away from this chamber! Go, child. The War Baron of Cabilis has no time for games. See this intruder out!!'");
 }
 if ($text=~/memory of sebilis?/i) {
   quest::emote("takes a step back and thinks to himself. Phlegm dribbles off his lips. 'The Memory of Sebilis. Kept within my personal chambers. They have been taken. Taken by some croakin' Forsaken no doubt!! You have been sent to me because you show excellent prowess. Find my Memory and bring it to me with your footman's pike.'");
 }
 if ($text=~/brave trooper of the empire/i) {
   quest::say("So you are a trooper? Word of your deeds has been spreading through the legion. If you truly wield the pike of a trooper, then go and serve the garrisons of swamp, lake and woods. Report to the Warlord and tell him you are a [trooper reporting for duty]. Their recommendations and your trooper pike shall earn you the rank of legionnaire.");
 }
 if ($text=~/true warrior of the legion/i) {
	quest::say("Yes, I'm talking about the Legionnaire Mancatcher. Seek out Weaponsmith Grugl and ask him about forging such a weapon.");
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 18464 => 1, 22919 => 1)){
  quest::emote("smiles at your dedication to Cazic-Thule and hands you a small gem.");
  quest::summonitem(7881);
  quest::exp(20000);
  quest::ding();
  quest::faction(444,20);
  quest::faction(441,10);
 }
 if(plugin::check_handin(\%itemcount, 18463 => 1, 22918 => 1)){
  quest::emote("smiles at your dedication to Cazic-Thule and hands you a small gem.");
  quest::summonitem(7881);
  quest::exp(20000);
  quest::ding();
  quest::faction(444,20);
  quest::faction(441,10);
 }
     if (plugin::check_handin(\%itemcount, 12899 =>1, 12898 =>1, 12896 =>1, 5132 =>1 )) {
	 quest::emote("shines a bright smile which quickly fades to a frown. 'The memory is not complete. ..sniff, sniff.. A reward for my memory and your footman's pike.'");
	 quest::emote("shines a bright smile which quickly fades to a frown. 'The memory is not complete. ..sniff, sniff.. A reward for my memory and your footman's pike.'");
	 quest::emote("shines a bright smile which quickly fades to a frown. 'The memory is not complete. ..sniff, sniff.. A reward for my memory and your footman's pike.'");
  quest::emote("gulps down a wad of phlegm. 'My memory has returned! $name! You are no footman. I grant you the rank of soldier. Go and forge your weapon. Do not return to me until you become a [brave trooper of the empire]. In the meantime, report back to Drill Master Kyg about Footman Moglok.'");
  quest::summonitem(12476);
  quest::faction( 440,2);
   quest::faction( 441,2);
   quest::faction( 445,2);
   quest::faction( 444,2);
   quest::faction( 442,2);
   quest::ding();
   quest::exp(800);
}
if (plugin::check_handin(\%itemcount, 18073 => 1, 18072 => 1, 18074 => 1, 5134 => 1 )) {
	quest::say("I await three letters of recommendation and your trooper pike.");
	quest::say("I await three letters of recommendation and your trooper pike.");
	quest::say("I await three letters of recommendation and your trooper pike.");
   quest::emote("takes away your pike and hands you plans not for a pike head, but for the crown of another polearm. 'It is time to wield the weapon of a [true warrior of the legion]. You have done well, Legionnaire $name!'");
  quest::summonitem(12478);
  quest::faction( 440,2);
   quest::faction( 441,2);
   quest::faction( 445,2);
   quest::faction( 444,2);
   quest::faction( 442,2);
   quest::ding();
   quest::exp(4000);
}
#do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
