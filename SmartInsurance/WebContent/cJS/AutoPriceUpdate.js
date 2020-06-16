function ActivateCarUpdate(){
	 $.ajax({
		 url : 'CallCarUpdate',
         type : 'POST',
         success : function() {
             alert("Car Prices Are Being Updated Every 6 hours");
             redirect('AutoPriceUpdate','Insurer');
         }
     });
}

function DeactivateCarUpdate(){
	var fetch="deactivate";
	 $.ajax({
		 url : 'CallCarUpdate',
        type : 'POST',
        data: {fetch},
        success : function() {
            alert("Car Prices Won't update Automatically");
            redirect('AutoPriceUpdate','Insurer');
        }
    });
}
function redirect(page,type){
	var form = document.createElement("form");
    document.body.appendChild(form);
    $(form).append("<input type='hidden' name='page' value='"+page+"'>");
    $(form).append("<input type='hidden' name='type' value='"+type+"'>");
    form.action="Redirect";
    form.method="post";
    form.submit();
    $(form).remove();
}