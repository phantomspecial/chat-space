$(function(){
  function buildHTML(comment){
    var html = `<p>
            <strong>
              <a href=${message.id}>${message.user_name}</a>
              ：
            </strong>
            ${message.content}
          </p>`
    return html;
  }
  $('#ajax_messageform').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/messages'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html)
      $('.chatwindow__messenger__form__textbox').val('')
      $('.chatwindow__messenger__form__imagebox-label').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
});
