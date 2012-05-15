$(document).ready(function() {
  $("#feed_item_kind").change(function(e) {
    $("input[data-enable-on]").each(function() {
      $(this).attr('disabled', 'disabled');
    });

    $("input[data-enable-on="+$(e.target).val()+"]").removeAttr('disabled');
  });

  var enable = $("#feed_item_kind").val();
  $("input[data-enable-on="+enable+"]").removeAttr('disabled');
});
