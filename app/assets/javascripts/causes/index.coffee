Application.causes = ->
  $('.open-fulfillment-modal').on "click", (e)->
    $target = $(e.currentTarget).closest('.open-fulfillment-modal')
    need_id = $target.data('need-id')
    type_of_need = $target.data('type-of-need')
    slug = $target.data('cause-slug')

    Application.modals[type_of_need]({slug,need_id})

