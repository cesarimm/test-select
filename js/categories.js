$(document).ready(function () {
    console.log('ready!');

    drawSelect();
});

function drawSelect() {
    $.ajax({
        url: 'php/getCategories.php',
        error: function (p1, p2, p3) {
            estadoDefault();
            alert('Error: ' + p3);
        },
        success: function (data, status, jqXHR) {
            result = JSON.parse(data);
            categories = result.categories;
            console.log(categories);
            categories.forEach((element) => {
                text = '';
                for (i = 0; i < element.level; i++) {
                    text += '* ';
                }

                var o = new Option(text + element.categoryName, element.idCategory);
                /// jquerify the DOM object 'o' so we can use the html method
                $(o).html(text + element.categoryName);
                $('#category-select').append(o);
            });
        },
    });
}
