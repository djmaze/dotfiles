var xbmc_address = '192.168.178.25';

function get_clip_id() {
  try {
          console.log('Trying to get video id from video_id element');
          var clip = document.getElementsByName('video_id')[0]['value'];
  } catch (Exception) {
  }

  if (clip == undefined) {
          console.log('Trying to get video id from url');
          var clip;

          var search = window.location.search.substring(1).split('&');
          console.log('search = ' + search);

          for(i = 0;i < search.length;i++)
          {
                  if(search[i].substring(0, 2) == 'v=')
                  {
                          var clip = search[i].substring(2);
                          console.log('Clip found using alternative method: ' + clip);
                          break;
                  }
          }       
  }

  if (clip != undefined) {
          console.log('Found clip ' + clip);
  }
  return clip;
}

function play_movie_in_xbmc(clip_id) {
  console.log('Playing video: ' + clip_id);

  var data = encodeURIComponent('{"jsonrpc":"2.0", "method":"Player.Open", "params":{"item":{"file":"plugin://plugin.video.youtube/?action=play_video&videoid=' + clip_id + '" }}, "id" : 1}');
  $.ajax('http://' + xbmc_address + '/jsonrpc?request=' + data, {
    method: 'GET',
    beforeSend: function() { $('#play_video_in_xbmc').replaceWith('<div id="sending_to_xbmc">Sending to XBMC..</div>'); },
    complete: function() { $('#sending_to_xbmc').replaceWith('<div id="sent_to_xbmc">Sent to XBMC.</div>'); }
  });
}

$(document).ready(function() {    
  var clip_id = get_clip_id();
  $('#watch7-headline').append('<a id="play_video_in_xbmc" href="#">Play in XBMC</a>');
  $('#play_video_in_xbmc').click(function(evt) {
    play_movie_in_xbmc(clip_id);
    evt.preventDefault();
  });
});
