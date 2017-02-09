<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div  class = '"menu'>
<div class="dashboard">
<table class="leftPanel">
 	<tr style="height: 200px;">
 	<td style="background-color: #f8f8f8;">
	 	<div class="leftTopPanel">
		 	 <table style="width:100% ;"><tr>
		 	  <td><div class="timePanel"><table style="height: 50px;width:100% ;"><tr><td style="width:165px;"><span class="topPanleFont">Time Left</span></td><td  style="width:40px;" ;><span class="rightSideValues showTime">90</span></td></tr></table></div>
		 	 </td></tr>
		 	 <tr><td>
				  <table style="width:100% ;">
				  <tr style="height: 30px;"><td style="width:165px ;"><span class="topPanleFont">Wrong Moves </span></td><td  style="width:40px ;"><span class="rightSideValues wrongMoves">0</span><td></tr>
				  <tr style="height: 30px;"><td style="width:165px ;"><span class="topPanleFont">Correct Moves </span></td><td style="width:40px;"><span class="rightSideValues correctMoves">0</span></td></tr>
				  <!--<tr style="height: 30px;"><td></td></tr>-->
				  <tr style="height: 30px;"><td style="width:100%; text-align: center;"><span class="topPanleFont correctMove">Correct Move</span><span class="topPanleFont wrongMove">Wrong Move</span></td></tr>
				 <!-- <tr style="height: 30px;"><td></td></tr>-->
				  <tr style="height: 30px;"><td style="width:100%; text-align: center;"><span class="topPanleFont winningSpan">Excellent... You Won The Game !!</span><span class="topPanleFont loosingSpan">Ahh... You Lost The Game !!</span></td></tr> </table>
		 	  </td></tr>

		 	 </table>
	 	</div>
 	</td></tr>
  </table>
  </div><div class="rightSidePanle"><div id="catchTootip"></div></div>
</div>
</body>
</html>