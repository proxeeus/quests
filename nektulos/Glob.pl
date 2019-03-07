# Glob the troll dialogue
#
# Involved in: Stop! Pay troll.
#
# by Proxeeus

sub EVENT_SAY
{
	if($text=~/Hail/i)
	{
		if($race eq "Troll")
		{
			quest::say("Well, well, brother Troll. I'm glad to see yu have decided to join us again at last. As yu can see, we are in da midst ub trubling times, what with having been driven from our homelands ub Grobb. No matter, da Frogloks will pay for der insolence above all else. But yu, yu seem distraught, and I have heard word that yu are not on favorable standings with our dark elven hosts. They have set me upon dis forest to aid any ub our brethren who seek to prove that dey are not a threat to da dark ones in dese caves. Are yu looking to prove dat [yu are not a threat] so dat yu may enter and speak in your guild hall?");
		}
		else
		{
			quest::say("Yu go away! Me hav' no buzness wiv' yu!"); # made that up
		}
	}
	if($text=~/not a threat/i)
	{
		if($race eq "Troll")
		{
			quest::say("Gud to hear, da dark ones will be pleased when yu have proven yur loyalty to da dark ways. To do dis, yu will need to retrieve a few things dat show yu are evil at the core, but not when it comes to our hosts. Yu must travel to Nagafen's lair and seek out da sonic bats, for der screams pierce da heart and cause great distress. Retrieve from dem four samples ub blood and return dem to me and yu will have proven yur intent to be loyal to our hosts.");
		}
	}
}

sub EVENT_ITEM
{
	if($race eq "Troll")
	{
		if(plugin::check_handin(\%itemcount, 60016 => 4))
		{
			# Not real text, had to improvize
			quest::say("Dat is good, $name! Continue like dis' and maybe dem Teir'Dal will finally recegnize yu as one uf dere own! Maybe! Heehehehehe!");
			quest::exp(500);
			quest::ding();
			quest::faction(236, 10);	 # Dark Bargainers
			quest::faction(239, 10); # The Dead
			quest::faction(270, 10); # Indigo Brotherhood
			quest::faction(370, 10);	 # Dreadguard Inner
			quest::faction(334, 10);	 # Dreadguard Outter
			quest::faction(340, 10); # Priests of Innoruuk
			quest::faction(354, 10); # Neriak Trolls
		}
	}
	else
	{
		plugin::return_items(\%itemcount);
	}
}
