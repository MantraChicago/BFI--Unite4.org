$(document).ready(function(){
  $('.delete-cause-image').click(function(){
    var self=this
    var cause_slug= $(this).attr('data-cause_slug')
    var id= $(this).attr('data-cause_image_id')
    $.ajax({
      url: '/causes/'+cause_slug+'/edit/delete_cause_image',
      type: 'POST',
      data:{cause_slug:cause_slug,
            id: id},
      success: function(result) {
          $(self).remove()
      }
  });
  })
})