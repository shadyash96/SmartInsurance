window.onload=function(){ // lma el page t5ls load
	var fetch="Categories";
	$.ajax({
        url:'GetData', // bey call servlet getData
        type:'POST',
        data: {fetch}, //<--- dah bytb3t lel servlet
        success: function(data){ //<--- el galy men el servlet
        	var Categories=data.split(",");
        	var CategoriesList=document.getElementById("Categories");
        	CategoriesList.options.length=0;
        	CategoriesList.add(new Option("Select Category"));
            for (var i=0; i<Categories.length-1; i++){
            	var opt = Categories[i];
            	CategoriesList.add(new Option(opt));
            }
            $('#Categories').selectpicker('refresh');
        }
}); // function deh btgeeb el categories w t7otha droplist bta3t el categories
	
}
function CategoryChange(){// lma el category btt3'yr
	var count=0;
	var UsedFieldDivExists=document.getElementById("DivSub"+(count+1));
	while (UsedFieldDivExists!=null){
		//alert("da5l");
		//$('#Sub'+(count+1)).selectpicker('delete');
		UsedFieldDivExists.remove();
		count++;
		UsedFieldDivExists=document.getElementById("DivSub"+(count+1));	
	} //byl3'y lw fe used fields alrdy mawgoda
	var Category=document.getElementById("Categories");
	var SelectedCategory=Category.options[Category.selectedIndex].text; // btgebly el selected category dlw2ty
	var fetch="Subs";
	$.ajax({
        url:'GetData',
        type:'POST',
        data: {fetch, SelectedCategory},
        success: function(data){
        	var Allsubs=data.split("::");
        	var subCategories=[];
        	var dataList=[];
        	for (var i=0; i<Allsubs.length; i++){
        		if (i==0)
        			subCategories[i]=Allsubs[i].split(":")[0];
        		else
        			subCategories[i]=Allsubs[i]
        	} // this loop to get subcategories
        	for (var i=1; i<Allsubs[0].split(":").length; i++){
        		dataList[i-1]=Allsubs[0].split(":")[i];
        	} // this loop to get subcategory 1 data
        	//creating new select Boxes for each subcategory
        	
        	// bn7ot el data bta3t awl sub category fe array esmo dataList
        	// bn7ot asamy el subcategories fe array esm sub categories
        	var myParent = document.getElementById("divCont");
        	var selectList=[];
        	var divContainer=[];
        	for (var i=0;i<subCategories.length;i++){
        		if (subCategories[i].length <=0)
        			continue;
        		//myParent.appendChild(document.createElement("br"));
        		divContainer[i]=document.createElement("div");
        		divContainer[i].appendChild(document.createElement("br"));
        		divContainer[i].id="DivSub"+(i+1);
        		selectList[i]= document.createElement("select");
            	//Create and append select list
            	
        		selectList[i].id = "Sub"+(i+1);
        		selectList[i].classList.add("text-capitalize");
        		selectList[i].classList.add("selectpicker");
        		selectList[i].setAttribute("data-style", "g-select");
        		selectList[i].setAttribute("data-width", "100%");
        		selectList[i].setAttribute("name", subCategories[i]);
        		//var funcName="Sub"+(i+1)+"Change();";
        		var funcName="SubChange("+(i+1)+");";
        		selectList[i].setAttribute("onchange", funcName);
            	//myParent.appendChild(selectList[i]);
        		divContainer[i].appendChild(selectList[i]);
            	selectList[i].add(new Option("Pick "+subCategories[i]));
            	divContainer[i].appendChild(document.createElement("br"));
            	myParent.appendChild(divContainer[i]);
            	$('#Sub'+(i+1)).selectpicker('refresh');
            	//myParent.appendChild(document.createElement("br")); 
        	} // bt3ml dropdown list le kol subcategory
        	//Fill the first SUB
        	for (var i=0;i<dataList.length;i++){
        		selectList[0].add(new Option(dataList[i]));
        		$('#Sub1').selectpicker('refresh');
        	} // betamla el data bta3t awl subcategory
        	if (document.querySelector('input[name="condition"]:checked').value=="used")
        		ConditionChange();
        	getConfigs();
        }
});
}

