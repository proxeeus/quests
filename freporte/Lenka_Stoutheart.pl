sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
      quest::say("If I catch the little thief who took my pouch, may the Wolves of the North have no mercy on em!!");
   }
}
sub EVENT_ITEM
{

   # Boat Beakon ID- 13818
   if($itemcount{13818} == 1)
   {
   
   quest::say("Oh!! You must work for that Erudite named Palatos. I guess he won't have to spend anymore money drinking in Freeport. Here. Here is the portrait I kept until he could get me a new boat beacon.");
   quest::ding(); quest::exp("100");
   #quest::givecash("0","0","0","0");

   ### Random Item choosing if needed
   # $random=int(rand itemid+itemid+itemid);
   # quest::summonitem($randon);

   # A'kanon's Portrait ID-12146
   quest::summonitem("12146");

   # Wolves of the North Faction ID - 361
   quest::faction("361","1");
   # Shamen of Justice Faction ID - 294
   quest::faction("294","1");
   # Heretics Faction ID - 143
   quest::faction("143","1");
   #High Guard of Erudin Faction ID - 147
   quest::faction("147","1");
   }
    # L.S. Pouch ID-13814
 elsif($itemcount{13814} == 1)
 {
 
 quest::say("You found my pouch! Thanks kid. Let me buy you A drink and this is for the good work. Hmmmm. It looks as though they took my voucher. Darn it! Hey... It looks like they were using my bag to hold items they were stealing. Here you go. You can have it. It looks like junk. ");

 quest::ding(); quest::exp("200");

 $random=int(rand 13922+13923);
 # Snapped Pole ID-13922 or Moggok's Right Eye ID-13923
 quest::summonitem($random);
 quest::givecash("0","2","0","0");
 # Faction Wolves of the North ID-361
 quest::faction("361","2");
 # Faction Shamen of Justice ID-294
 quest::faction("294","2");
 # Faction Merchants of Halas ID-213
 quest::faction("213","2");
 # Faction Steel Warriors ID-311
 quest::faction("311","2");
 # Faction Rogues of the White Rose ID-275
 quest::faction("275","-2");

 }

}

