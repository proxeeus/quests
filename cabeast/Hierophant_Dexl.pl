#Quests covered in this file:
#Shaman Skull Quest 6

sub EVENT_SAY
{
   if($text=~/hail/i)
   {
      quest::emote("seems to be preocupied. He is examining an egg. 'What?!! Who has [sent] you to me? Bah!! Away with you.' He ignores you and continues chanting.");
   }
   if($text=~/di nozok sent me/i)
   {
      quest::emote("drops the egg he was holding. Egg yolk splatters on your foot. His eyes roll back into his head. He speaks, but his voice is that of a female. 'I await you, $name. My sisters and I yearn for the return of our skulls. We are the [Sisters of Scale]. Find us and bring to this hierophant our skulls and your iron cudgel of the Channeler. Go.");
   }
   if($text=~/sisters of scale/i )
   {
      quest::emote("wipes egg yolk from his clothing. 'My, what a mess!! Hmmph!! What did you say? Sisters of Scale? They were a legendary trio of mystics. We once had their skulls sealed within this temple, but now they are lost. I sent a channeler to retrieve them. His name was Vagnar. I am sure he shall find them.'");
   }
   if($text=~/vagnar/i)
   {
      quest::say("He's a capable channeler, I trust he knows where to look and will prepare himself. Any competent servant of our Lord would prepare potions and supplies before going on such a quest. If he doesn't come back, it's no great loss, he wasn't Hierophant material anyway.");
   }
}

sub EVENT_ITEM
{
   #Turn in the skulls of the sisters of scale and your cudgel of the channeler
   if(plugin::check_handin(\%itemcount, 5145 => 1, 12748 => 1, 12750 => 1, 12749 => 1) )
   {
      quest::emote(" goes into a trance and speaks with the voice of an ancient. 'You have returned the skulls of the Sisters of Scale. For this you shall be rewarded. Take this hierophant's weapon. May you use it to smite the foes of our people.' Dexl comes out of the trance. 'What?!! Whew. Hey!! Where is my cudgel?'");
      quest::faction(445, 10); #Scaled Mystics
      quest::faction(441, 10); #Legion of Cabilis
      quest::summonitem(5146); #Give the player The Cudgel of the Hierophant
      quest::exp(140000); #give decent xp...
      quest::givecash (0,0,0,10);
	  quest::ding();
   }
   plugin::return_items(\%itemcount); #return items if not the ones required
}
