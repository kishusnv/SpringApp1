<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html><head>
 <script src="<c:url value="/resources/js/main.js"/>" ></script>	
</head>
<body>
<div class= "inst">	
<label class="left">
<b>SORT TILE GAME</b><br/>
<b>Instructions:</b><br/>
1.The Sort Game has tiles placed randomly with a description for each tile.A Mouse Hover on 
each tile describes the function it performs.<br/>
2.The Objective of the Sort Game is to arrange the tiles in correct sequence in 90 seconds.<br/>
3.On the left pane,the timer is available.Every wrong move or right move of the user is recorded.<br/>
4.User has the option to select the type of flow. After selecting the flow click on the Start button to begin game.<br/>
5.To restart the game afresh, click the RESET button.</label><br/>
<br/><br/>
<div class= "flowButtons"><input type="radio" name="contactF" id="contactF" value="contact" checked><span class="text">Contract Flow</span></input>
<input   type="radio" name="contactF" id="ncontactF" value="noncontact" ><span class="text">Non Contract Flow</span></input></div>
 </div>
<div class="outerdiv singleblock">
<div class="gameblock" style="width:100%;align:center;float:right">
	<ul id="sortable" class="sortableClass"></ul>
</div>
<div class="buttonPanel">
     <button id="start" class="allButtons" >Start</button>
     <button id="stop" class="allButtons" >Pause</button>
     <button id="reset" class="allButtons">Reset</button>
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