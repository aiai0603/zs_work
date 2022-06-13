/**
 * Created by Administrator on 16-6-23.
 */
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

