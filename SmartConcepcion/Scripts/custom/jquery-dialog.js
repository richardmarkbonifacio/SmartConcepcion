function openNameSuggestion(from) {
    $("#dlgNameSuggestion").dialog({
        height: "auto",
        width:"400px",
        modal: true,
        show: {
            effect: "drop",
            duration: 500
        },
        hide: {
            effect: "drop",
            duration: 500
        }
    });
    $("#dlgNameSuggestion").parent().appendTo($("form:first"));
    $("#MainContent_hfFrom").val(from);
}

function openHealthRecord() {
    $("#dlgHealthRecord").dialog({
        height: "auto",
        width: "400px",
        modal: true,
        show: {
            effect: "drop",
            duration: 500
        },
        hide: {
            effect: "drop",
            duration: 500
        }
    });
    $("#dlgHealthRecord").parent().appendTo($("form:first"));
    
}