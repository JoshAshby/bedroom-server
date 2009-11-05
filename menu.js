window.addEvent('domready', function(){
	//First Example
	var el = $('menu'),
		color = el.getStyle('background');
	
	// We are setting the opacity of the element to 0.5 and adding two events
	$('menu').set('opacity', 1).addEvents({
		mouseenter: function(){
			// This morphes the opacity and backgroundColor
			this.morph({
				'opacity': 0.8,
				'background': 'url(/Resources/testcopy.png)'
			});
		},
		mouseleave: function(){
			// Morphes back to the original style
			this.morph({
				'opacity': 1,
				'background': color
			});
		}
	});
});
