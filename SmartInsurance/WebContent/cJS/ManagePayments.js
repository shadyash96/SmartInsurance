function getClientInfo(){
	$("#ClientInfoSubmit").attr("disabled", true);
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
        	document.getElementById("ClientName").value=INFO[1];
        	document.getElementById("ClientNational").value=INFO[2];
        	var ALLInsuranceRequests=data.split("//")[1].split(":");
        	$("#RequestsTable tr").remove(); 
        	for (var i=0;i<ALLInsuranceRequests.length;i++){
        		var InsuranceRequest=ALLInsuranceRequests[i].split(",");
        		if (InsuranceRequest.length<2)
        			continue;
        		var ToBePaid;
        		if (InsuranceRequest[5]=="Cash")
        			ToBePaid=InsuranceRequest[11];
        		else
        			ToBePaid=InsuranceRequest[7];
        		if (InsuranceRequest[10].length<1)
        			continue;
        		var temp="<tr><td>"+InsuranceRequest[10]+"</td>"+
        		"<td>"+InsuranceRequest[0]+" > "+InsuranceRequest[1]+"</td>"+
        		"<td>"+InsuranceRequest[8]+"</td>"+
        		"<td>"+InsuranceRequest[11]+"</td>"+
        		"<td>"+InsuranceRequest[5]+"</td>"+
        		"<td>"+ToBePaid+"</td></tr>";
        		$("#RequestsTable").append(temp);
        		//[1] InsuranceRequests  Split ":" //0_Category, 1_Details, 2_ItemValue, 3_Coverage, 4_Duration, 5_Payment Method, 
    			//6_Installment Duration, 7_Downpayment, 8_Condition, 9_Status, 10_Request_ID, 11_Premium Value, 12_Client_ID
        	}
        	///////////Installments table
        	var ALLInstallments=data.split("//")[2].split(":");
        	$("#InstallmentsTable tr").remove(); 
        	
        	for (var i=0;i<ALLInstallments.length;i++){
        		var Installment=ALLInstallments[i].split(",");
        		if (Installment[0].length<1)
        			continue;
        		var temp="<tr><td>"+Installment[0]+"</td>"+
        		"<td>"+Installment[5]+" > "+Installment[6]+"</td>"+
        		"<td>"+Installment[3]+"</td>"+
        		"<td>"+Installment[4]+" EGP </td></tr>";
        		$("#InstallmentsTable").append(temp);
        		//[2] Installments split ":" //0_Installment_ID, 1_Status, 2_InsuranceID, 3_Payment Date, 4_Payment Value, ,5_Category, 6_Item Details
        		}
        	$("#ClientInfoSubmit").attr("disabled", false);
        	
		
        	        	
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

function MakeInitialPayment(){
	$("#InitialSubmit").attr("disabled", true);
	var fetch="InitialPayment";
	var RequestID=document.getElementById("RequestID").value;
	$.ajax({
        url:'MakePayments',
        type:'POST',
        data: {fetch, RequestID},
        success: function(data){
        	//getClientInfo();
        	document.getElementById("Message").innerHTML=data;
        	setTimeout(function(){
          		document.getElementById("Message").innerHTML="";
          	}, 5000);
        	$("#InitialSubmit").attr("disabled", false);
        }
});
}

function MakeInstallmentPayment(){
	$("#InstallmentSubmit").attr("disabled", true);
	var fetch="InstallmentPayment";
	var InstallmentID=document.getElementById("InstallmentID").value;
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

