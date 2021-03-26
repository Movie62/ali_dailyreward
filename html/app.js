$("#box").hide();

window.onload = function(e) {
    window.addEventListener('message', function(event) {
        let data = event.data
        $("#box").show();
       //  document.getElementById("title").textContent = data.title;
    })
} 

$("#submit").click(function() {
    $("#box").hide();

    $.post("http://ali_dailyreward/join", JSON.stringify({
        
    }));
});


$("#cancel").click(function() {
    $("#box").hide();
    $.post("http://ali_dailyreward/exit", JSON.stringify({

    }));
});