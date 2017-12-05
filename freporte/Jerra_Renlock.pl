sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
      quest::say("Yes? What is it you want from me? I have nothing that you would be interested in. Not even money to pay the ridiculous taxes imposed by the Freeport Militia.");
   }

   if($text=~/dismal priest boots/i)
   {
      quest::say("To assemble Dismal priest Mail Boots you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Coyote Pelts, and two Large Fire Beetle Tarsi in the Mail Assembly Kit.");
   } 

   if($text=~/dismal priest bracer/i)
   {
      quest::say("To assemble a Dismal priest Mail Bracer you will need to obtain a brick of crude iron and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Coyote Pelt and a Sand Scarab Hatchling Sternite in the Mail Assembly Kit.");
   }  

   if($text=~/dismal priest breastplate/i)
   {
      quest::say("To assemble a Dismal priest Breastplate you will need to obtain four bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Coyote Pelt, a Giant Fire Beetle Carapace, and two Giant Fire Beetle Tergites in the Mail Assembly Kit.");
   } 

   if($text=~/dismal priest gauntlets/i)
   {
      quest::say("To assemble Dismal priest Gauntlets you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Coyote Pelt and two Sand Scarab Hatchling Tarsi in the Mail Assembly Kit.");
   } 

   if($text=~/dismal priest greaves/i)
   {
      quest::say("To assemble Dismal priest Greaves you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Coyote Pelts and two Large Fire Beetle Sternites in the Mail Assembly Kit.");
   } 

   if($text=~/dismal priest helm/i)
   {
      quest::say("To assemble a Dismal priest Helm you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Coyote Pelt and two Sand Scarab Hatchling Eyes in the Mail Assembly Kit.");
   } 

   if($text=~/dismal priest vambraces/i)
   {
      quest::say("To assemble Dismal priest Vambraces you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Coyote Pelt and two Large Fire Beetle Patella in the Mail Assembly Kit.");
   } 

}

sub EVENT_ITEM
{
   # Note to Jerra Renlock ID- 19844
   if($itemcount{19844} == 1)
   {
      quest::say("Ah, so Zhem wants me to assist you with some armor. You will surely need it if you are an associate of the likes of him. This Mail Assembly Kit will be needed for you to construct your armor. The materials required depend on the armor section you plan to construct. Do you plan to construct a [dismal priest helm], a [dismal priest bracer], [dismal priest gauntlets], [dismal priest boots], [dismal priest vambraces], [dismal priest greaves], or a [dismal priest breastplate]?");
      ## quest::ding(); quest::exp("0");
      #quest::givecash("0","0","0","0");

      ### Random Item choosing if needed
      # $random=int(rand itemid+itemid+itemid);
      # quest::summonitem($randon);

      # Mail Assembly Kit ID-17124
      quest::summonitem("17124");

      # factionname Faction ID - factionid
      #quest::faction("0","1");
   }
}

