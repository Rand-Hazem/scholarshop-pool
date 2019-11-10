function universityAutoComplete() {
    var inputItem = $("input[name='university']");
    // url: 'http://universities.hipolabs.com/search?name=' + $(inputItem).val(),
    $("input[name='university']").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: '/user/test',
                type: 'get',
                crossDomain: true,
                headers: {'Access-Control-Allow-Origin': '*'},
                beforeSend: function () {
                    // console.log("befre " + $(inputItem).val());
                },
                success: function (data) {
                    var list = new Array();
                    console.log(data);
                    // var list = new Array();
                    // $.each(data, function (i, item) {
                    //     list.push(item.name + " / " + item.country);
                    // })
                    list.push("akjsnd")
                    list.push("aomgk")
                    response(list);
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