$(document).ready(function(){
 
function next(){
        $(".activeslide").removeClass("activeslide").addClass("inactive");
        if(!$(".inactive").is(":last-child")){
        	$(".inactive").next().addClass("activeslide");
        	 $(".inactive").removeClass("inactive");
        }else{
        	
        	 $(".slide").first().addClass("activeslide");
        	 $(".inactive").removeClass("inactive");
        }
     var current= $(".activeslide").index();
    $(".numerate_item").each(function(){
        	 if(current == $(this).index()){
        	 	$(this).addClass("numerate_active");
        	 }else{
        	 	$(this).removeClass("numerate_active");
        	 }
        });
        
}


//slide-show
$(".slide").first().addClass("activeslide");

// arrow next
$(".arrow_next").click(next);

//arrow prev
$(".arrow_previous").click(function(){
         
        $(".activeslide").removeClass("activeslide").addClass("inactive");

        if(!$(".inactive").is(":first-child")){
        	$(".inactive").prev().addClass("activeslide");
        	 $(".inactive").removeClass("inactive");
        }else{
        	
        	 $(".slide").last().addClass("activeslide");
        	 $(".inactive").removeClass("inactive");
        }
        
        var current= $(".activeslide").index();
        $(".numerate_item").each(function(){
        	 if(current == $(this).index()){
        	 	$(this).addClass("numerate_active");
        	 }else{
        	 	$(this).removeClass("numerate_active");
        	 }
        });

});
 
// slide-show
setInterval(next, 3000);




});