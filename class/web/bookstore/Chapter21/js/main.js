/**
 * Created by Administrator on 16-6-23.
 */
var iCount=2;
window.onload = function () {
    var oDt = new Date();
    var sWd = "";
    var iWeekDay = oDt.getDay();
    switch (iWeekDay) {
        case 0:
            sWd = "星期日";
            break;
        case 1:
            sWd = "星期一";
            break;
        case 2:
            sWd = "星期二";
            break;
        case 3:
            sWd = "星期三";
            break;
        case 4:
            sWd = "星期四";
            break;
        case 5:
            sWd = "星期五";
            break;
        case 6:
            sWd = "星期六";
            break;
    }
    var iMonth = parseInt(oDt.getMonth()) + 1;
    document.getElementById("date").innerHTML = "<span>" + oDt.getFullYear() + "年" + iMonth + "月" + oDt.getDate() + "日 " + sWd + "</span>";
    var iTimerid = window.setInterval("showtime()", 1000);

    if(document.getElementById("a1")!=null){
        document.getElementById("a1").onclick = function(){
            iCount=1;
            changebgcolor(iCount);}
    }
    if(document.getElementById("a2")!=null){
        document.getElementById("a2").onclick = function(){
            iCount=2;
            changebgcolor(iCount);}
    }
    if(document.getElementById("a3")!=null){
        document.getElementById("a3").onclick = function(){
            iCount=3;
            changebgcolor(iCount);}
    }
    if(document.getElementById("a4")!=null){
        document.getElementById("a4").onclick = function(){
            iCount=4;
            changebgcolor(iCount);}
    }
    var iCarouselid = window.setInterval("carousel()", 2000);

    if(document.getElementById("close-left")!=null){document.getElementById("close-left").onclick=function(){advcloseleft();}}
    if(document.getElementById("close-right")!=null){document.getElementById("close-right").onclick=function(){advcloseright();}}

}
function showtime() {
    var oDt = new Date();
    var iTimerid;
    var sTime = "";
    if (oDt.getHours() < 10) {
        sTime += "0" + oDt.getHours() + ":";
    }
    else {
        sTime += oDt.getHours() + ":";
    }
    if (oDt.getMinutes() < 10) {
        sTime += "0" + oDt.getMinutes() + ":";
    }
    else {
        sTime += oDt.getMinutes() + ":";
    }
    if (oDt.getSeconds() < 10) {
        sTime += "0" + oDt.getSeconds();
    }
    else {
        sTime += oDt.getSeconds();
    }
    document.getElementById("time").innerHTML = "<span>" + sTime + "</span>";
}

function carousel(){
    var sImgSrc=eval("'images/b-ad'+iCount.toString()+'.jpg'");
    var sAchange=eval("'a'+iCount.toString()");
    /*记录需要变回颜色的链接顺序。*/
    var iA=iCount-1;
    if(iA==0){iA=4;}
    var sArestore=eval("'a'+iA.toString()");
    document.getElementById("banner").src=sImgSrc;
    document.getElementById(sAchange).style.backgroundColor="hsl(20,30%,50%)";
    document.getElementById(sArestore).style.backgroundColor="hsl(20,50%,30%)";
    iCount=iCount+1;
    if(iCount==5){iCount=1;}
}

function changebgcolor(iNum){
    document.getElementById("banner").src=eval("'images/b-ad'+iNum.toString()+'.jpg'");
    for(var iC= 1;iC<=4;iC++){
        var sA=eval("'a'+iC.toString()");
        if(iC==iNum)
        {
            document.getElementById(sA).style.backgroundColor="hsl(20,30%,50%)";
        }
        else
        {
            document.getElementById(sA).style.backgroundColor="hsl(20,50%,30%)";
        }
    }
}

/*关闭广告*/
function advcloseleft(){
    document.getElementById("adv-left").style.display="none";
    document.getElementById("close-left").style.display="none";}
function advcloseright(){
    document.getElementById("adv-right").style.display="none";
    document.getElementById("close-right").style.display="none";}

