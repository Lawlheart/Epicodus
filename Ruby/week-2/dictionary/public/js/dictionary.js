function showNewWordForm() {
    $("#new-word-button").addClass("animated hinge");
    $("#new-word-form").removeClass("hidden").addClass("animated slideInUp");
}

function openModal(modalName, wordName, wordId) {
    $('#modal-shadow').removeClass('hidden');
    $('#new-' + modalName + '-modal').removeClass('hidden').addClass("animated slideInUp");
    $('#new-' + modalName + '-target').text(wordName);
    $('#new-' + modalName + '-word-id').val(wordId);
}

$('body').on('click', '#modal-close', function(e) {
    e.preventDefault();
    $('.modal-input').val("");
    $('.alt-modal').addClass('hidden');
    $('#modal-shadow').addClass('hidden');
});

// function editMode() {
//     $emb = $("#edit-mode-button");
//     if($emb.hasClass("editing")) {
//         $('div.edit-mode').addClass('hidden').addClass("animated slideOutUp");
//     } else {
//         $('div.edit-mode').removeClass('hidden').addClass("animated slideInUp");
//     }
//     $emb.toggleClass('editing');
// }

