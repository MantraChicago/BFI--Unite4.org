FB.ui(
  {
    method: 'feed',
    name: 'Cause Name / Post headline',
    link: 'https://developers.facebook.com/docs/dialogs/',
    picture: 'http://fbrell.com/f8.jpg',
    caption: 'Subheadline',
    description: 'Message goes hur'
  },
  function(response) {
    if (response && response.post_id) {
      alert('Post was published.');
    } else {
      alert('Post was not published.');
    }
  }
);
