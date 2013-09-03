<% if @fulfillment.valid? %>
  $('.donation_amount').html('$'+<%=@fulfillment.total_amount/100 %>)
  $('.wizard').html($('.success').show())
<% else %>

<% end %>