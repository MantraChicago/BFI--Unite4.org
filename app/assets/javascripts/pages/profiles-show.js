/*
 * Tab behaviour for user profiles pages
 *
 * This does not handle landing on different tabs
 *
 * It also assumes the user lands by default in the 
 * "About me" tab
 *
 * */



var $aBasics = $('#a-basics');
var $aStats = $('#a-stats');
var $userData = $('#user-data');
var $userBadges = $('#user-badges');


$aBasics.on('click', function(){
  $(this).addClass('active');
  $aStats.removeClass('active');

  $userData.removeClass('hide');
  $userBadges.addClass('hide');
});

$aStats.on('click', function(){
  $(this).addClass('active');
  $aBasics.removeClass('active');

  $userBadges.removeClass('hide');
  $userData.addClass('hide');
});
