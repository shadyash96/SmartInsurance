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

function UserRedirect(clientID){
	var form = document.createElement("form");
	form.target = "_blank"
    document.body.appendChild(form);
    $(form).append("<input type='hidden' name='ClientID' value='"+clientID+"'>");
    $(form).append("<input type='hidden' name='type' value='UserInfo'>");
    form.action="Redirect";
    form.method="post";
    form.submit();
    $(form).remove();
}