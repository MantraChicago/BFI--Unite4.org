causeListings = """
  <%= j render(:partial=>'city_hubs/partials/cause_listings') %>
"""

container = $('#city-hub-cause-listings')

$(container).empty().html(causeListings)
