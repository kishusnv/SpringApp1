  $(function() {
    var numberCheck = [];
    var randomnumber ;
    var wrongMoves = 0 ;
    var correctMoves = 0 ;
    var counter = 90;
    var timer = null;
    var checkInitFirstTime = true ;
    
    var originaArrangedlData = ['Login Page',
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
         
    
    $( "#sortable" ).sortable({
     	  disabled: true ,
          stop: function( event, ui ) {
          test(ui.item[0].className);}
    });
    
    $( "#sortable" ).disableSelection();

    initInSequenceGame();
    
	$('span.loosingSpan').css('color','red');
	$('span.winningSpan').css('color','#22B14C');
	$('span.loosingSpan').hide();
	$('span.winningSpan').hide();
    
    // Initialize blocks in random way
    function initGame(){
    	$('#sortable').html('');
    	randomnumber = '' ;
    	numberCheck = [];
		//alert(document.getElementById('contactF').checked);
		if(document.getElementById('contactF').checked){
		originaArrangedlData = ['Login Page',
                        'My Cisco Workspace (MCW)',
                        'Order Creation options',
                        'Contract section',
                        'Shipping section',
                        'Delivery options',
                        'Parts detail',
                        'Premium order details',
                        'Submit the order',
                           ];
		// Populate the UL container with 11 squares
	     for (var i = 0; i < 9; i++) {
		  		do{
		  		 randomnumber=Math.ceil(Math.random() * 9)	;
		  		}while(jQuery.inArray( randomnumber, numberCheck ) != -1)
		  		numberCheck.push(randomnumber);
                 $('#sortable').append("<li class="+ randomnumber +"><div class='alldivs div_"+randomnumber +"' ><span class='allspan span_"+randomnumber +"'>" + originaArrangedlData[(randomnumber - 1)] + "</span></div></li>");
		 }
		}else{
		originaArrangedlData = ['Login Page',
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
						   // Populate the UL container with 11 squares
	     for (var i = 0; i < 11; i++) {
		  		do{
		  		 randomnumber=Math.ceil(Math.random() * 11)	;
		  		}while(jQuery.inArray( randomnumber, numberCheck ) != -1)
		  		numberCheck.push(randomnumber);
                 $('#sortable').append("<li class="+ randomnumber +"><div class='alldivs div_"+randomnumber +"' ><span class='allspan span_"+randomnumber +"'>" + originaArrangedlData[(randomnumber - 1)] + "</span></div></li>");
		 }
		}
		//alert($('#contactF').checked);
	     
	     mouseInOut();
	     $('div.alldivs').css('background-color','#0B0B61');
    }
    
    //Initialize blocks in original sequence
    function initInSequenceGame(){
    	$('#sortable').html('');
    	randomnumber = '' ;
    	numberCheck = [];
	     // Populate the UL container with 11 squares
		 if(document.getElementById('contactF').checked){
		 originaArrangedlData = ['Login Page',
                        'My Cisco Workspace (MCW)',
                        'Order Creation options',
                        'Contract section',
                        'Shipping section',
                        'Delivery options',
                        'Parts detail',
                        'Premium order details',
                        'Submit the order',
                           ];
		 for (var i = 1; i < 10; i++) {
                 $('#sortable').append("<li class="+ i +"><div class='alldivs div_"+i +"' ><span class='allspan span_"+i +"'>" + originaArrangedlData[(i-1)] + "</span></div></li>");
		 }
		 }else{
		 	originaArrangedlData = ['Login Page',
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
	     for (var i = 1; i < 12; i++) {
                 $('#sortable').append("<li class="+ i +"><div class='alldivs div_"+i +"' ><span class='allspan span_"+i +"'>" + originaArrangedlData[(i-1)] + "</span></div></li>");
		 }
		 }
	     mouseInOut();
	     $('div.alldivs').css('background-color','#22B14C');
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
		$('#contactF').removeAttr('disabled','true');
	   $('#ncontactF').removeAttr('disabled','true');
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
	   $('#contactF').attr('disabled','true');
	   $('#ncontactF').attr('disabled','true');
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