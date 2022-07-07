import QtQuick 2.0
Canvas {
    anchors.fill: parent
    onPaint: {
        var ctx = getContext("2d");
        ctx.clearRect(0, 0, width, height);

        var gradient = ctx.createRadialGradient(100,100,55, 50,50,65);
        gradient.addColorStop(0.7, "#fffafa");
        gradient.addColorStop(1, "#dcdcdc");
        ctx.strokeStyle = "#dcdcdc";
        ctx.lineWidth = 2;
        ctx.fillStyle = gradient;
        ctx.beginPath();
        ctx.arc(75,75,50,0,Math.PI*2,true); // Outer circle
        ctx.stroke();
        ctx.arc(75,75,35,0,Math.PI*2,true); // Outer circle
        ctx.closePath();
        ctx.clip();
        ctx.fillRect(0, 0, 350, 350);
    }
}
