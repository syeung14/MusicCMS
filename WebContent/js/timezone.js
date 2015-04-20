var loc;
var loc_timezoneOffset=new Date();
var loc_ts=loc_timezoneOffset.toString();
var loc_patern=/^(.+) (GMT.+)$/;
var match=loc_ts.match(loc_patern);
loc=match[2];
function OutputLoc(){
	document.write(loc);
}
var zone_patern=/\d{1,4}\-\d{1,2}\-\d{1,2} \d{1,2}:\d{1,2}/g;
	function timeParse(timeString,pattern){
	    var date=new Date();
	    var match=timeString.trim().match(pattern);
	    date.setYear(parseInt(match[1],10));
	    date.setMonth(parseInt(match[2],10)-1);
	    date.setDate(parseInt(match[3],10));
	    date.setHours(parseInt(match[4],10));
	    date.setMinutes(parseInt(match[5],10));
	    date.setSeconds(0);
	    return date;
	}
	function calculateTime(val){
		var patern=/^(\d{1,4})\-(\d{1,2})\-(\d{1,2}) (\d{1,2}):(\d{1,2})$/;
		var d = new Date();
		var gmtHours = d.getTimezoneOffset()/60;
		var firstDate=timeParse(val,patern);
		////console.info('firstDate is: '+firstDate);
		var secondDate = new Date(firstDate.valueOf()-gmtHours*60*60*1000);
		var results=secondDate.getFullYear()
		+((secondDate.getMonth()+1<10)?"-0":"-")
		+(secondDate.getMonth()+1)
		+((secondDate.getDate()<10)?"-0":"-")
		+secondDate.getDate()
		+((secondDate.getHours()<10)?" 0":" ")
		+secondDate.getHours()
		+((secondDate.getMinutes()<10)?":0":":")
		+secondDate.getMinutes();
		////console.info("results is:"+results);
		return results;
	}
	function toreplace(tableid){
		//console.info('tableid is'+ tableid);
		var tableId=document.getElementById(tableid);
		if(typeof tableId == "undefined" || tableId==null)return;
		var nl=tableId.childNodes;
		for(var i=0;i<nl.length;i++){
			////console.info(nl[i].tagName);
			////console.info('length is '+nl.length);
			if(nl[i].tagName=="TBODY"){
				var tbody=nl[i];
				var trs=tbody.childNodes;
				for(var j=0;j<trs.length;j++){
					////console.info(trs[j].tagName);
					var tds=trs[j].childNodes;
					for(var k=0;k<tds.length;k++){
						////console.info('intext is'+ tds[k].innerHTML);
						var intext=tds[k].innerHTML;
						//temp solution
						if(typeof intext != "undefined"){
							intext = intext.replace(/\s+/g," ");
						}
						if(typeof intext != "undefined" && intext.search(zone_patern)!=-1 && tds[k].id!="detail_td" && tds[k].id!="comment_td"){
							//console.info('success');
							 var arr=intext.match(zone_patern);
							// //console.info('arr size is ' +arr.length);
							 for(var m=0;m<arr.length;m++)
					         {
						       //  //console.info('arr'+i+' is: '+arr[i]);
								 intext=intext.replace(arr[m],calculateTime(arr[m]));
								// //console.info('intext is: '+intext);
					         }
							 tds[k].innerHTML=intext;
						}
					}	
				}
			}
		}
	}
