sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
      quest::say("Hail $name. Business is going well these days. I have a full stock of baked goods and other items for sale. Have a look around!");
   }
}

