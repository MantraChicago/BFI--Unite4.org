$('.index-search').submit(function(event){
    event.preventDefault();
    var cause_type=$(this).find('#cause_type_cause').val()
    var city = $(this).find('[name="city"]').val()

    var url="/charities-in-"+city+'?cause_type_id='+cause_type
    window.location=url
  })