    $(document).ready(function(){
    	
    	//foundation reveal
    	$(this).foundation('reveal',
    			{	  
    				  animation: 'fadeAndPop',
    				  animation_speed: 250,
    				  close_on_background_click: true,
    				  dismiss_modal_class: 'close-reveal-modal',
    				  bg_class: 'reveal-modal-bg',
    				  bg : $('.reveal-modal-bg'),
    				  css : {
    				    open : {
    				      'opacity': 0,
    				      'visibility': 'visible',
    				      'display' : 'block'
    				    },
    				    close : {
    				      'opacity': 1,
    				      'visibility': 'hidden',
    				      'display': 'none'
    				    }
    				  },
    				  closed: function () {
    					  window.location.replace($(location).attr("href"));
        				},
    				}		
    	);
    	
    	
    	
    	
    	//rating submit by AJAX
    	$('body').on('click','#rSubmit',function(){
    		var container = {};
    		var parent = $(this).parent().parent().parent().parent().parent().parent();
    		container["pid"] = parent.attr("id");
    		container["rt"] = parent.find("#rating").val();
    		ajax(container);
    		
    	});
    	
    	
    	
    	function ajax(p){
    		var request = $.ajax({
    			  url: "/Product_Rating_System/Details",
    			  type: "POST",
    			  data: p,
    			  dataType: "json"
    			});
    			 
    			request.done(function( data ) {
    				console.log(data);
    			  if(data!=null){	
    				if(data.UserSession!=null){
    					UserSessionUpdate(data.UserSession);
    				}
    				if(data.GlobalProAvge!=null){
    					AverageUpdate(data.GlobalProAvge);
    				}
    				if(data.GlobalProCount!=null){
    					CountUpate(data.GlobalProCount);
    				}
    				if(data.GlobalRating!=null){
    					RatingHistogramUpdate(data.GlobalRating);
    				}
    			  }
    			  else{
    				  alert("Fecth Json data error!");
    			  }
    			});
    			 
    			request.fail(function( jqXHR, textStatus ) {
    			  alert( "Request failed: " + textStatus );
    			});
    		
    	}
    	
    	//update user session only
    	function UserSessionUpdate(object){
    		if(object[$(".Pro_detail").attr("id")]!==null){
				$('.inputzone').fadeOut(function(){1000,$(this).empty();$(this).append("<h6>Your Rating: "+ object[$(".Pro_detail").attr("id")]).fadeIn(500);});
			}	
    	}
    	
    	//update production average 
    	function AverageUpdate(object){
    		if(object[$(".Pro_detail").attr("id")]!==null){
				$('.average').fadeOut(function(){1000,$(this).empty();$(this).append("<h5><small>Average Ratings: "+parseFloat(object[$(".Pro_detail").attr("id")]).toFixed(1)+"</small></h5>").fadeIn(500);});
    		
    		}
    		
    	}
    	
    	//update count
    	function CountUpate(object){
    		if(object[$(".Pro_detail").attr("id")]!==null){
				$('.count').fadeOut(function(){1000,$(this).empty();$(this).append("<h5><small>Total No of Ratings: "+object[$(".Pro_detail").attr("id")]+"</small></h5>").fadeIn(500);});
    		}
    	}
    	
    	//update rating histogram
    	function RatingHistogramUpdate(object){
    		if(object[$(".Pro_detail").attr("id")]!==null){
    			$('.disc').fadeOut(function(){
    					1000,
    					$(this).empty();
    					$.each(object[$(".Pro_detail").attr("id")], function (key, value) {
        					$('.disc').append("<li>Rate "+key+ ": " +value+"</li>").fadeIn(500);
        			});
    					
    			
    			});
    			
    			
    			
    			
    		}
    		
    	}
    	
    	
    	
    });
