function showContactForm() {
    $("#new-contact-button").addClass("animated hinge");
    $("#new-contact-form").removeClass("hidden").addClass("animated slideInUp");
}

function openAddressModal(name, id) {
    console.log(name);
    $('#new-address-modal').removeClass('hidden').addClass("animated slideInUp");
    $('#modal-shadow').removeClass('hidden');
    $('#new-address-target').text(name);
    $('#new-address-contact-id').val(id);
}


$('body').on('click', '#modal-close', function(e) {
    e.preventDefault();
    $('.alt-modal').addClass('hidden');
    $('#modal-shadow').addClass('hidden');
});