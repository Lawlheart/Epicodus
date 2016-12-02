function showContactForm() {
    $("#new-contact-button").addClass("animated hinge");
    $("#new-contact-form").removeClass("hidden").addClass("animated slideInUp");
}

function openAddressModal(name, id) {
    $('#new-address-modal').removeClass('hidden').addClass("animated slideInUp");
    $('#modal-shadow').removeClass('hidden');
    $('#new-address-target').text(name);
    $('#new-address-contact-id').val(id);
}

function openPhoneModal(name, id) {
    $('#new-phone-modal').removeClass('hidden').addClass("animated slideInUp");
    $('#modal-shadow').removeClass('hidden');
    $('#new-phone-target').text(name);
    $('#new-phone-contact-id').val(id);
}

$('body').on('click', '#modal-close', function(e) {
    e.preventDefault();
    $('.alt-modal').addClass('hidden');
    $('#modal-shadow').addClass('hidden');
});