/* ========= Contact input file facade ========= */

var $fakeUpload = $('#fake-upload');
var $trueUpload = $('#user_avatar');
var $fakeUploadTrigger = $('#fake-trigger');

var triggerFile = function(e){
  e.preventDefault();
  $trueUpload.click();
}

$fakeUpload.on('click', triggerFile);
$fakeUploadTrigger.on('click', triggerFile);

$trueUpload.on('change', function(){
  var value = $(this).val();
  var sansFakeValue = value.replace(/[Cc]:[\/\\]fakepath[\/\\]/, '');
  $fakeUpload.val(sansFakeValue);
})
