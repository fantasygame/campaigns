$ ->
  $('.sell').click ->
    sum = 0
    $('.sell:checked').each ->
      price = parseFloat $(@).closest('tr').find('.price').html()
      sum += price
    $('.sum').html(sum)
