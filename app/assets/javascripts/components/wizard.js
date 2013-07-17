!function ($) {
    $.fn.MT_wizard = function(direction) {
      var parentWizard=$(this).closest('.wizard')
      //console.log(direction)
      var nextActive

      nextActive = parentWizard.find('.active').removeClass('active')[direction]().addClass('active')

      parentWizard.find('.button-next,.button-previous').show()

      if(nextActive.prev().size()==0){
        parentWizard.find('.button-previous').hide()
      }
      if(nextActive.next().size()==0){
        parentWizard.find('.button-next').hide()
      }

        
    }

  $(document).on('click', '.wizard .button-next, .wizard .button-previous', function (e) {
    e.preventDefault()
    var element= $(this)
    if(element.hasClass('button-next')){
      element.MT_wizard('next')
    }else{
      element.MT_wizard('prev')
    }
    
  })

}(jQuery);