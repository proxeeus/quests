sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
      quest::say("If you're a new employee of the Coalition of Tradefolk I suggest you speak with Tovan Tenlah. Now if you will excuse me I have much work to do.");
   }

   if($text=~/boots/i)
   {
      quest::say("To craft Coalition Trader Boots you require two [silk thread], two ruined cat pelts, two desert spiderling hairs, and a rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
      # Tattered Boot Pattern ID-19561
      quest::summonitem("19561");
   }

   if($text=~/bracer/i)
   {
      quest::say("To craft an Coalition Trader Bracer you require a [silk thread], a ruined cat pelt, and a desert spiderling hairs. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
      # Tattered Wristband Pattern ID-19558
      quest::summonitem("19558");
   }
     
   if($text=~/cap/i)
   {
      quest::say("To craft a Coalition Trader Cap you require two [silk thread], a ruined cat pelt, a dune spiderling hairs, and a rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Coif Pattern.");
      # Tattered Cap Pattern ID-19555
      quest::summonitem("19555");
   }

   if($text=~/gloves/i)
   {
      quest::say("To craft Coalition Trader Gloves you require two [silk thread], a ruined cat pelt, two desert spiderling hairs, and a rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
      # Tattered Glove Pattern ID-19559
      quest::summonitem("19559");
   }

   if($text=~/leggings/i)
   {
      quest::say("To craft Coalition Trader Leggings you require three [silk thread], a low quality cat pelt, two dune spiderling hairs, and a large rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
      # Tattered Pant Pattern ID-19560
      quest::summonitem("19560");
   }

   if($text=~/sleeves/i)
   {
      quest::say("To craft Coalition Trader Sleeves you require two [silk thread], a low quality cat pelt, two dune spiderling hairs, and a large rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
      # Tattered Sleeve Pattern ID-19557
      quest::summonitem("19557");
   }

   if($text=~/tunic/i)
   {
      quest::say("To craft a Coalition Trader Tunic you require four [silk thread], a medium quality cat pelt, a desert tarantula hairs, and a giant rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
      # Tattered Tunic Pattern ID-19556
      quest::summonitem("19556");
   }

   if($text=~/silk thread/i)
   {
      quest::say("I'm sure you could find a tailor in town to make you some silk thread or you can make your own with 2 Spiderling Silk.");
   }
}

sub EVENT_ITEM
{
   # A Sealed Letter ID- 12270 (Not the Correct note but it will do)
   if (plugin::check_handin(\%itemcount, 12270 => 1)) {
    quest::summonitem(17125);
    quest::say("Ah, Tovan sent you for a suit of traders clothing. I can instruct you on how to prepare your suit of clothing but you will have to acquire the required materials yourself. Use this Curing Kit to construct the clothing once you have done so. Do you wish to prepare Coalition Trader [Gloves], Coalition Trader [Boots], a Coalition Trader [Bracer], a Coalition Trader [Cap], Coalition Trader [Leggings], Coalition Trader [Sleeves], or a Coalition Trader [Tunic]?");
   }
   
   # Faceted Blue Gem ID-19919 - Rattlesnake Skin ID-19850 - Sharpened Dagger ID-59950 (Not sure if this is the right sharpened dagger)
   if (plugin::check_handin(\%itemcount, 19919 => 1, 19850 => 1, 59950 => 1)) {
      quest::say("You have proven yourself worthy of our cause. Take this and use it to bring down non followers of Innoruuk.");
      quest::ding(); 
      quest::exp("100");
      # Coalition Trader Dirk ID-19937
      quest::summonitem(19937);

      # Coalition of TradeFolk III Faction
      quest::faction("369","1");
      # Coalition of Trade Folk Faction
      quest::faction("47","1");
      # Carson McCabe Faction
      quest::faction("31","1");
      # Corrupt Qeynos Guards Faction
      quest::faction("53","1");
      # Freeport Militia Faction
      quest::faction("105","1");
   }
}
