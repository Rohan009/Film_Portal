scale = {
	init: function(options) {
		if (typeof options !== 'undefined') {
			var options = {};
		}
		scale.applyOptions(options);
	},
	defaultOptions: {
		fireOnPinchIn:true,
		fireOnPinchOut:true,
		fireOnPinch:true,
		fireOnLoad:true,
		fireOnResize:true,
		steps:50,
		img_folder:'/img'
	},
	getOptionsObject: function(options) {
		return $.extend(scale.defaultOptions,options);
	},
	applyOptions: function(options) {
		options = scale.getOptionsObject(scale.getOptionsObject);

		for(var key in options){
			if (options.hasOwnProperty(key)) {
				switch(key){
					case 'fireOnPinchIn':
						if(options[key])$(window).hammer().on("pinchin",scale.latestResizeRefresh);
						break;
					case 'fireOnPinchOut':
						if(options[key])$(window).hammer().on("pinchout",scale.latestResizeRefresh);
						break;
					case 'fireOnLoad':
						if(options[key])$(window).load(scale.readjust);
						break;
					case 'fireOnPinch':
						$(window).hammer().on("pinch",scale.latestResizeRefresh);
						break;
					case 'fireOnResize':
						$(window).resize(scale.latestResizeRefresh);
						break;
					default:
						scale.setOption(key,options[key]);
						break;
				}
			}
		}
	},
	setOption: function(key,value) {
		scale[key] = value;
	},
	readjust: function() {
		$('img').each(function(idx,item){
			if ($(item).attr('data-src')) {
				var width = parseInt($(item).width(),10);
				if ( width == 0 ) {
					width = 300;
				}
				width = Math.floor(width * scale.getZoomRatio() * scale.getDevicePixelRatio());

				if (scale.steps) {
					width = scale.applySteps(width);
				}

				if ( (typeof $(item).attr('current-size') === 'undefined') || (parseInt($(item).attr('current-size')) < width) ) {
					$(item).attr('current-size',width);
					$(item).attr('src',scale.img_folder+'/fleximg_scale/'+width+'/0'+$(item).attr('data-src'));
				}
			}
		});
	},
	applySteps: function(width) {
		if (width%scale.steps) {
			return width+scale.steps-(width%scale.steps);
		}
		return width;
	},
	getZoomRatio: function() {
		var ratio = $(document).width() / window.innerWidth;

		if (isNaN(ratio)) {
			return 1;
		}
		return ratio;
	},
	getDevicePixelRatio: function() {
		var ratio = 1;

		if (typeof window.devicePixelRatio !== 'undefined') {
			ratio = window.devicePixelRatio;
		}
		return ratio;
	},
	latestResizeRefresh: function() {
		if (scale.latestResize === null) {
			setTimeout(scale.latestResizeCheck,scale.wait);
		}
		scale.latestResize = new Date();
	},
	latestResizeCheck: function() {
		if (scale.latestResize !== null) {
			if (scale.latestResize.getTime() + scale.wait < new Date().getTime()) {
				scale.readjust();
				scale.latestResize = null;
			} else {
				setTimeout(scale.latestResizeCheck,scale.wait);
			}
		}
	},
	wait:1000,
	latestResize:null
};