sub EVENT_ENTERZONE {
  if((($ulevel >= 50) && ($zoneid >=1  && $zoneid <= 17)) | (($ulevel >= 50) && ($zoneid >= 19  && $zoneid <= 31))
    | (($ulevel >= 50) && ($zoneid >= 33 && $zoneid <= 38)) | (($ulevel >= 50) && ($zoneid >= 40 && $zoneid <= 47))
    | (($ulevel >= 50) && ($zoneid >= 49 && $zoneid <= 63)) | (($ulevel >= 50) && ($zoneid > 67 && $zoneid < 70))
    | (($ulevel >= 50) && ($zoneid > 73 && $zoneid < 75)) | (($ulevel >= 50) && ($zoneid == 78 ))
    | (($ulevel >= 50) && ($zoneid == 78 )) | (($ulevel >= 50) && ($zoneid == 82 )) | (($ulevel >= 50) && ($zoneid == 83 ))
    | (($ulevel >= 50) && ($zoneid == 84 )) | (($ulevel >= 50) && ($zoneid == 97 )) | (($ulevel >= 50) && ($zoneid == 98 ))
    | (($ulevel >= 50) && ($zoneid == 100 )) | (($ulevel >= 50) && ($zoneid == 101 )) | (($ulevel >= 50) && ($zoneid == 104 ))
    | (($ulevel >= 50) && ($zoneid == 106 )) | (($ulevel >= 50) && ($zoneid == 121 )) | (($ulevel >= 50) && ($zoneid == 156 ))
    | (($ulevel >= 50) && ($zoneid == 165 )) | (($ulevel >= 50) && ($zoneid ==166 )) | (($ulevel >= 50) && ($zoneid == 189 ))){
    $client->Message(15,"This zone is trivial to you since you aquired level 50 - you are only allowed in this zone to complete quests and fight some of the higher level mobs.");
  }
}
