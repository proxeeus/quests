sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18853)) { 
		$client->Message(15,"A dark whisper of a voice seems to echo in your mind. 'Welcome young warrior of Bertoxxulous. I am Rocthar Bekesna, your Guild Master. Read the note in your inventory and then hand it to me to begin your training.'");
  }
}

sub EVENT_SAY {
	if($text=~/hail/i){
		quest::say("I've little time for banter, unless you have come to me for training as a [new warrior] of the Bloodsabers move along.");
	}
	elsif($text=~/new warrior/i){
		quest::say("A warrior want to be is more like it. You've got a lot of work to do if you're going to be a valued member of the temple of Bertoxxulous, the Plague Bringer. That pompous ruler Antonius Bayle IV has this city in a tight grip with the support of our enemies, the temples of Rodcet Nife and Karana. It is not safe for us to walk the streets of Qeynos openly. You must learn to hold your tongue when not within the walls of our temple here in the Qeynos Catacombs. Should the Qeynos Guards discover your devotion to the Plague Bringer they would surely execute you. We have enemies all about and you must [learn to defend] yourself.");
	}
	elsif($text=~/learn to defend/i){
		quest::say("Take this note to Illie Roln. She will help get you outfitted in a suit of armor. Once you have been properly outfitted return to me and I will tell you how you can make yourself useful. I have a [small task] in mind.");
		quest::summonitem(20205);
	}
	elsif($text=~/small task/i){
		quest::say("The Priests of Life and Knights of Thunder often travel the roads from Qeynos carrying messages for the farmers of the Plains of Karana and the Knights of Truth in Freeport on the opposite coast of Antonica. We have recently been sending Bloodsabers to the Plains of Karana in search of a possible location for a new hidden temple should the need arise. One of the messengers of the Knights of Thunder has alerted the peasants of the plains the possibility of a Bloodsaber presence there and is using them to track our motions. Find the messenger, Lukas Hergo, and bring me his head.");
	}
	elsif($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	elsif($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18853 => 1)) { #Blood Stained Note
		quest::say("A new warrior of hate always pleases me. Here is your tunic, please return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13598); #Ruined Training Tunic*
		quest::ding();
		quest::faction(221,100); #Bloodsabers
		quest::faction(262,-15); #Guards of Qeynos
		quest::faction(296,10); #Opal Dark Briar
		quest::faction(341,-25); #Priest of Life
		quest::faction(230,5); #Corrupt Qeynos Guards
		quest::exp(100);
	}
	elsif(plugin::check_handin(\%itemcount, 20175 => 1)) { #Lukas Hergo's Head
		quest::say("Well done $name. Now take this Rusty Scourge Warrior Broadsword to a forge and sharpen it with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done take the Tarnished Scourge Warrior Sword and a Giant King Snake Skin to Illie Roln and he will put the finishing touches on the weapon.");
		quest::summonitem(20176); # Rusty Scourge Warrior Broadsword
		quest::ding();
		quest::faction(221,100); #Bloodsabers
		quest::faction(262,-15); #Guards of Qeynos
		quest::faction(296,10); #Opal Dark Briar
		quest::faction(341,-25); #Priest of Life
		quest::faction(230,5); #Corrupt Qeynos Guards
		quest::exp(1000);
	}
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  }
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:qcat  ID:45081 -- Rocthar_Bekesna
