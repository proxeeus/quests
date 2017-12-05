sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
      quest::say("Hello there $name ! You'll be happy to see that I am fully stocked with all my usual goods. Have a look around");
   }
}

