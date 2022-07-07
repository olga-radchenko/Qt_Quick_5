import QtQuick 2.0

Canvas {
    anchors.fill: parent
    property int xStep: width / 8
    property int yStep: height / 12
    onPaint: {
        var ctx = getContext("2d");
        ctx.clearRect(0, 0, width, height);

        var gradient = ctx.createLinearGradient(0, 0, width, height);
        gradient.addColorStop(0, "#e6e6fa");
        gradient.addColorStop(0.2, "#ffffff");
        gradient.addColorStop(0.4, "#e6e6fa");
         gradient.addColorStop(0.6, "#ffffff");
        gradient.addColorStop(0.8, "#e6e6fa");
        ctx.strokeStyle = "#e6e6fa";
        ctx.fillStyle = gradient;

        // Outer
        ctx.lineWidth = 5;
        ctx.beginPath();
        ctx.moveTo(0, 0);//start point
        ctx.bezierCurveTo(0, 150,  150, 150, 150, 300);
        ctx.lineTo(0, 300);
        ctx.bezierCurveTo(0, 150,  150, 150, 150, 0);
        ctx.lineTo(0, 0);
        ctx.clip();
        ctx.fillRect(0, 0, 350, 350);
        ctx.stroke();

        // Inner top
        ctx.lineWidth = 3;
        ctx.strokeStyle = "#ffffff";
        ctx.fillStyle = "white";
        ctx.beginPath();
        ctx.moveTo(20, 15);//start point
        ctx.bezierCurveTo(50, 150,  100, 150, 130, 15);
        ctx.closePath();
        ctx.fill()
        ctx.stroke();

        // Inner bottom
        ctx.beginPath();
        ctx.moveTo(20, 285);//start point
        ctx.bezierCurveTo(50, 150,  100, 150, 130, 285);
        ctx.closePath();
        ctx.fill()
        ctx.stroke();

        //sand bottom
        var pattern = ctx.createPattern("#f5deb3", Qt.Dense5Pattern);
        ctx.fillStyle = pattern;
        ctx.strokeStyle = "#f5deb3";
        ctx.beginPath();
        ctx.moveTo(20, 285);//start point
        ctx.bezierCurveTo(40, 225,  60, 255, 75, 235);
        ctx.bezierCurveTo(90, 215,  100, 235, 130, 285);
        ctx.closePath();
        ctx.fill()
        ctx.stroke();

        //sand top
        ctx.beginPath();
        ctx.moveTo(40, 80);//start point
        ctx.bezierCurveTo(70, 140,  90, 140, 120, 50);
        ctx.bezierCurveTo(90, 70,  70, 65, 40, 75);
        ctx.closePath();
        ctx.fill()
        ctx.stroke();
    }
}
