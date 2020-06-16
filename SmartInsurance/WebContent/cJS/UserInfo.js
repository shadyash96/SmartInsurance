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
        	var form = document.createElement("form");
            document.body.appendChild(form);
            $(form).append("<input type='hidden' name='ClientID' value='"+INFO[0]+"'>");
            $(form).append("<input type='hidden' name='type' value='UserInfo'>");
            form.action="Redirect";
            form.method="post";
            form.submit();
            $(form).remove();
        	        	
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

