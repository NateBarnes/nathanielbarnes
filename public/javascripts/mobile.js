$(document).ready(function() {
    $("body").css("display", "none");
 
    $("body").fadeIn(500);
 
    $("a").click(function(event){
        event.preventDefault();
        linkLocation = this.href;
        $("body").fadeOut(500, redirectPage);      
    });

    $("li").click(function(event){
        event.preventDefault();
        linkLocation = this.children(":first").href;
        $("body").fadeOut(500, redirectPage);      
    });
         
    function redirectPage() {
        window.location = linkLocation;
    }
});
