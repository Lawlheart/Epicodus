$(document).ready(function() {
    var $phrase = $("#phrase").html();
    var $word = $("#word").html();
    var $partials = $("#partials").html();

    var $output = $("#phrase-output");
    if($partials === "true") {
        var output = $phrase.split(" ").map(function(word) {
            var re = new RegExp("(" + $word + ")", "i");
            return word.replace(re, "<span class='highlighted'>$1</span>");
        }).join(" ");
    } else {
        var output = $phrase.split(" ").map(function(word) {
            if(word.toLowerCase().replace(/[^a-z ]/g, '') === $word.toLowerCase()) {
                return "<span class='highlighted'>" + word +"</span>"
            } else {
                return word;
            }
        }).join(" ");
    }
    $output.html(output)

});

