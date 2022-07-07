import QtQuick 2.0

Canvas {
    anchors.fill: parent
    property int xStep: width / 8
    property int yStep: height / 12
    onPaint: {
        var ctx = getContext("2d");
        ctx.clearRect(0, 0, width, height);

        var pattern = ctx.createPattern("qrc:/CanvasExample/texture_brevna.jpg", "repeat");
        ctx.fillStyle = pattern;
        ctx.fillRect(10, 80, 150, 150);


        pattern = ctx.createPattern("qrc:/CanvasExample/window.jpg", "no-repeat");
        ctx.fillStyle = pattern;
        ctx.fillRect(50, 110, 70, 110);


        pattern = ctx.createPattern("qrc:/CanvasExample/texture_cherepica.jpg", "repeat");
        ctx.fillStyle = pattern;

        ctx.lineWidth = 5;
        ctx.beginPath();
        ctx.moveTo(10, 80);
        ctx.lineTo(80,10);
        ctx.lineTo(160,80);
        ctx.closePath();
        ctx.clip();
        ctx.stroke();
        ctx.fillRect(10, 0, 160, 80);
    }
}
