function showContactForm() {
    $("#new-contact-button").addClass("animated hinge");
    $("#new-contact-form").removeClass("hidden").addClass("animated slideInUp");
}

function openModal(modalName, contactName, contactId) {
    $('#modal-shadow').removeClass('hidden');
    $('#new-' + modalName + '-modal').removeClass('hidden').addClass("animated slideInUp");
    $('#new-' + modalName + '-target').text(contactName);
    $('#new-' + modalName + '-contact-id').val(contactId);
}

$('body').on('click', '#modal-close', function(e) {
    e.preventDefault();
    $('.alt-modal').addClass('hidden');
    $('#modal-shadow').addClass('hidden');
});