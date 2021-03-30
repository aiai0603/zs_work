    /* uses forEach from JS 1.6; should be supported in all modern browsers */
    var Button = function () {
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
            image.style.position= 'absolute';
        }

        var top = 0; var left = 650;
        var button = img("button.png");
        place(button); position(button);
        
        var that = {};
        that.onclick = function (f) {button.onclick=f; return "click bound to [" + f + "]";}
        Object.freeze(that);
        return that;
        }