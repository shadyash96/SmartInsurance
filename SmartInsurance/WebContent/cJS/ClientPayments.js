window.onload=function(){ getClientInfo();}

function getClientInfo(){
	//$("#ClientInfoSubmit").attr("disabled", true);
	var fetch="getClientInfo";
	var PhoneNo=document.getElementById("PhoneNo").value;
	$.ajax({
        url:'ManagePayments',
        type:'POST',
        data: {fetch, PhoneNo},
        success: function(data){
        	if (data=="Phone Number Doesn't Exist"){
        		alert(data);
        		return;
        	}
        	// Split "/"
        	var INFO=data.split("//")[0].split(",");
        	//[0] split "," INFO 0_ClientID, 1_Name, 2_National ID
        	//document.getElementById("ClientName").value=INFO[1];
        	//document.getElementById("ClientNational").value=INFO[2];
        	var ALLInsuranceRequests=data.split("//")[1].split(":");
        	$("#RequestsTable tr").remove();
        	if (ALLInsuranceRequests[0].length<1){
        		$("#ApprovedRequestFirst tr").remove();
        		$("#ApprovedRequestFirst h5").remove();
        		$("#ApprovedRequestFirst").append("<h5>There are no approved requests</h5>");
        		}
        	else{
        		$("#ApprovedRequestFirst tr").remove();
        		$("#ApprovedRequestFirst").append("<tr>"+
                 "<th>Request ID</th>"+
                 "<th>Item details </th>"+
                 "<th>Condition</th>"+
                 "<th>Premium Value</th>"+
                 "<th>Payment type</th>"+
                 "<th>Need to be Paid</th>"+
                 "<th></th>"+
                "</tr>");
        	}
        	for (var i=0;i<ALLInsuranceRequests.length;i++){
        		var InsuranceRequest=ALLInsuranceRequests[i].split(",");
        		if (InsuranceRequest.length<2)
        			continue;
        		var ToBePaid;
        		if (InsuranceRequest[5].toUpperCase()=="Cash".toUpperCase())
        			ToBePaid=InsuranceRequest[11];
        		else
        			ToBePaid=InsuranceRequest[7];
        		if (InsuranceRequest[10].length<1)
        			continue;
        		var temp="<tr><td class=\"category\">"+InsuranceRequest[10]+"</td>"+
        		"<td class=\"category\">"+InsuranceRequest[0]+" > "+InsuranceRequest[1]+"</td>"+
        		"<td class=\"category\">"+InsuranceRequest[8]+"</td>"+
        		"<td class=\"category\">"+InsuranceRequest[11]+"</td>"+
        		"<td class=\"category\">"+InsuranceRequest[5]+"</td>"+
        		"<td class=\"category\">"+ToBePaid+"</td>"+
        		"<td class=\"category\"><button class=\"btn btn-primary\" onclick=\"MakeInitialPayment('"+InsuranceRequest[10]+"','"+ToBePaid+"')\">Activate Insurance</button></td></tr>";
        		$("#RequestsTable").append(temp);
        		//[1] InsuranceRequests  Split ":" //0_Category, 1_Details, 2_ItemValue, 3_Coverage, 4_Duration, 5_Payment Method, 
    			//6_Installment Duration, 7_Downpayment, 8_Condition, 9_Status, 10_Request_ID, 11_Premium Value, 12_Client_ID
        	}
        	///////////Installments table
        	var ALLInstallments=data.split("//")[2].split(":");
        	$("#InstallmentsTable tr").remove(); 
        	if (ALLInstallments[0].length<1){
        		$("#InstallmentFirst tr").remove();
        		$("#InstallmentFirst h5").remove();
        		$("#InstallmentFirst").append("<h5 id=\"Pending\">There are no pending installments.</h5>");
        		}
        	else{
        		$("#Pending").remove();
        		$("#InstallmentFirst tr").remove();
        		$("#InstallmentFirst").append("<tr>"+
                                                "<th>Installment ID </th>"+
                                                "<th>Item</th>"+
                                                "<th>Inst. date</th>"+
                                                "<th>Value</th>"+
                                                "<th></th>"+
                                            "</tr>");
        	}
        	for (var i=0;i<ALLInstallments.length;i++){
        		var Installment=ALLInstallments[i].split(",");
        		if (Installment[0].length<1)
        			continue;
        		var temp="<tr><td class=\"category\">"+Installment[0]+"</td>"+
        		"<td class=\"category\">"+Installment[5]+" > "+Installment[6]+"</td>"+
        		"<td class=\"category\">"+Installment[3]+"</td>"+
        		"<td class=\"category\">"+Installment[4]+" EGP </td>"+
        		"<td class=\"category\"><button class=\"btn btn-primary\" onclick=\"MakeInstallmentPayment('"+Installment[0]+"','"+Installment[4]+"')\">Pay Installment</button></td></tr>";
        		$("#InstallmentsTable").append(temp);
        		//[2] Installments split ":" //0_Installment_ID, 1_Status, 2_InsuranceID, 3_Payment Date, 4_Payment Value, ,5_Category, 6_Item Details
        		}
    //    	$("#ClientInfoSubmit").attr("disabled", false);
        	
		
        	        	
        }
});
}


$('#RequestID').on('change', function(){
	  var RequestID=$(this).val();
	  var fetch="getInitialPayment";
	  $.ajax({
	        url:'ManagePayments',
	        type:'POST',
	        data: {fetch, RequestID},
	        success: function(data){
	        	if (data=="Request ID Doesn't Exist"){
	        		alert(data);
	        		document.getElementById("InitialValue").value="";
	        		return;
	        		}
	        	document.getElementById("InitialValue").value=data;
	        }
	});
	});

$('#InstallmentID').on('change', function(){
	  var InstallmentID=$(this).val();
	  var fetch="getInstallmentPayment";
	  $.ajax({
	        url:'ManagePayments',
	        type:'POST',
	        data: {fetch, InstallmentID},
	        success: function(data){
	        	if (data=="Installment ID Doesn't Exist"){
	        		alert(data);
	        		document.getElementById("InsallmentValue").value="";
	        		return;
	        		}
	        	document.getElementById("InsallmentValue").value=data;
	        }
	});
	});

function MakeInitialPayment(RequestID, ToBePaid){
	//$("#InitialSubmit").attr("disabled", true);
	var completePayment=confirm("You're going to pay "+ToBePaid+" EGP to activate your insurance.");
	if (completePayment != true) {
		  return;
		}
	var fetch="InitialPayment";
	//var RequestID=document.getElementById("RequestID").value;
	$.ajax({
        url:'MakePayments',
        type:'POST',
        data: {fetch, RequestID},
        success: function(data){
        	getClientInfo();
        	document.getElementById("Message").innerHTML=data;
        	setTimeout(function(){
          		document.getElementById("Message").innerHTML="";
          	}, 5000);
        	//$("#InitialSubmit").attr("disabled", false);
        }
});
}

function MakeInstallmentPayment(InstallmentID, ToBePaid){
	var completePayment=confirm("You're going to pay "+ToBePaid+" EGP installment.");
	if (completePayment != true) {
		  return;
		}
	var fetch="InstallmentPayment";
	//var InstallmentID=document.getElementById("InstallmentID").value;
	$.ajax({
        url:'MakePayments',
        type:'POST',
        data: {fetch, InstallmentID},
        success: function(data){
        	getClientInfo();
        	document.getElementById("Message").innerHTML=data;
        	setTimeout(function(){
          		document.getElementById("Message").innerHTML="";
          	}, 5000);
        	$("#InstallmentSubmit").attr("disabled", false);
        }
});
}

