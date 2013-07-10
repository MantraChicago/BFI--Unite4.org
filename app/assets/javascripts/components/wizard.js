!function ($) {
    $.fn.MT_wizard = function(direction) {
      var parentWizard=$(this).closest('.wizard')
      console.log(direction)
      var nextActive
      if(direction == 'next'){
        nextActive = parentWizard.find('.active').removeClass('active').next().addClass('active')
      }else{
        nextActive = parentWizard.find('.active').removeClass('active').prev().addClass('active')
      }
      if(nextActive.prev().size()==0){
        parentWizard.find('.button-previous').hide()
      }else if(nextActive.next().size()==0){
        parentWizard.find('.button-next').hide()
      }else{
        parentWizard.find('.button-next,.button-previous').show()
      }
        
    }

  $(document).on('click', '.wizard .button-next, .wizard .button-previous', function (e) {
    e.preventDefault()
    var element= $(this)
    if(element.hasClass('button-next')){
      element.MT_wizard('next')
    }else{
      element.MT_wizard('previous')
    }
    
  })

}(jQuery);