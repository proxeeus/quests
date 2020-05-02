# Missing dialogue / turn in for the canopies
#Galdon Vok Nir grasps the jar and begins to push and turn the lid. 'Ahhh!!
#Here you are, my friend. Unngh!! It appears to be a preserved eye. I do not
#think it would be wise to eat it. Perhaps you can use it for another
#purpose. Where did you find this jar?'

sub EVENT_SAY { 
if($text=~/hail/i){
quest::say("Please do not harm me. I am not the one who brought the outsiders to our land. I am innocent and deserve to return to my people."); 
}   
if($text=~/skull of di nozok/i){
      quest::say("Ah, doing the bidding of the council are you?  I will only give up the skull for the 2 Ton Warrior Totems held by the goblins of nurga and frogloks of the swamp of no hope, the Canopie of Di Nozok held by the goblin Overseer Dlubish, and 400 gold pieces.");
   }
  if($text=~/eye of torture/i)
  {
	quest::say("I have heard of such things. You must have stumbled upon an ancient jar devised by one of my long-dead ancestors. They were fine craftsmen. I do not share their gift, but I do know the secret of the locks. If you have one of the ancient Vok Nir canopics, allow me to open it for you.");
  }
  if($text=~/kurn's tower/i)
  {
	quest::say("Kurn's Tower!! Such a dangerous place for one to wander. It is a place of great suffering. Kurn was well known for the torture of many races, mostly the giants named the Kromdul. Long after the destruction of the tower by an unknown foe, the Kromdul returned to retrieve Kurn's body for sacrifice to their gods. They did not find his body, but rumor has it they found Kurn's favorite torture weapon. What happened to it, only they would know.");
  }
  if($text=~/kromdul/i)
  {
	quest::say("The Kromdul are a race of giants. I believe they inhabit the woods of Kunark.");
  }
}

sub EVENT_ITEM
{
   #Turn in the 2 totems and the canopie of Di Nozok and 400 gold pieces
   if(plugin::check_handin(\%itemcount, 12743 => 1, 12744 => 1, 12742 => 1) && $gold == 400)
   {
      quest::say("A deal is a deal I suppose, many have attempt to do what I have asked, but fallen to the Overseer.");
      quest::summonitem(12740); #Give the player the Iksar Skull
	  quest::exp(10000);
	  quest::ding();
	  quest::faction(445, 10); #Scaled Mystics
	  quest::faction(441, 10); #Legion of Cabilis
   }

   plugin::return_items(\%itemcount); #return items if not the ones required
}

#END of FILE Zone:overthere  ID:93140 -- Galdon_Vok_Nir 

