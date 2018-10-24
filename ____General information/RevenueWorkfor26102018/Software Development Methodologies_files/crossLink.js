var _clItemClassName = 'crossLinkItem';
var _clItemIdPrefix = 'crossLinkItem_';

var _clItemClassRegEx = new RegExp('\W*' + _clItemClassName + '\W*', 'gi');
var _clItemIdRegEx = new RegExp('^' + _clItemIdPrefix + '([0-9]+)_([0-9]+)$', 'gi');

var _clIdsArr = new Array();

$(document).ready(function()
	{
		$('span.'+_clItemClassName).each(function()
			{
				tmpId = this.id;
				if(_clIdsArr[tmpId] != -1)
				{			
					_clIdsArr[tmpId] = new Array();	
					linkid = tmpId.replace(_clItemIdRegEx, '$1');
					_clIdsArr[tmpId].push(linkid);	
					$(this).parentsUntil(document.body).each(function()
						{
							if(this.className == _clItemClassName || _clItemClassRegEx.test(this.className))
							{
								linkid = this.id.replace(_clItemIdRegEx, '$1');
								_clIdsArr[tmpId].push(linkid);
								_clIdsArr[this.id] = -1;
							}
						}
					);
				}
			}
		);
		$('span.'+_clItemClassName).each(function()
			{
				tmpId = this.id;
				if(_clIdsArr[tmpId] != -1)
				{
					$(this).qtip({
						content: {
							url: '/showLink.php',
							data: { id: _clIdsArr[tmpId].join(':') },
							method: 'get'
						},
						hide: { 
							when: 'mouseout', 
							fixed: true, 
							delay: 200
						},
						position: {
							corner: {
								target: 'topRight',
								tooltip: 'bottomLeft'
							}
						},
						style: 
						{ 
							width: 250,
							padding: 5,
							/*background: '#A2D959',
							color: 'black',*/
							textAlign: 'left',
							border: {
								width: 7,
								radius: 5
								/*color: '#A2D959'*/
							},
							name: 'cream', // Inherit the rest of the attributes from the preset dark style
							tip: 'bottomLeft'
						}
					});
				}
			}
		);
	}
);