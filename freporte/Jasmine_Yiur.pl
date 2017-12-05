#TODO: mail quest implemented?
#TODO: faction hits?

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
      quest::say("Oh, hello. Sorry,");
      quest::emote("lowers her head.");
      quest::say("I am not really in best form today. I am in a bit of a [big predicament].");   
   }

   if($text=~/big predicament/i)
   {
      quest::say("I work for the League of Antonican Bards. As you may or may not know, we are sometimes tasked with the delivery of mail to various cities around Norrath. A shipment of mail was to be delivered from here to Qeynos. It was supposed to arrive several days ago but I have received word that it never arrived. I have recently been informed by the guards that the ship was stolen before it could leave port. The guards reported seeing a large number of trolls board the ship and sail away with it in the dead of the night. The League and myself would be most appreciative of such a brave adventurer's [help].");   
   }

   if($text=~/help/i)
   {
      quest::emote("gives you a warm smile.");
      quest::say("'That is the first time I have smiled in days, this mess has me so worried. Not only are we missing the mail but now an entire ship. Please take this note to Guard Bribbely. He is probably still near the docks investigating this matter.");   
      # Note to Guard Bribbely ID- 55003
      quest::summonitem("55003");
   }
}

sub EVENT_ITEM
{
   # Bundle of Mail ID-55002
   if($itemcount{55002} == 1)
   {
      quest::say("I am so happy to see that you have returned, and with the mail! You are truly a hero. I will make certain that the other members of the League hear about you. You didn't find the missing ship you say? Guard Bribbely will not be pleased, but you did all that you could. Please take this for payment of your brave deeds. May we meet again.");
      quest::ding(); quest::exp("200");
      # Seawind Necklace ID-55027
      quest::summonitem("55027");
   }
}

