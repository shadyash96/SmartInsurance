function randomString(length, chars) {
    var result = '';
    for (var i = length; i > 0; --i) result += chars[Math.round(Math.random() * (chars.length - 1))];
    return result;
}

function GenerateToken(){
	var fetch="CreateToken";
	var token=randomString(5, '0123456789abcdefghijklmnopqrstuvwxyz');
	$.ajax({
        url:'InsurerRegister',
        type:'POST',
        data: {fetch, token},
        success: function(){ 
        	var d = new Date();
        	document.getElementById("Token").innerHTML=token;
        	document.getElementById("Message").innerHTML="Token is valid for 10 minutes from "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()
        }
});
}