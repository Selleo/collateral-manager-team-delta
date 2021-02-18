//= require active_admin/base

$(document).ready(function () {
    $(function () {
        $("#sortable").sortable({});
        $("#sortable").disableSelection();
    });

    $("button")
        .last()
        .on()
        .click((e) => {
            e.preventDefault();

            const inputs = $(".drag");

            inputs.each(function (index, value) {
                console.log(index + ": " + $(this).text(), value);
                const currInput = inputs[index];
                $(value).html(index + 1);
            });
            $(".lead").submit();
        });
});