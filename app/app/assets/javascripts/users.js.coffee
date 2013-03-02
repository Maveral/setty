image = (img, number, fade_time) ->
  $(img).fadeOut fade_time, ->
    $(img)
      .error ->
        alert ("Błąd wczytywania awatara")
      .load ->
        $('#obrazek')
          .append(this)
      .attr('src', 'http://static3.thesettlersonline.pl/sites/default/themes/siedler/images/landing/avatar/big/' + number + '.png')
        .fadeIn fade_time

$ ->
  number = avatar_number
  img = new Image()
  fade_time = 500
  $(image(img, number, fade_time))
  $('#next').click ->
    if number < 60 then number++
    $(image(img, number, fade_time))
    $('#avatar_field').val(number)
  $('#prev').click ->
    if number > 1 then number--
    $(image(img, number, fade_time))
    $('#avatar_field').val(number)