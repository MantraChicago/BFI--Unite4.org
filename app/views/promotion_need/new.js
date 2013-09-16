FB.ui(
  {
    method: 'feed',
    name: '<%=@need.message %>',
    link: '<%=request.original_url.html_safe %>',
    description: '<%= @need.message %>'
  },
  function(response) {
    if (response && response.post_id) {
      data={
        need_id:<%= @need.id %>,
        user_id:<%= current_user.id %>,
        method: 'facebook'
      }
      $.post('/api/contributions',data,function(){
        //$('.wizard').html($('.success').show())
      })
    } else {
      alert('Post was not published.');
    }
  }
);
