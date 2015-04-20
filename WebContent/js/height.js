			var winW= 1024;
			var winH = 600;
			function updateDisplaySize()
			{
				if (parseInt(navigator.appVersion)>3) 
				{
					if (navigator.appName=="Netscape") 
					{
						winW = window.innerWidth-16;
						winH = window.innerHeight-16;
					}else if (navigator.appName.indexOf("Microsoft")!=-1) 
					{
						winW = document.body.offsetWidth-20;
						winH = document.body.offsetHeight-20;
					}
				}
				document.getElementById("mainTableInThisPage").style.height=winH-65;
			}
			
			
			var win =null;
			function NewWindow(mypage,myname,w,h,scroll){
				LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
				TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
				settings ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
				win =window.open(mypage,myname,settings)
			}
			function change()
			{
				//先插入状态
				for(var i=0;i<8;i++)
				{
					var j=i+1;
					var hv=document.getElementById('sss'+j).value;
					if(hv.length==0)
					{
						//不变
					}
					else
					{
						show_switch2(j);
					}
				}
			}
			
			function product(path,userid){
				var obj = document.getElementById('code');
				var cate = document.getElementById('cate');
				
				obj.value='<script type="text/javascript" src="'+path+'/js/message.js?u='+userid+'&c='+cate.value+'" charset="gb2312">\</script>';
				document.getElementById('cpButton').style.display='';		
			}