import QtQuick 2.7

Item
{
    id: rectangleRoot
    
    height:    baseHeight
    width: baseWidth + skewPaddingLeft + skewPaddingRight
    
    
    property int baseHeight: 20
    property int baseWidth: 20
    property color bgColor: colors.buttonBg
    
    property int skew:          sizes.skewSlices
    property int skewLeft:      skew
    property int skewRight:     skew
    property int defaultSkewPadding: 5
    
    readonly property int skewSizeLeft: Math.round(baseHeight * Math.abs(skewLeft)/45)
    readonly property int skewSizeRight: Math.round(baseHeight * Math.abs(skewRight)/45)
    
    readonly property int skewPaddingLeft: Math.max(skewSizeLeft, defaultSkewPadding)
    readonly property int skewPaddingRight: Math.max(skewSizeRight, defaultSkewPadding)

    readonly property int widthPartial: baseWidth + skewPaddingLeft + (skewPaddingRight - skewSizeRight)

    onBgColorChanged:
    {
        rectangleBg.requestPaint()
    }
    
    function requestPaint() {
        rectangleBg.requestPaint()
    }

    Canvas
    {
        id: rectangleBg

        width: rectangleRoot.width
        height: rectangleRoot.height
        property string bgColor: rectangleRoot.bgColor

        onPaint:
        {
            var context = getContext("2d");
            context.clearRect(0, 0, width, height);
            context.fillStyle = bgColor
            context.beginPath()

            context.moveTo(skewPaddingLeft, height);

            if (skewLeft > 0) {
                context.lineTo(0, height);
                context.lineTo(skewSizeLeft, 0);
            } else if (skewLeft < 0) {
                context.lineTo(skewSizeLeft, height);
                context.lineTo(0, 0);
            } else {
                context.lineTo(0, height);
                context.lineTo(0, 0);
            }

            context.lineTo(widthPartial, 0);

            if (skewRight > 0) {
                context.lineTo(width, 0);
                context.lineTo(width-skewSizeRight, height);
            } else if (skewRight < 0) {
                context.lineTo(width-skewSizeRight, 0);
                context.lineTo(width, height);
            } else {
                context.lineTo(width, 0);
                context.lineTo(width, height);
            }

            context.lineTo(skewPaddingLeft, height);

            context.closePath()
            context.fill()
        }

    }
}
