jQuery(function() {
  $(window).on('shown.bs.modal', function() {
    var fights;
    fights = $('#run_fight_id').html();
    console.log(fights);
    return $('#run_level_id').change(function() {
      var level, options;
      level = $('#run_level_id :selected').text();
      options = $(fights).filter("optgroup[label=" + level + "]").html();
      console.log(options);
      if (options) {
        return $('#run_fight_id').html(options);
      } else {
        return $('#run_fight_id').empty();
      }
    });
  });
  
  $(window).on('hidden.bs.modal', function() { 
    $('#run-modal').remove();
  });
  
  
});