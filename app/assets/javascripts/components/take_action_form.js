$('.index-search').submit(function(event){
    event.preventDefault();
    var cause_type=$(this).find('#cause_type_cause').val()
    var has_need= $(this).find('[name="has_need"]').val()
    var city = $(this).find('[name="city"]').val()

    var url="/charities-in-"+city+'?has_need='+$(this).find('[name="has_need"]').val()+'&cause_type_id='+cause_type
    window.location=url
  })