
function getCSRFToken() {
    return $("meta[name='_csrf']").attr("content");
}

function getCSRFHeader() {
    return $("meta[name='_csrf_header']").attr("content");
}


function universityAutoComplete() {
    var inputItem = $("input[name='university']");
    $("input[name='university']").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: 'http://universities.hipolabs.com/search?name=' + $(inputItem).val(),
                // url: '/user/test',
                type: 'get',
                crossDomain: true,
                async:true,
                dataType : 'jsonp',
                headers: {'Access-Control-Allow-Origin': '*'},
                beforeSend: function () {
                    console.log("befre " + $(inputItem).val());
                },
                success: function (data) {
                    console.log(data);
                    var list = new Array();
                    var list = new Array();
                    $.each(data, function (i, item) {
                        list.push(item.name + " / " + item.country);
                    });
                    response(list);
                },error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                    console.log(errorThrown)
                    console.log(jqXHR)
                }
            });
        }
    });

}



$(document).ready(function () {

    // autocomplete for university ield
    universityAutoComplete();

    // if the selected value come from backend
    $("select").each(function () {
        var selected = $(this).data("selected")
        if (selected != "" && selected != undefined) {
            $(this).val(selected + "").change();
        }
    });

});