//= require active_admin/base

$(document).ready(function () {
    let wasInitialized = false;

    $(".button.has_many_add").on('click', function () {
        setTimeout(() => {
            if (!wasInitialized) {
                $(".lead_tags .inputs").sortable({});
                $(".lead_tags .inputs").disableSelection();
            } else {
                $(".lead_tags .inputs").sortable('refresh');
            }
        }, 500);
    });

    if ($(".lead_tags .inputs").length) {
        $(".lead_tags .inputs").sortable({});
        $(".lead_tags .inputs").disableSelection();
        wasInitialized = true;
    }

    $("#lead_submit_action").on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();

        $(".lead_tags .inputs").each((function (index, el) {
            $(el).find('li.hidden.input input').val(index);
        }));

        $('form.lead').trigger('submit');
    });
});