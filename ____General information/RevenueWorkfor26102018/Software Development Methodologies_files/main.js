function reload_image(id, mysrc)
{
	var rand_value = Math.floor(Math.random()*200);
	document.getElementById(id).src=mysrc+'?'+rand_value;
}
function goto_node(id)
{
	expandToItem('pagesTree','litreenode_'+id); 
	setTimeout("document.getElementById('treenode_"+id+"').style.fontSize = '12pt';", 200);
	setTimeout("document.getElementById('treenode_"+id+"').style.fontSize = '';", 1000);
}

function selectCategory(id)
{
	var newId = 'node'+id;
	if(document.getElementById(newId) && document.getElementById(newId).value == id)
		return;
	var newDiv = document.createElement('div');
	newDiv.setAttribute('id', newId+'Div');
	var html = document.getElementById('nodeBlankDiv').innerHTML;
	html = html.replace(/nodeBlank/g, newId);
	newDiv.innerHTML = html;
	document.getElementById('parentsCnt').appendChild(newDiv);
	document.getElementById(newId).value = id;
	var newTxt = document.getElementById('treenode_'+id).innerHTML;
	document.getElementById(newId+'Txt').innerHTML = newTxt;
	return false;
}

function removeNode(id)
{
	try
	{
		var p = document.getElementById(id).parentNode;
		p.removeChild(document.getElementById(id));

	}
	catch(err)
	{
		document.getElementById(id).style.display = 'none';
		if(document.getElementById(id).innerHTML)
			document.getElementById(id).innerHTML = '';
		if(document.getElementById(id).value)
			document.getElementById(id).value = '';
	}
}

function showHideTr(elem_id, value)
{

	var nav_name = navigator.appName;
	if(nav_name.indexOf('Microsoft') == -1)
		show_val = 'table-row';
	else
		show_val = 'inline';

	elem = document.getElementById(elem_id);
	if(elem == null)
		return;
	if(value == null && elem.style.display == 'none')
		value = 1;
	else
		value = 0;
	
	if(value == 1) //list item
	{	
		elem.style.display = show_val;
	}
	else
	{
			elem.style.display = 'none';
	}
}

function showHide(elem_id, value)
{
	elem = document.getElementById(elem_id);
	if(elem == null)
		return;
	if(value == null && elem.style.display == 'none')
		value = 1;
	else
		value = 0;
	
	if(value == 1) //list item
	{	
		elem.style.display = 'inline';
	}
	else
	{
			elem.style.display = 'none';
	}
}

function openInsertLink(tname, sessid)
{
	url = rootUrl+'insert_link.php?t='+tname+'&sessid='+sessid;
	window.open(url, "insertLink", "modal,width=750,height=250,scrollbars=yes,dependent=yes,toolbar=no,location=no").focus();
}
function openInsertFile(field_name, sessid) 
{
	var url = rootUrl+'fm_index.php?sessid='+sessid+'&tbname='+field_name;
	window.open(url, "file_manager", "modal,width=750,height=500,scrollbars=yes,dependent=yes,toolbar=no,location=no").focus();
}
