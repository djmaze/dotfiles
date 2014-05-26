var CLIP_ID;
var xbmc_address = 'raspbmc:8080';

function get_static_clip_id() {
    if (CLIP_ID) {
        return CLIP_ID;
    } else {
        var clip_id, matches;
        var $link = $('link[rel="canonical"][href]');

        if ($link.length) {
            matches = $link.attr('href').match(/(\d+)$/);

            if (matches) {
                CLIP_ID = clip_id = matches[1];
                console.log('Found static clip ID: ' + clip_id);
            }
        }

        return clip_id;
    }
}

function get_clip_id() {
    var clip_id;
    var $param = $('param[name="flashvars"][value]');

    if ($param.length) {
        var matches = $param.attr('value').match(/\bclip_id=(\d+)/);

        if (matches) {
            clip_id = matches[1];
        }
    }

    if (clip_id) {
        console.log('Found clip ID: ' + clip_id);
        return clip_id;
    } else {
        return get_static_clip_id();
    }
}

  var clip_id = get_clip_id();

function play_movie_in_xbmc() {
  console.log('Playing video: ' + clip_id);

  var data = encodeURIComponent('{"jsonrpc":"2.0", "method":"Player.Open", "params":{"item":{"file":"plugin://plugin.video.vimeo/?action=play_video&videoid=' + clip_id + '" }}, "id" : 1}');
  $.ajax('http://' + xbmc_address + '/jsonrpc?request=' + data, {
    method: 'GET',
    beforeSend: function() { $('#play_video_in_xbmc').replaceWith('<div id="sending_to_xbmc">Sending to XBMC..</div>'); },
    complete: function() { $('#sending_to_xbmc').replaceWith('<div id="sent_to_xbmc">Sent to XBMC.</div>'); }
  });
}

$(document).ready(function() {    
  $('#video').append('<a id="play_video_in_xbmc" href="#">Play in XBMC</a>');
  $('#play_video_in_xbmc').click(function(evt) {
    play_movie_in_xbmc();
    evt.preventDefault();
  });
});
