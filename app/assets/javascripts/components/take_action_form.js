$('.index-search').submit(function(event){
    event.preventDefault();
    var cause_type_id=$(this).find('[name="cause_type"]').val()
    var city = $(this).find('[name="city"]').val()

    var url="/charities-in-"+city+'?cause_type_id='+cause_type_id
    window.location=url
  })