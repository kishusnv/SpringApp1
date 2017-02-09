<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html><head>
 <script type="">
   $(function() {

		var numberCheck = [];
    var randomnumber ;
    var wrongMoves = 0 ;
    var correctMoves = 0 ;
    var counter = 90;
    var timer = null;
    var checkInitFirstTime = true ;
    
        var dataIncorrectLeft = ['Login Page',
                        'My Cisco Workspace (MCW)',
                        'Order Creation options',
                        'Contract section',
                        'Shipping section',
                        'Billing section',
                        'Delivery options',
                        'Parts detail',
                        'Premium order details',
                        'Save order',
                        'Submit the order',
                           ];
			 var validDataRight = ['Login Page',
                        'Order Creation options',
                        'Contract section',
                        'Shipping section',
                        'Billing section',
                        'Parts detail',  
                        'Save order',
                        'Submit the order',
                           ];

          var sortableIn = 0; 
         $( "#sortable2" ).sortable({
			disabled: true,
            start: function (event, ui) {
            },
            forcePlaceholderSize: false,
            helper: function(e,li) {
              if(sortableIn == 1)  {     
             copyHelper= li.clone().insertAfter(li);
              }  
            return  li.clone();
            },
            receive : function (event, ui)
            {

            },
            stop: function (event, ui) {
            },
            connectWith : "#sortable2, #sortable3" 
         });
         $( "#sortable3" ).sortable({
            connectWith : " #sortable3" , 
            receive : function (event, ui)
            {
				//   test(ui.item[0].className);
                // If it is invalid then remove
                 if(sortableIn == 1)  {  
                ui.item.remove(); 
                 }
            },
			 stop: function( event, ui ) {
       
			}
         });
  
     initInSequenceGame(dataIncorrectLeft,validDataRight);
    
	$('span.loosingSpan').css('color','red');
	$('span.winningSpan').css('color','#22B14C');
	$('span.loosingSpan').hide();
	$('span.winningSpan').hide();
    
   
    
    //Initialize blocks in original sequence
    function initInSequenceGame(dataIncorrectLeft,validDataRight){
    	$('#sortable2').html('');
		$('#sortable2').html('');
    	randomnumber = '' ;
    	numberCheck = [];
	     // Populate the UL container with 11 squares
	alert(dataIncorrectLeft.length);
		 for (var i = 1; i <= dataIncorrectLeft.length; i++) {
                 $('#sortable2').append("<li class="+ i +"><div class='alldivs div_"+i +"' ><span class='allspan span_"+i +"'>" + dataIncorrectLeft[(i-1)] + "</span></div></li>");
		 }	
		 for (var i = 1; i <= validDataRight.length; i++) {
                 $('#sortable3').append("<li class="+ i +"><div class='alldivs div_"+i +"' ><span class='allspan span_"+i +"'>" + validDataRight[(i-1)] + "</span></div></li>");
		 }
	     mouseInOut();
	     $('div.alldivs').css('background-color','#22B14C');
    }
 
 // Initialize blocks in random way
    function initGame(dataIncorrectLeft){
    	$('#sortable2').html('');
		$('#sortable3').html('');
    	randomnumber = '' ;
    	numberCheck = [];
		alert(dataIncorrectLeft.length());
		// Populate the UL container with 11 squares
	     for (var i = 0; i <= dataIncorrectLeft.length; i++) {
		  		do{
		  		 randomnumber=Math.ceil(Math.random() *  dataIncorrectLeft.length)	;
		  		}while(jQuery.inArray( randomnumber, numberCheck ) != -1)
		  		numberCheck.push(randomnumber);
                 $('#sortable2').append("<li class="+ randomnumber +"><div class='alldivs div_"+randomnumber +"' ><span class='allspan span_"+randomnumber +"'>" + dataIncorrectLeft[(randomnumber - 1)] + "</span></div></li>");
		 }
	     mouseInOut();
	     $('div.alldivs').css('background-color','#0B0B61');
    }

    function test(indexNumber){
    	if (checkSequence(indexNumber)){
		     $('#stop').trigger('click');
		     $('#start').attr('disabled','true');
		     $('span.winningSpan').show();
		     $('span.loosingSpan').hide();
		     $('span.correctMove').hide();
	    		$('span.wrongMove').hide();
		     $('div.alldivs').css('background-color','#22B14C');
    	}else{
    		 $('span.winningSpan').hide();
    	     $('span.loosingSpan').hide();
    		//$('div.alldivs').css('background-color','red');
        }
    }
    
    function checkSequence(indexNumber){
    	$('div.alldivs').css('background-color','#0B0B61');
		var correctSequence = [];
		var currentSequence = [];
		var changeBoxColor = [];
		var changeBoxColorCorrectSequecne = [];
		var checkSeq = true ; 
		$('#sortable li').each(function(i){
			currentSequence.push($(this).attr('class'));
		});
		correctSequence = currentSequence.slice(0) ;
		changeBoxColor = currentSequence.slice(0) ;
		changeBoxColorCorrectSequecne = changeBoxColor.slice(0) ;
		changeBoxColorCorrectSequecne = changeBoxColorCorrectSequecne.sort(function(a,b){return (a-b);});
		for(var i=0; i < changeBoxColorCorrectSequecne.length ;i ++){
			if(changeBoxColorCorrectSequecne[i] == changeBoxColor[i] && checkSeq){
				$("."+(i+1)).find('div').css('background-color','#22B14C');
			}else{
				checkSeq = false ;
			}			
		}
		
		correctSequence = correctSequence.sort(function(a,b){return (a-b);});
		var index = currentSequence.indexOf(indexNumber);
	    if(correctSequence.slice(0,(index+1)).join(',') == currentSequence.slice(0,(index+1)).join(',')){
    		correctMoves++ ;
    		$("span.correctMoves").text(correctMoves);
    		$('span.wrongMove').hide();
    		$('span.correctMove').show();
	    }else{
	    	wrongMoves ++ ;
    		$("span.wrongMoves").text(wrongMoves);
    		$('span.correctMove').hide();
    		$('span.wrongMove').show();
	    }
	    
		return (correctSequence.join(',') == currentSequence.join(','));
	}
      

    function tictac(){
    	if(counter > 0){
            counter--;
            $(".showTime").text(counter);
    	}else{
    		
    		$(".sortableClass").each(function(){
    			  $(this).sortable({ disabled: true });
    		});
      	   
    		 $('span.loosingSpan').show();
    		 $('#stop').attr('disabled','true');
    	}
    }

    $('#stop').attr('disabled','true');
    $('#reset').click(function(){ 
    	correctMoves = 0 ;
    	wrongMoves = 0;
    	clearInterval(timer);
    	counter=90;
        $(".showTime").text(counter);
        $("span.wrongMoves").text('0');
        $("span.correctMoves").text('0');
        $('#stop').attr('disabled','true');
        $('#start').removeAttr('disabled','false');
        $('span.winningSpan').hide();
        $('span.loosingSpan').hide();
        $('span.wrongMove').hide();
	    $('span.correctMove').hide();
        initInSequenceGame();
        checkInitFirstTime = true ;
	   $(".sortableClass").each(function(){
			  $(this).sortable({ disabled: true });
		});
      //  $( "#sortable" ).sortable({ disabled: true });
    });
    
   $('#start').click(function(){   
	   if(checkInitFirstTime){
	   initGame();
	   checkInitFirstTime = false ;
	   }
	   $(".sortableClass").each(function(){
			  $(this).sortable({ disabled: false });
		});
	  // $( "#sortable" ).sortable({ disabled: false });
	   $('#stop').removeAttr('disabled','false');
	   $('#start').attr('disabled','true');
	   timer= setInterval(tictac, 1000);
    });
   
   $('#stop').click(function(){
  	 $('#stop').attr('disabled','true');
  	 $('#start').removeAttr('disabled','false');
  	$(".sortableClass").each(function(){
		  $(this).sortable({ disabled: true });
	});
	//$( "#sortable" ).sortable({ disabled: true });
        clearInterval(timer);
        $('span.loosingSpan').hide();
    });
    

	function mouseInOut(){
	   $( "li" ).mouseover(function() {
		   var findClass = $(this).attr('class');
		   var textTofill = $('div.toolTips span.toolTip_'+findClass).text();
		   $('#catchTootip').html(textTofill);
	   })
	   .mouseout(function() {
		   $('#catchTootip').html('');
	   });
	   
	   $( "img" ).mouseover(function() {
		   var findimg = $(this).attr('id');
		   var imgTofill = 'imgs/'+findimg+'.png' ;
		   $('#catchTootip').html('<img src="' + imgTofill + '" class="bigImages"  />');
	   })
	   .mouseout(function() {
		   $('#catchTootip').html('');
	   });
	}

      });
   </script>
