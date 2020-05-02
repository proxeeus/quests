#Quests covered in this file:
#Shaman Skull Quest 3
#Shaman Skull Quest 4

sub EVENT_SAY
{
   #Shaman Skull Quest No.3 Event_Say
   if($text=~/crusaders of rok nolok/i)
   {
      quest::say("Take this chest. Inside you shall combine the skull of their leader and at least five of the caste members. You must then go to the swamp garrison and deliver the full chest along with your Iron Cudgel of the Mystic to Mystic Dovan. Go to him now and inquire of the Crusaders of Rok Nolok.");
	  quest::summonitem(17035); #Give the player A Skull Chest (C.O.R.N. Chest) to combine Tiny Glowing Skulls in
   }
}

sub EVENT_ITEM
{
   #give Crusader Quarg the note that Hierphant Zand gave to you
   if(plugin::check_handin(\%itemcount, 18054 => 1) )
   {
      quest::say("At last!! The last three sent were not of sufficient power to brave the evils of the tower. Here is your container. I was to travel with you, but Warlord Zyzz insists that I stay on post. The skulls you seek are the ones belonging to the [caste of bone brethren]. Combine the five skulls of the caste and the one belonging to the leader inside the box and bring to me the full box along with your iron cudgel of the seer.");
      quest::faction(445, 10); #Scaled Mystics
      quest::faction(441, 10); #Legion of Cabilis
      quest::summonitem(17034); #Give the player a six slot container to combine the 5 skulls with an "X" in
      quest::exp(10000); #give decent xp...
	  quest::ding();
   }

   #turn in the Full C.O.B.B. Chest and your Iron Cudgel of the Seer
   elsif(plugin::check_handin(\%itemcount, 12735 => 1, 5142 => 1) )
   {
	  quest::say("I require the full C.O.B.B. chest and your iron cudgel of the seer.");
      quest::say("The temple shall be pleased. As instructed by the Hierophants, here is your Iron Cudgel of the Mystic. You have done well that I must ask you to [collect the Crusaders of Rok Nolok].");
      quest::faction(445, 10); #Scaled Mystics
      quest::faction(441, 10); #Legion of Cabilis
      quest::summonitem(5143); #Give the player the Iron Cudgel of the Mystic
      quest::exp(100000); #give decent xp...
	  quest::ding();
   }

      plugin::return_items(\%itemcount); #return items if not the ones required
}

