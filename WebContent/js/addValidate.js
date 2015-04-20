function validate(){
	var nameObj=document.formx.name.value;	
	if(!isName(nameObj)){
		document.formx.name.focus();
		return false;
	}
	
    var contObj=document.formx.contentname.value;
	if(!isContent(contObj)){
		document.formx.contentname.focus();
		return false;
	}
	
	var address=document.formx.address.value;
	if(!isAddress(address)){
		document.formx.address.focus();
		return false;
	}
	
	var zipcode=document.formx.zipcode.value;
	if(!isZipcode(zipcode)){
		document.formx.zipcode.focus();
		return false;
	}
	
	var emailObj=document.formx.email.value;
	if(!isEmail(emailObj)){
		document.formx.email.focus();
		return false;
	}
	
	var schoolname1=document.formx.schoolname1.value;
	if(!isEmpty(schoolname1)){
		document.formx.schoolname1.focus();
		alert("school name can not be empty");
		return false;
	}
	
	var location1=document.formx.location1.value;
	if(!isEmpty(location1)){
		document.formx.location1.focus();
		alert("school location can not be empty");
		return false;
	}
	
	var enrollmentDate1=document.formx.enrollmentDate1.value;
	if(!isEmpty(enrollmentDate1)){
		document.formx.enrollmentDate1.focus();
		alert("start date can not be empty");
		return false;
	}
	
	var graduateDate1=document.formx.graduateDate1.value;
	if(!isEmpty(graduateDate1)){
		document.formx.graduateDate1.focus();
		alert("end date can not be empty");
		return false;
	}
	
	var averageGrade1=document.formx.averageGrade1.value;
	if(!isEmpty(averageGrade1)){
		document.formx.averageGrade1.focus();
		alert("average grade can not be empty");
		return false;
	}
	
	var award1=document.formx.award1.value;
	if(!isEmpty(award1)){
		document.formx.award1.focus();
		alert("award can not be empty");
		return false;
	}
	
	var timeofuse1=document.formx.timeofuse1.value;
	if(!isEmpty(timeofuse1)){
		document.formx.timeofuse1.focus();
		alert("time of use can not be empty");
		return false;
	}
	//projectname1
	var projectname1=document.formx.projectname1.value;
	if(!isEmpty(projectname1)){
		document.formx.projectname1.focus();
		alert("project name can not be empty");
		return false;
	}
	
	//project start date
	var pstartDate1=document.formx.pstartDate1.value;
	if(!isEmpty(pstartDate1)){
		document.formx.pstartDate1.focus();
		alert("project start date can not be empty");
		return false;
	}
	
	//pendDate1
	var pendDate1=document.formx.pendDate1.value;
	if(!isEmpty(pendDate1)){
		document.formx.pendDate1.focus();
		alert("project end date can not be empty");
		return false;
	}
	
	//people1
	var people1=document.formx.people1.value;
	if(!isEmpty(people1)){
		document.formx.people1.focus();
		alert("people number can not be empty");
		return false;
	}
	
	//desc1
	var desc1=document.formx.desc1.value;
	if(!isEmpty(desc1)){
		document.formx.desc1.focus();
		alert("project description can not be empty");
		return false;
	}
	
	//companyname1
	var companyname1=document.formx.companyname1.value;
	if(!isEmpty(companyname1)){
		document.formx.companyname1.focus();
		alert("company name can not be empty");
		return false;
	}
	
	//elocation1
	var elocation1=document.formx.elocation1.value;
	if(!isEmpty(elocation1)){
		document.formx.elocation1.focus();
		alert("location can not be empty");
		return false;
	}
	
	//estartDate1
	var estartDate1=document.formx.estartDate1.value;
	if(!isEmpty(estartDate1)){
		document.formx.estartDate1.focus();
		alert("experience start date can not be empty");
		return false;
	}
	
	//eendDate1
	var eendDate1=document.formx.eendDate1.value;
	if(!isEmpty(eendDate1)){
		document.formx.eendDate1.focus();
		alert("experience end date can not be empty");
		return false;
	}
	
	//role1
	var role1=document.formx.role1.value;
	if(!isEmpty(role1)){
		document.formx.role1.focus();
		alert("role can not be empty");
		return false;
	}
	
	//edesc1
	var edesc1=document.formx.edesc1.value;
	if(!isEmpty(edesc1)){
		document.formx.edesc1.focus();
		alert("experience description can not be empty");
		return false;
	}
	return true;
}

//validate empty
function isEmpty(obj){
	if(obj.length==0 ){
		return false;
	}
	return true;
}
//validate name 
function isName(nameObj){
	if(nameObj.length==0 ){
		alert("Please input resume name!");
		return false;
	}
	else if( nameObj.indexOf(" ")>-1){
		alert("resume name can not contain blank space!");
		return false;
	}
	return true;
}
//validate content
function isContent(content){
	if(content.length==0){
		alert("Please input content name!");
		return false;
	}
	return true;
}
//validate address
function isAddress(address){
	if(address.length==0){
		alert("Please input address!");
		return false;
	}
	return true;
}
//validate zipcode
function isZipcode(zipcode){
	var bool=/^\d{5}(-\d{4})?$/.test(zipcode);
	if(!bool){
		alert("Please input valid zip code");
		return false;
	}
	return true;
}

//validate email
function isEmail(emailObj){	
	 if(emailObj.length != 0  ){
        	var i=emailObj.indexOf("@");
        	var j=emailObj.lastIndexOf("@");
        	var k=emailObj.indexOf(".");
        	if(!isEnglish(emailObj)|| i==-1 || k==-1 || i!=j ||i==emailObj.length-1){
        		alert("Email format is not valid!");
				return false;
        	}
	}else{
		alert("Email can not be empty!");
		return false;
	}     	
     return true;   
}

 function isEnglish(obj){
    	if(obj.length==0)
    		return false;
    	for(var i = 0;i<obj.length;i++){
    		if(obj.charCodeAt(i)>128)
    			return false;
    	}
	return true;
}
