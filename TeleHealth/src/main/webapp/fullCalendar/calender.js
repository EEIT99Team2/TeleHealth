var a = 2;
var b = 3;
var cdate = 31;
var finalyear = 2010;
var finalmonth = 1;
var finaldate = 1;
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("year").addEventListener("change", chooseyear);
    document.getElementById("month").addEventListener("change", choosemonth);
    document.getElementById("date").addEventListener("change", choosedate);
    document.getElementById("year").addEventListener("change", rundate);
    document.getElementById("month").addEventListener("change", rundate);

    for (var i = 10; i <= 20 ; i++) {
        var yea = document.createElement("option");
        yea.setAttribute("value", i);
        var yeatxt = document.createTextNode("20" + i);
        yea.appendChild(yeatxt);
        document.getElementById("year").appendChild(yea);
    }
    for (var i = 1; i <= 12; i++) {
        var mon = document.createElement("option");
        mon.setAttribute("value", i);
        var montxt = document.createTextNode(i);
        mon.appendChild(montxt);
        document.getElementById("month").appendChild(mon);
    }
    for (var i = 1; i <= cdate; i++) {
        var dat = document.createElement("option");
        dat.setAttribute("value", i);
        var dattxt = document.createTextNode(i);
        dat.appendChild(dattxt);
        document.getElementById("date").appendChild(dat);
    }
});
function chooseyear() {
    if (((this.selectedIndex + 2009) % 4 == 0 && (this.selectedIndex + 2009) % 100 != 0) || (this.selectedIndex + 2009) % 400 == 0) {
        a = 1;   //閏年
    } else {
        a = 2;   //不是閏年
    }
    finalyear = 2010 + this.selectedIndex;
}
function choosemonth() {
    if ((this.selectedIndex) == 2) {
        b = 1;  //28or29天
    } else if ((this.selectedIndex) == 4 || (this.selectedIndex) == 6 || (this.selectedIndex) == 9 || (this.selectedIndex) == 11) {
        b = 2;  //30
    } else {
        b = 3;  //31
    }
    finalmonth = this.selectedIndex;
}
function choosedate() {
    finaldate = this.selectedIndex;
}
function rundate() {
    var newdate = document.getElementById("date");
    $("#date").empty();
//    for (var i = 1; i <= cdate; i++) {
//        newdate.firstChild.remove();
//    }
    if (a == 1 && b == 1) {
        cdate = 29;
    } else if (a == 2 && b == 1) {
        cdate = 28;
    } else if ((a == 1 || a == 2) && b == 2) {
        cdate = 30;
    } else if ((a == 1 || a == 2) && b == 3) {
        cdate = 31;
    }
    for (var i = 1; i <= cdate; i++) {
        var dat = document.createElement("option");
        dat.setAttribute("value", i);
        var dattxt = document.createTextNode(i);
        dat.appendChild(dattxt);
        newdate.appendChild(dat);
    }
}