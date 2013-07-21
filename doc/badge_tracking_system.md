# Badge Tracking

Users are awarded badges for actions they take on the site, including simply consuming the site's content.

In order to award badges, we will rely on two data sources:

1) needs fulfillment objects
2) event tracking data, including for example:
  - viewing a page on a site
  - viewing a cause video

The event tracking data is made possible through the `Unite::Events` server side code, and the `Unite.EventTracker` client side javascript
which allows us to track arbitrary events in Javascript.

## Tracking Anonymous User Activity

Users who visit the site anonymously without logging in, are stil assigned a unique tracking token throughout the site.  When a user logs in
or registers, this token value will persist and will join at some later point with the user id.  We can use this token to track
previously anonymous / unidentified activity on the site and attribute it to the user for the purpose of awarding badges.

## General Event Tracking Integration

Since as this project grows, we will deepen our integration with other third party event tracking utilities such as customer.io, google analytics, and kiss metrics, I advise using analytics.js to capture all event tracking related code in a single place, and add the calls to our internal system within there.

# TODO
#
# Show examples of using the Javascript Tracking Client
#
# Show examples of event aggregation and attribution 