function SubChange(count){
	//var count=c;
	document.getElementById("ProductPrice").value="";
	var elementExists = document.getElementById("Sub"+(count+1));
	if (elementExists==null){
		getPrice();
		return;
	} // shof lw fe subcategory b3d el enta wa2f 3leha, lw fe load el b3dha lw mafish e7sb el price
	var fetch="Sub_"+count;
	var Category=document.getElementById("Categories");
	var SelectedCategory=Category.options[Category.selectedIndex].text;
	var list={};
	list.fetch=fetch;
	list.SelectedCategory=SelectedCategory;
	for (var i=0;i<count;i++){
		list["Sub"+(i+1)+"Name"]=document.getElementById("Sub"+(i+1)).getAttribute("name"); // esm el field
		var Sub=document.getElementById("Sub"+(i+1));
		var SelectedSub=Sub.options[Sub.selectedIndex].text;
		list["SelectedSub"+(i+1)]=SelectedSub;
	}
	list["Sub"+(count+1)+"Name"]=document.getElementById("Sub"+(count+1)).getAttribute("name");
	
	$.ajax({
        url:'GetData',
        type:'POST',
        data: list,
        success: function(data){
        	var Sub=document.getElementById("Sub"+(count+1));
        	Sub.options.length=0;
        	Sub.add(new Option("Pick "+Sub.getAttribute("name")));
            for (var i=0; i<data.split(",").length-1; i++){
            	//if (!data.split(",")[i].includes(null))
            		Sub.add(new Option(data.split(",")[i]));
            }
            $('#Sub'+(count+1)).selectpicker('refresh');
            clearSelections(count);
        }
});
} // btb3t lel servlet el subcategories el e7na alrdy e5trnaha w betload el subcategory el b3deha 3la asasha
// w lw a5r sub category et3'yrt btgeeb el price 3latool


function clearSelections(count){
	var counter=count+2;
	//=count+1;
	document.getElementById("ProductPrice").value="";
	var elementExists = document.getElementById("Sub"+counter);
	while (elementExists!=null){
	elementExists.selectedIndex=0;
	$('#Sub'+counter).selectpicker('refresh');
	counter++;
	elementExists = document.getElementById("Sub"+counter);
	}
	
} //by3ml clear lel selctions b3d ma el subcategory btt3'yr

function getConfigs(){
	var Category=document.getElementById("Categories");
	var SelectedCategory=Category.options[Category.selectedIndex].text;
	$.ajax({
        url:'GetConfigs',
        type:'POST',
        data: {SelectedCategory},
        success: function(data){
        	//0_Min_Insur_Months, 1_Max_Insur_Months, 2_Min_Insur_Coverage, 3_Max_Insur_Coverage, 4_Min_Inst_Months, 
        	//5_Max_Inst_Months, 6_Inst_Downpayment, 7_Rate, 8_NewPriceMode, 9_UsedPriceMode
        	var InsuranceField=document.getElementById("InsuranceDuration");
        	var CoverageField=document.getElementById("CoveragePercentage");
        	InsuranceField.setAttribute("min",data.split(":")[0]);
        	InsuranceField.setAttribute("max",data.split(":")[1]);
        	CoverageField.setAttribute("min",data.split(":")[2]);
        	CoverageField.setAttribute("max",data.split(":")[3]);
        	//document.querySelector('input[name="PaymentType"]:checked').value=="";
        	var PaymentOptions = document.getElementsByName('PaymentType');
        	var InstallmentCont=document.getElementById("InstallmentCont");
        	if (data.split(":")[5]==0){
        		PaymentOptions[0].checked=true;
        		PaymentOptions[1].disabled=true;
        		InstallmentChange();
        	}
        	else{
        		PaymentOptions[1].disabled=false;
        		document.getElementById("InstallmentDuration").min=data.split(":")[4];
        		document.getElementById("InstallmentDuration").max=data.split(":")[5];
        		document.getElementById("DownpaymentPerc").value=data.split(":")[6]
        	}
        	document.getElementById("rate").value=data.split(":")[7];
        	document.getElementById("NewPriceMode").value=data.split(":")[8];
        	document.getElementById("UsedPriceMode").value=data.split(":")[9];
        	var cond=document.querySelector('input[name="condition"]:checked').value=="new"?"new":"used";
        	if (cond=="new" && document.getElementById("NewPriceMode").value=="auto"){
        			document.getElementById("ProductPrice").readOnly="true";
        			}
        	//ConditionChange();
        }
});
}


