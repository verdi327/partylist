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

// var playlistSongs = []

// interval(1000, function(){
//   var that = this;
//   $.get("/playlist", function(response) {
//     that.playlistSongs = JSON.parse(response).songs
//     // Update dom elements
//   });
// });

// var currentSongIndex = 0;

// function currentSong(songIndex) {
//   return gon.songs[songIndex];
// }

// var tag = document.createElement('script');

// tag.src = "https://www.youtube.com/iframe_api";
// var firstScriptTag = document.getElementsByTagName('script')[0];
// firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// // This function creates an <iframe> (and YouTube player)
// //    after the API code downloads.
// var player;
// function onYouTubeIframeAPIReady() {
//   player = new YT.Player('player', {
//     height: '390',
//     width: '640',
//     videoId: currentSong(currentSongIndex),
//     events: {
//       'onStateChange': onPlayerStateChange
//     }
//   });
// }

// //The API calls this function when the player's state changes.
// function onPlayerStateChange(event) {
//   console.log(event)
//   if (event.data == YT.PlayerState.ENDED) {
//     currentSongIndex = currentSongIndex + 1;
//     event.target.loadVideoById(currentSong(currentSongIndex));
//   }
// }