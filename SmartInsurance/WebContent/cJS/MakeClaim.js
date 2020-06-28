function validateForm(){
	if (document.getElementById("Items").selectedIndex==-1){
		alert ("Please select an insured item");
		return false;
	}
	//alert("1");
	if($("#description").val().trim().length < 4){
	    alert("Please fill incident description");
	    return false; 
	} 
	//alert("2");
	var re = /^(http[s]?:\/\/){0,1}(www\.){1,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;
	if (document.getElementById("DocumentsLink").length<3 || !re.test(document.getElementById("DocumentsLink").value)) { 
	    alert("Please enter a valid URL in Documents Link");
	    return false;
	}
	//alert("3");
	if (document.getElementById("ClaimValue").value<1){
		alert ("Please enter a claim value");
		return false;
	}
	return true;
}
