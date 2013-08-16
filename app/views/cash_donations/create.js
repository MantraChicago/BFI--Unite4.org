<% if @fulfillment.valid? %>
  $('.donation_amount').html('$'+<%=@fulfillment.amount %>)
  $('.wizard').html($('.success').show())
<% else %>

<% end %>