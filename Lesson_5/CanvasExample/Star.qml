import QtQuick 2.0

Canvas {
    anchors.fill: parent
    property int xStep: width / 7
    property int yStep: height / 9
    onPaint: {
        var ctx = getContext("2d");
        ctx.clearRect(0, 0, width, height);
        ctx.lineWidth = 5;

        var gradient = ctx.createLinearGradient(0, 0, width, height);
        gradient.addColorStop(0.2, "#f0e68c");
        gradient.addColorStop(0.4, "#fffafa");
        gradient.addColorStop(0.6, "#f0e68c");
        ctx.strokeStyle = "#f0e68c";
        ctx.gradient = "#ffd700";
        ctx.fillStyle = gradient;

        ctx.beginPath()
        ctx.moveTo(3 * xStep, yStep);
        ctx.lineTo(3.5 * xStep, 2.5 * yStep);
        ctx.lineTo(5 * xStep, 2.8 * yStep);
        ctx.lineTo(3.7 * xStep, 3.5 * yStep);
        ctx.lineTo(4 * xStep, 5 * yStep);
        ctx.lineTo(3 * xStep, 4 * yStep);
        ctx.lineTo(2 * xStep, 5 * yStep);
        ctx.lineTo(2.3 * xStep, 3.5 * yStep);
        ctx.lineTo( xStep, 2.8 * yStep);
        ctx.lineTo(2.5 * xStep, 2.5 * yStep);
        ctx.lineTo(3 * xStep, yStep);
        ctx.closePath()
        ctx.clip();
        ctx.fillRect(40, 50, 200, 250);
        ctx.stroke();
    }
}
