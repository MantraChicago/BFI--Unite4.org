var calculateTotal=function(){
    var total = parseInt($('#donation_tip').val(),10) + parseInt($('#donation_amount').val(),10)
    $('#total').html(total)
}

$(document).ready(function(){
    $('#donation_amount,#donation_tip').on("change",function(){
	calculateTotal()
    }).change()
})