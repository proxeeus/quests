
sub EVENT_SAY { 
	if ($text=~/hail/i){
		quest::say("Welcome! We are the Soldiers of Tuneare, the sworn protectors of Faydark. Through the magic of Tunare we care for the land and with blade, staff and spell we protect the Faydark against those who would destroy and despoil it. We are always grateful for any assistance to our cause. Perhaps you could help me with some simple [errands].");
	}
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
	if($text=~/errands/i) {
		quest::say("As druids of the Mother of All, we may only use the schimitar and blunt weapons, all other blades are fobidden. Prove your devotion by bringing me a rusty [short sword], [long sword], [broad sword], and [bastard sword]. I will destoy them and reward you for your faith. They will be reforged into weapons blessed by Tunare to assist the Soldiers in their defence of the Heartwood.");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18786 => 1)){ #Tattered Note
		quest::say("Welcome! We are the Soldiers of Tunare, the sworn protectors of Faydark. I thank you for joining our cause, we can always use the help. Once you are ready to begin your training please make sure that you see Aliafya Mistrunner, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13537); #Green and Tan Tunic
		quest::ding();
		quest::faction(304,100); #soldier of Tunare
		quest::faction(178,15); #King Tearis Thex
		quest::faction(99,15);  #Faydark's Champions
		quest::exp(100);
	}
	if(plugin::check_handin(\%itemcount, 5013 => 1, 5016 => 1, 5019 => 1, 5022 => 1)) {
		quest::say("You have done well, child! Take this as a blessing from Tunare for doing her will.");
		quest::summonitem(5047);
		quest::givecash(0,0,6,0);
		quest::exp(250);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:gfaydark  ID:54083 -- Heartwood_Master 