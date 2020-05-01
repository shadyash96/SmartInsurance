window.onload=function(){
	var fetch="Categories";
	$.ajax({
        url:'GetData',
        type:'POST',
        data: {fetch},
        success: function(data){
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
});
	
}
function CategoryChange(){
		
	var Category=document.getElementById("Categories");
	var SelectedCategory=Category.options[Category.selectedIndex].text;
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
        	var myParent = document.getElementById("divCont");
        	var selectList=[];
        	for (var i=0;i<subCategories.length;i++){
        		myParent.appendChild(document.createElement("br"));
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
            	myParent.appendChild(selectList[i]);
            	selectList[i].add(new Option("Pick "+subCategories[i]));
            	$('#Sub'+(i+1)).selectpicker('refresh');
            	myParent.appendChild(document.createElement("br"));
        	}
        	//Fill the first SUB
        	for (var i=0;i<dataList.length;i++){
        		selectList[0].add(new Option(dataList[i]));
        		$('#Sub1').selectpicker('refresh');
        	}
        }
});
}

function SubChange(count){
	//var count=c;
	var elementExists = document.getElementById("Sub"+(count+1));
	if (elementExists==null){
		getPrice(count);
		return;
	}
	var fetch="Sub_"+count;
	var Category=document.getElementById("Categories");
	var SelectedCategory=Category.options[Category.selectedIndex].text;
	var list={};
	list.fetch=fetch;
	list.SelectedCategory=SelectedCategory;
	for (var i=0;i<count;i++){
		list["Sub"+(i+1)+"Name"]=document.getElementById("Sub"+(i+1)).getAttribute("name");
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
}


function clearSelections(count){
	var counter=count+2;
	//=count+1;
	var elementExists = document.getElementById("Sub"+counter);
	while (elementExists!=null){
	elementExists.selectedIndex=0;
	$('#Sub'+counter).selectpicker('refresh');
	counter++;
	elementExists = document.getElementById("Sub"+counter);
	}
	
}

function ConditionChange(cond){
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
		if (Category.selectedIndex!=0)
			getPrice();
		return;
	}
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
        	getPrice();
        	
        }
});
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
	list.condition=document.querySelector('input[name="condition"]:checked').value;
	for (var i=1;i<=count;i++){
		var Sub=document.getElementById("Sub"+(i));
		list["Sub"+i+"Name"]=document.getElementById("Sub"+i).getAttribute("name");
		var SelectedSub=Sub.options[Sub.selectedIndex].text;
		list["SelectedSub"+i]=SelectedSub;
	}
	
	/*$.ajax({
        url:'GetData',
        type:'POST',
        data: {fetch, SelectedCategory},
        success: function(data){
        	alert(count);
        }
});*/
}



//console.dir(list);