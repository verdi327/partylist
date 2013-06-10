// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function currentSong() {
  if ($.cookie("playlist")){
    var i = +$.cookie("song_index");
    var songs = $.cookie("playlist").split(",");
    if (i === songs.length) {
      $.cookie("song_index", 0);
      i = $.cookie("song_index");
    };
    return songs[i];
  }
  else {return null}
}

function addSong(youtube_id) {
  if ($.cookie("playlist")) {
    var songs = $.cookie("playlist").split(",");
    songs.push(youtube_id);
    $.cookie("playlist", songs);
  }
  else {
    $.cookie("playlist", youtube_id);
    $.cookie("song_index", 0);
    onYouTubeIframeAPIReady()
  }
}

function removeSong(youtube_id) {
  var songs = $.cookie("playlist").split(",");
  songs.splice(songs.indexOf(youtube_id), 1);
  $.cookie("playlist", songs)
}

function play(youtube_id){
  var songs = $.cookie("playlist").split(",");
  var i = songs.indexOf(youtube_id);
  $.cookie("song_index", i);
  player.loadVideoById(youtube_id)
}

// Need to understand how the onYouTubeIframeAPIReady function works
// The proper youtube_id is being returned, but I don't think you can just
// call the player and it will reload?

var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
function onYouTubeIframeAPIReady() {
  var song = currentSong()
  if (song){
    player = new YT.Player('player', {
      height: '390',
      width: '640',
      videoId: song,
      playerVars: {autoplay:1},
      events: { 'onStateChange': onPlayerStateChange }
    });
  }
}

function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.ENDED) {
    var i = +$.cookie("song_index") + 1;
    $.cookie("song_index", i);
    event.target.loadVideoById(currentSong());
  }
}

