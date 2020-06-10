window.onload=function(){ // lma el page t5ls load
	var fetch="Categories";
	$.ajax({
        url:'GetData', // bey call servlet getData
        type:'POST',
        data: {fetch}, // <--- dah bytb3t lel servlet
        success: function(data){ // <--- el galy men el servlet
        	var Categories=data.split(",");
        	var CategoriesList=document.getElementById("Categories");
        	CategoriesList.options.length=0;
        	//CategoriesList.add(new Option("Select Category"));
            for (var i=0; i<Categories.length-1; i++){
            	var opt = Categories[i];
            	CategoriesList.add(new Option(opt));
            }
           // $('#Categories').selectpicker('refresh');
            getConfigs();
        }
}); 
	}

function getConfigs(){
	var Category=document.getElementById("Categories");
	var SelectedCategory=Category.options[Category.selectedIndex].text;
	$.ajax({
        url:'GetConfigs',
        type:'POST',
        data: {SelectedCategory},
        success: function(data){
        	// 0_Min_Insur_Months, 1_Max_Insur_Months, 2_Min_Insur_Coverage,
			// 3_Max_Insur_Coverage, 4_Min_Inst_Months,
        	// 5_Max_Inst_Months, 6_Inst_Downpayment, 7_Rate, 8_NewPriceMode,
			// 9_UsedPriceMode, 10_Inst_interest_month
        	document.getElementById("Rate").value=data.split(":")[7];
        	
        }
});
}