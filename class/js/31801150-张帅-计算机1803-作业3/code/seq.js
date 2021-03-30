Seq = function () {	
	var c = 0;
	return {
		get: function () {return c;},
		up: function () {c++;},
		down: function () {c--;},
		}
	}
    seq = Seq();
    seq.up();
    seq.up();
    seq.get();






