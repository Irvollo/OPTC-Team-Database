$(document).on('turbolinks:load', function() {});
jQuery(function() {
    var fights;
    fights = $('#search_fight_id').html();
    console.log(fights);
    return $('#search_level_id').change(function() {
      var level, options;
      level = $('#search_level_id :selected').text();
      options = $(fights).filter("optgroup[label=" + level + "]").html();
      console.log(options);
      if (options) {
        return $('#search_fight_id').html(options);
      } else {
        return $('#search_fight_id').empty();
      }
    });
  });