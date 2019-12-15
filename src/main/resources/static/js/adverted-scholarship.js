function setMaxCharacterForParagraph(selector, maxLength){
    $(selector).each(function(f){
        length = $(this).text().length;
        if(length > maxLength){
            $(this).text($(this).text().substring(0, maxLength)+"...");
        }
    });
}


$(document).ready(function () {

    setMaxCharacterForParagraph($(".adverted-scholarship-node .title"), 30);
});