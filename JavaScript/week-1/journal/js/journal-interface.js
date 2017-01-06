var Entry = require('./../js/journal.js').Entry;

$(document).ready(function() {
  $('#new-entry-form').submit(function(event) {
    event.preventDefault();
    var title = $('#title').val();
    var body = $('#body').val();
    var entry = new Entry(title, body);
    $('#journal').append(`
      <div class="card cyan white-text">
        <div class="card-content">
          <span class="card-title">${entry.title}</span>
          <p>${entry.body}</p>
          <h6 class="label cyan-text text-darken-4">Meta Details</h6>
          <p>Vowels: ${entry.vowels()}</p>
          <p>Consonants: ${entry.consonants()}</p>
          <p>Teaser: ${entry.getTeaser()}</p>
        </div>
      </div>`);
      $('#title').val("");
      $('#body').val("");
  });

});
