
/* uses forEach from JS 1.6; should be supported in all modern browsers */
/*
would really like to place traffic light somewhere else on slide
but am constrained by fact that this runs in an iframe, which 
presumably even prevents accessing object defined outside 
*/
var TrafficLight = function () {
	var img = function (path) {
		// console.debug(path);
		// debugger;
        let elem = document.createElement('img');
        elem.src=path;
        return elem;

        //return $('<img src="'+ path +'">').load();
    }
	var place = function (image) {document.body.append(image);}
    var position = function (image) {
        image.style.top= `${top}px`;
        image.style.left= `${left}px`;
        image.style.position= 'fixed';
    }
    
	var top = 150; var left = 600;
	var current;  // index of light currently showing
	
	var images = [img("red.gif"), img("yellow.gif"), img("green.gif")];
	images.forEach(place); 
	images.forEach(position); 

	// show light with index k
	var show = function (k) {
		current = k;
		for (var i = 0; i < images.length; i++)
		 images[i].style.opacity= i===k ? 1 : 0;
		}

	show(0); // initially show red

	var that = {};
	that.red = function () {show(0);}
	that.yellow = function () {show(1);}
	that.green = function () {show(2);}
	that.next = function () {current = (current + 1)%3; show(current);}

	Object.freeze(that);
	return that;
	};