function ConditionChange(){
	document.getElementById("ProductPrice").value="";
	var cond=document.querySelector('input[name="condition"]:checked').value=="new"?"new":"used";
	var Category=document.getElementById("Categories");
	var SelectedCategory=Category.options[Category.selectedIndex].text;
	var count=0;
	var UsedFieldDivExists=document.getElementById("UsedFieldDiv"+(count+1));
	while (UsedFieldDivExists!=null){
		UsedFieldDivExists.remove();
		count++;
		UsedFieldDivExists=document.getElementById("UsedFieldDiv"+(count+1));	
	}
	//clear used fields
	
	if (Category.selectedIndex==0)
		return;
	if (cond=="new"){
		if (document.getElementById("NewPriceMode").value=="auto"){
			document.getElementById("ProductPrice").readOnly="true";
			}
		else
			document.getElementById("ProductPrice").readOnly="false";
		document.getElementById("UsedCalculateButton").style.display="none";
		if (Category.selectedIndex!=0){
			getPrice();
			}
		return;
	}
	else{
	$.ajax({
        url:'GetUsedField',
        type:'POST',
        data: {SelectedCategory},
        success: function(data){
        	var AllFields=data.split("::");
        	//creating new select Boxes for each subcategory
        	var myParent = document.getElementById("UsedCont");
        	var divContainer=[];
        	var inputField=[];
        	for (var i=0;i<AllFields.length;i++){
        		//myParent.appendChild(document.createElement("br"));
        		if (AllFields[i].split(":")[0].length<=0)
        			continue;
        		divContainer[i]=document.createElement("div");
        		divContainer[i].id="UsedFieldDiv"+(i+1);
        		divContainer[i].classList.add("form-group");
        		divContainer[i].classList.add("col-md-6");
        		divContainer[i].classList.add("col-sm-6");
        		divContainer[i].classList.add("col-xs-12");
        		inputField[i]=document.createElement("input");
        		inputField[i].id="UsedField"+(i+1);
        		inputField[i].setAttribute("name", AllFields[i].split(":")[0]);
        		inputField[i].setAttribute("type", AllFields[i].split(":")[1]=="int"?"number":"text");
        		inputField[i].setAttribute("placeholder","Enter "+AllFields[i].split(":")[0]);
        		myParent.appendChild(divContainer[i]);
        		divContainer[i].appendChild(inputField[i]);
        	}
        	if (document.getElementById("UsedPriceMode").value=="auto"){
        		document.getElementById("UsedCalculateButton").style.display="block";
        		document.getElementById("ProductPrice").readOnly="true";
        	}
        	else{
        		document.getElementById("UsedCalculateButton").style.display="none";
        		document.getElementById("ProductPrice").readOnly="false";
        	}
        	//getPrice();
        	
        }
});}
}

function getPrice(){
	var count=0;
	var elementExists = document.getElementById("Sub"+(count+1));
	while (elementExists!=null){
		count++;
		elementExists = document.getElementById("Sub"+(count+1));
		}
	var list={};
	var Category=document.getElementById("Categories");
	var SelectedCategory=Category.options[Category.selectedIndex].text;
	list.SelectedCategory=SelectedCategory;
	list.fetch="base";
	var Condition=document.querySelector('input[name="condition"]:checked').value;
	list.Condition=document.querySelector('input[name="condition"]:checked').value;
	for (var i=1;i<=count;i++){
		var Sub=document.getElementById("Sub"+(i));
		list["Sub"+i+"Name"]=document.getElementById("Sub"+i).getAttribute("name");
		var SelectedSub=Sub.options[Sub.selectedIndex].text;
		list["SelectedSub"+i]=SelectedSub;
	}
	list.NewPriceMode=document.getElementById("NewPriceMode").value;
	list.UsedPriceMode=document.getElementById("UsedPriceMode").value;
	list.SubCount=count;
	if (Condition=="used" && document.getElementById("UsedPriceMode").value=="manual"){
		return;
	}
	if (Condition=="new" && document.getElementById("NewPriceMode").value=="manual"){
		return;
	}
	
	// fetch used fields
	if (Condition=="used" && document.getElementById("UsedPriceMode").value=="auto"){
		var countUsed=0;
		var UsedelementExists = document.getElementById("UsedField"+(countUsed+1));
		while (UsedelementExists!=null){
			countUsed++;
			UsedelementExists = document.getElementById("UsedField"+(countUsed+1));
			}
		list.UsedCount=countUsed;
		for (var i=1;i<=countUsed;i++){
			var Used=document.getElementById("UsedField"+(i));
			list["UsedField"+i+"Name"]=document.getElementById("UsedField"+i).getAttribute("name");
			var SelectedUsed=Used.value;
			//alert(SelectedUsed);
			list["SelectedUsedField"+i]=SelectedUsed;
		}
	}
	
	
	$.ajax({
        url:'GetPrice',
        type:'POST',
        data: list,
        success: function(data){
        	if (data.length>20){
        		alert(data);
        		document.getElementById("ProductPrice").readOnly="false";
        		}
        	else	
        		document.getElementById("ProductPrice").value=data;
        }
});
}


function InstallmentChange(){
	var Type=document.querySelector('input[name="PaymentType"]:checked').value;
	var InstallmentCont=document.getElementById("InstallmentCont");
	if (Type=="cash"){
		InstallmentCont.style.display = "none";
	}
	else
		InstallmentCont.style.display = "block";
}

//console.dir(list);.