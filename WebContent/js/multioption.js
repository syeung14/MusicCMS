function moveAll(num, e1, e2) {
	try {
		for (var i = 0; i < e1.options.length; i++) {
			var e = e1.options[i];
			e2.options.add(new Option(e.text, e.value));
			e1.remove(i);
			i = i - 1;
		}
		document.formx.utv.value = getvalue(document.formx.list2);
	} catch (e) {
	}
}
function moveOption(num, e1, e2) {
	try {
		for (var i = 0; i < e1.options.length; i++) {
			if (e1.options[i].selected) {
				var e = e1.options[i];
				e2.options.add(new Option(e.text, e.value));
				e1.remove(i);
				i = i - 1;
			}
		}
		document.formx.utv.value = getvalue(document.formx.list2);
		//alert(document.formx.utv.value);
	} catch (e) {
	}
}
function getvalue(geto) {
	var allvalue = "";
	for (var i = 0; i < geto.options.length; i++) {
		allvalue += geto.options[i].value;
		if (i < geto.options.length - 1) {
			allvalue += ",";
		}
	}
	return allvalue;
}