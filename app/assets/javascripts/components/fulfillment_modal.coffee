$('.open-fulfillment-modal').on "click", (e)->
  $target = $(e.currentTarget).closest('.open-fulfillment-modal')
  need_id = $target.data('need-id')
  type_of_need = $target.data('type-of-need')
  slug = $target.data('cause-slug')
  Application.open_need_modal(need_id, type_of_need,slug)



Application.open_need_modal= (need_id, type_of_need,slug )->
  if App.user.attributes.email
    
    url = "/causes/#{ slug }/#{ type_of_need }/new?partial=true&need_id=#{ need_id }"

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
