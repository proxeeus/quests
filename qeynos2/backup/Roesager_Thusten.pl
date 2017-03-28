# Revised by Proxeeus.

sub EVENT_SAY { 
if($text=~/hail/i){
	quest::say("Hail, $name!  My name is Roesager Thusten. Paladin of Life.  I am a loyal servant of the Prime Healer and I seek to destroy all who wish to bring death and disease to the land of Norrath."); }
if($text=~/niclaus/i){
	quest::say("'Niclaus Ressinn? Have you seen him? He is one of our paladins who was sent out to investigate the undead sightings in the Qeynos Hills. I have a message from Jahnda for him, but I must continue my own search here in Qeynos. Could you take this to Niclaus? Your help would be appreciated.");
	# Note to Niclaus
	quest::summonitem(18970);
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2049 -- Roesager_Thusten 