</head>
<body>
<div class= "inst">	
<label class="left">
<b>SORT TILE GAME</b><br/>
<b>Instructions:</b><br/>
1.The Sort Game has tiles placed randomly with a description for each tile.A Mouse Hover on 
each tile describes the function it performs.<br/>
2.The Objective of the Sort Game is to arrange the tiles in correct sequence in 90 seconds.<br/>
3.On the Right pane,the timer is available.Every wrong move or right move of the user is recorded.<br/>
4.User has the option to select the type of flow. After selecting the flow click on the Start button to begin game.<br/>
5.To restart the game afresh, click the RESET button.</label><br/>
<br/><br/>
<div class= "flowButtons"><input type="radio" name="contactF" id="contactF" value="contact" checked><span class="text">Contract Flow</span></input>
<input type="radio" name="contactF" id="ncontactF" value="noncontact" ><span class="text">Non Contract Flow</span></input></div>
 </div>
<div class="outerdiv multipleblock">
<div class="gameblock" style="width:100%;align:center;float:right">
	<ul id="sortable2" class="sortableClass"></ul>
</div>
<div class="buttonPanel">
     <button id="start" class="allButtons" >Start</button>
     <button id="stop" class="allButtons" >Pause</button>
     <button id="reset" class="allButtons">Reset</button>
    </div>
