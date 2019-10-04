function openNameSuggestion() {
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
}