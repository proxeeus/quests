# sixth coldain prayer shawl
# 

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Well, hello there, dear.  It sure gets cold here, doesn't it? Perhaps I can interest you in a sewing pattern to pass the time and keep you warm.");
  }
  if ($text=~/embroidered prayer shawl/i) {
    quest::say("It will be an honor to assist you in fashioning an embroidered shawl. It is a very demanding product and I can see from the look in your eyes that you desire to burn your sewing kit in our furnace, but if you persevere, your efforts will be richly rewarded. When you are ready you must carefully weave a spool of sacred Coldain thread. Take the thread, this pattern, and the silk shawl and carefully embroider the pattern. The result will be most exquisite. Please show me if you manage to create one.");
    quest::summonitem(1833);
  }
  if ($text=~/embroidered shawl/i) {
    quest::say("It will be an honor to assist you in fashioning an embroidered shawl. It is a very demanding product and I can see from the look in your eyes that you desire to burn your sewing kit in our furnace, but if you persevere, your efforts will be richly rewarded. When you are ready you must carefully weave a spool of sacred Coldain thread. Take the thread, this pattern, and the silk shawl and carefully embroider the pattern. The result will be most exquisite. Please show me if you manage to create one.");
    quest::summonitem(1833);
  }
  if ($text=~/sacred coldain thread/i) {
    quest::say("Take a woven frost giant beard, two siren's hairs, two manticore manes and two drakkel dire wolf whiskers, and combine them in a sewing kit. The resulting thread will enhance your shawl's power when embroidered in a special pattern.");
  }
  if($text=~/runed prayer shawl/i){
	quest::say("I haven't forgotten about you, $name. I have located a pattern and my son is fetching it for you now. Check back with me soon.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1198 => 1)) {
    quest::say("Spectacular artistry! I doubt I could have done better myself. You'll have to forgive me, I know time is short and I tend to carry on. This is the pattern for the making of a rune sacred to our people. It will be our final test of your craftsmanship and will put many of your skills to the test, but I trust you'll find the finished product to be more than worth the effort. Show Gilthan the embroidered shawl, he will set you on the path. May Brell always be with you outlander.");
    quest::summonitem(1198);
    quest::summonitem(1849);
	quest::exp(200000);
	quest::ding();
	quest::faction(406,10); #coldain
	quest::faction(405,10); #dain
	quest::faction(419,-30); #krif
	quest::faction(448,-30); #kzek
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: thurgadina ID: 115168 Name: Betti_Frostweaver

