sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
      quest::say("Greetings, friend!!  Nice to meet you.  I see you enjoy barging into other people's rooms.  No problem.  I enjoy the company.  What are you looking for?");
   }
}
