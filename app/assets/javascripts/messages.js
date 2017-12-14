$(function() {
  function new_message(data) {
    var chatImage = '';
    if (data.image.url) {
      chatImage = `<img src="${data.image.url}">`;
    }
    var new_message = $('<div class= "chatwindow__body__fields__message">' +
                '<div class = "chatwindow__body__fields__message-name">' + data.name + '</div>' +
                '<div class = "chatwindow__body__fields__message-time">' + data.time + '</div>' +
                '<div class = "chatwindow__body__fields__message-content">' +
                '<div class = "chatwindow__body__fields__message-content__text">' + data.content +  '</div>' +
                '<div class = "chatwindow__body__fields__message_content__image">' + chatImage + '</div>' +
                '</div>' +
                '</div>');
    return new_message;
  }


  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    var chat_url = $(this).attr("action");
    $('.ajax_messageform__content').val('');
    $('.ajax_messageform__image').val('');
    // $('.chatwindow__messenger__form__sent').prop('disabled', false);
    $.ajax({
      type: 'POST',
      url: chat_url,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(data) {
      var html = new_message(data);
      $('.chatwindow__body__fields').append(html);
      $('.chatwindow__body').animate({scrollTop: $('.chatwindow__body')[0].scrollHeight}, 'fast');
    })
    .fail(function(data) {
      alert('メッセージを入力してください');
    });
    return false;
  });



});
