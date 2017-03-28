# Drosco's quest
# fixed by Proxeeus

sub EVENT_ITEM 
{
  if (plugin::check_handin(\%itemcount, 18804 => 1)) {
    quest::say("Rele.. ase.. me.. from.. this.. tor.. ment.. ARGH! You will die for entering the domain of the Bloodsabers!! Karana.. help.. me?");
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_DEATH 
{
	quest::faction(257,1); # Priests of Life
	quest::faction(135,1); # Guards of Qeynos
	quest::faction(21,-7); # Bloodsabers
	quest::faction(53, -7);# Corrupt Qeynos Guards
	quest::faction(235, -7);# Opal Dark Briar
  quest::say("ARGH!!!!!.. Thank.. you..");
}