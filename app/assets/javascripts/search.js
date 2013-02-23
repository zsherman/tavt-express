$(function() {
  $(".car-lookup form").bind("ajax:success", function(xhr, d, status) {
    $('.make').text(d.make);
    $('.model').text(d.model);
    $('.year').text(d.year);
    $('.vin').text(d.vin);
    $('.value').text(d.value);
  });
});