</div>
<div class="outerdiv multipleblock">
<div class="gameblock" style="width:100%;align:center;float:right">
	<ul id="sortable3" class="sortableClass"></ul>
</div>
</div>
<div class="toolTips"> 
	<span class="toolTip_1">
	The login page manages the valid entry of the user to the Home Page. As per the access level to the user profile there shall be options to create, search, resolve or modify the orders and search for various kinds of parts.
	<br/> 
	</span>
	<span class="toolTip_2">
        My Cisco Workspace (MCW) is the personalized landing page for the user. On this page there are options to continue order creation, view order history, open saved orders and locate orders. The page is custom made and users can add or reduce the options on this page. 
	<br/>
	</span>
	<span class="toolTip_3">
        To further begin with RMA creation the user has the option of beginning with contract related information or with his already existing orders which can be directly copied. The user can also create a non-contract order if he is not having an appropiate agreement to create a RMA as per his/her requirement.
      	</span>
	<span class="toolTip_4">
	Once the order creation is initiated, there are few sections in which the user has to fill the relevant information. First section contains contract details which is static as per the contract.
        <br/>
        </span>
	<span class="toolTip_5">
        Next section is Shipping section where it is mandatory to provide a delivery address. The address may be chosen from the saved address database or can a one-time address.
        <br/>
	</span>
	<span class="toolTip_6">
        A Biling section may be required to be filled by user in case of a non contract order. Users have to enter details regarding the billing in this section.
        <br/>
	</span>
	<span class="toolTip_7">
        In the Delivery section users can choose one of the service level options from advance replacment, MFG order, demo depot, return and replace, spares on site, premium parts only or premium parts or labour. The first 4 types are standard orders while the last 3 types are premium orders. Depending upon the nature of contract and terms of billing the contract can be upgraded or downgraded.
	<br/>
        </span>
	<span class="toolTip_8">
        In this section, user has the option to choose configured parts or individual miscellaneous parts as per one's requirement. Users can also search parts using the view parts tool. Partial or complete order option is also provided to the user in case of more than a single part.
        <br/>
	</span>
	<span class="toolTip_9">
	In the Premium section, order details have to be given only when users choose one of the following delivery options viz. spares on site, premium parts only, premium parts and labour. Additionaly, if the order is under the contract then on-site field service is available and the user has to opt and provide information accordingly.  
	<br/>
        </span>
	<span class="toolTip_10">
	Once the order is saved a temporary order number is created which can be used later to edit the order.
	<br/>
        </span>
	<span class="toolTip_11">
        Once the order is submitted an order number is generated which then can be used by the user to track their order.
	</span>
</div>
</body></html>