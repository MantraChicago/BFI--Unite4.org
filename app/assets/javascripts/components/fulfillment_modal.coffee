$( "body" ).delegate ".open-fulfillment-modal", "click", (e)->
  e.preventDefault()
  $target = $(e.currentTarget).closest('.open-fulfillment-modal')
  need_id = $target.data('need-id')
  type_of_need = $target.data('type-of-need')
  slug = $target.data('cause-slug')
  
  Application.open_need_modal(need_id, type_of_need,slug)

$('.first-sign-in').on "click", (e)->
  if !App.user.attributes.email
    e.preventDefault()
    e.stopPropagation()
    Application.show_login_modal('You need to be logged in to perform this action.')
    



Application.open_need_modal= (need_id, type_of_need,slug )->
  if App.user.attributes.email
    if type_of_need == 'PromotionNeed'
      $.getScript("/causes/new_fullfilment/#{ need_id }", (data)->
        #console.log(data)
      )
    else
      url = "/causes/new_fullfilment/#{ need_id }"
      $('#modalWrapper').foundation(
        'reveal', 
        'open',
        {
          url: url,
          css:{
            open:{
              'background-color':'rgb(249,249,249)'
            }
          }
        }
      )
  else
    Application.show_login_modal('You need to be logged in to help a cause.')
