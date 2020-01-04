import QtQuick 2.7

Item
{
    id: rectangleRoot
    
    height:    baseHeight
    width: baseWidth + skewPaddingLeft + skewPaddingRight
    
    property bool activated: false
    
    property int baseHeight: 20
    property int baseWidth: 20
    property color bgColor: colors.buttonBg
    
    property int skew:          sizes.skewSlices
    property int skewLeft:      skew
    property int skewRight:     skew
    property int defaultSkewPadding: 5
    
    property int borderWidth: sizes.borderWidthSlices
    readonly property int realBorderWidth: borderEnabled ? Math.max(borderWidth,innerBorderWidth) : 0
    property bool borderEnabled: sizes.borderEnabledSlices
    property bool complexBorderEnabled: sizes.complexBorderEnabledSlices
    property string borderCorner: sizes.borderCornerSlices
    property color borderColor: colors.buttonBorder
    property color innerBorderColor: colors.buttonBorderInner
    property int innerBorderWidth: sizes.innerBorderWidthSlices
    property color hoverBorderColor: colors.buttonBorderHover
    
    property bool shineEnabled: sizes.shineEnabledSlices
    property int shinePos: sizes.shinePosSlices
    property variant shineBezier: sizes.shineBezierSlices
    
    
    
    property string backgroundTexture: sizes.textureSlices
    property color shineColor: colors.buttonShine
    
    property int animationDelay: 0
    property variant fadeOrigin: {x:0;y:0}
    property real currentFadeOut: 0
    
    
    
    readonly property int halfBorderWidth: Math.ceil(realBorderWidth / 2)
    
    readonly property int skewSizeLeft: Math.round(baseHeight * Math.abs(skewLeft)/45)
    readonly property int skewSizeRight: Math.round(baseHeight * Math.abs(skewRight)/45)
    
    readonly property int skewPaddingLeft: Math.max(skewSizeLeft, defaultSkewPadding)
    readonly property int skewPaddingRight: Math.max(skewSizeRight, defaultSkewPadding)

    readonly property int widthPartial: baseWidth + skewPaddingLeft + (skewPaddingRight - skewSizeRight)

    onBgColorChanged:
    {
        rectangleBg.requestPaint()
    }
    onCurrentFadeOutChanged:
    {
        rectangleBg.requestPaint()
    }
    onActivatedChanged:
    {
        currentFadeOut = (borderEnabled && activated) ? 1 : 0
    }
    onFadeOriginChanged:
    {
        rectangleBg.requestPaint()
    }

    onBackgroundTextureChanged:
    {
        if (backgroundTexture && !rectangleBg.isImageLoading(backgroundTexture)) rectangleBg.loadImage(backgroundTexture)
    }
    
    function requestPaint() {
        rectangleBg.requestPaint()
    }

    Behavior on currentFadeOut
    {
        SequentialAnimation {
            PauseAnimation { duration: animationDelay }
            PropertyAnimation { duration: 100 }
        }
    }

    Canvas
    {
        id: rectangleBg

        width: rectangleRoot.width
        height: rectangleRoot.height
        property string bgColor: rectangleRoot.bgColor
        property string borderColor: rectangleRoot.borderColor
        property string innerBorderColor: rectangleRoot.innerBorderColor
        property string shineColor: rectangleRoot.shineColor
        property color hoverBorderColor: rectangleRoot.hoverBorderColor

        onImageLoaded:{
            requestPaint();
        }
        
        function shapePath(bezier) {
            var offset = borderEnabled ? halfBorderWidth : 0
            var context = getContext("2d")
            context.beginPath()

            if (bezier === undefined) {
                context.moveTo(skewPaddingLeft+offset, height-offset)

                if (skewLeft > 0) {
                    context.lineTo(offset, height-offset)
                    context.lineTo(skewPaddingLeft+offset, offset)
                } else if (skewLeft < 0) {
                    context.lineTo(offset, offset)
                } else {
                    context.lineTo(offset, height-offset)
                    context.lineTo(offset, offset)
                }

                context.lineTo(widthPartial-offset, offset)

                if (skewRight > 0) {
                    context.lineTo(width-offset, offset);
                    context.lineTo(widthPartial-offset, height-offset)
                } else if (skewRight < 0) {
                    context.lineTo(width-offset, height-offset)
                } else {
                    context.lineTo(width-offset, offset)
                    context.lineTo(width-offset, height-offset)
                }

                context.lineTo(skewPaddingLeft+offset, height-offset)
            } else {
                
                var startPosX,startPosY,endPosX,endPosY
                var shine = (shinePos / 100)
                if (skewLeft > 0) {
                    startPosX=(skewPaddingLeft * (1 - shine)) + offset
                    startPosY=(height * shine) + offset
                    context.moveTo(startPosX, startPosY)
                    context.lineTo(skewPaddingLeft + offset, offset)
                } else if (skewLeft < 0) {
                    startPosX=(skewPaddingLeft * shine) + offset
                    startPosY=(height * shine) + offset
                    context.moveTo(startPosX, startPosY)
                    context.lineTo(offset, offset)
                } else {
                    startPosX=offset
                    startPosY=(height * shine) + offset
                    context.moveTo(startPosX, startPosY)
                    context.lineTo(offset, offset)
                }
                if (skewRight > 0) {
                    endPosX=width - (skewPaddingRight * shine) - offset
                    endPosY=(height * shine) + offset
                    context.lineTo(width - offset, offset)
                } else if (skewRight < 0) {
                    endPosX=width - (skewPaddingRight * (1 - shine)) - offset
                    endPosY=(height * shine) + offset
                    context.lineTo(width - skewPaddingRight - offset, offset)
                } else {
                    endPosX=width - offset
                    endPosY=(height * shine) + offset
                    context.lineTo(width - offset, offset)
                }
                context.lineTo(endPosX, endPosY);

                context.bezierCurveTo(
                    endPosX+((bezier[0].x/100)*width),
                    endPosY+((bezier[0].y/100)*height),
                    startPosX+((bezier[1].x/100)*width),
                    startPosY+((bezier[1].y/100)*height),
                    startPosX,
                    startPosY
                )
            }
            context.closePath()
        }
        onPaint:
        {
            if (backgroundTexture && !rectangleBg.isImageLoading(backgroundTexture)) rectangleBg.loadImage(backgroundTexture)

            var context = getContext("2d");
            context.clearRect(0, 0, width, height)
            shapePath()
            
            // Background color
            context.fillStyle = bgColor
            context.fill()
            
            // Texture
            if (backgroundTexture && isImageLoaded(backgroundTexture)) {
                context.fillStyle = context.createPattern(backgroundTexture, 'repeat')
                context.fill()
            }
            
            // Shine
            if (shineEnabled) {
                shapePath(shineBezier)
                context.fillStyle = shineColor
                context.fill()
                shapePath()
            }
            
            // Borders
            if (borderEnabled) {
                context.lineCap = borderCorner
                context.lineJoin = borderCorner
                
                // Placeholder border
                context.lineWidth = borderWidth
                context.strokeStyle = borderColor
                context.stroke()
                
                // Inner Trough
                context.lineWidth = innerBorderWidth
                if (complexBorderEnabled) {
                    context.strokeStyle = innerBorderColor
                    context.stroke()
                }
                
                // Hover Highlight
                if (currentFadeOut) {
                    var gradient = context.createRadialGradient(fadeOrigin.x || 0, fadeOrigin.y || 0, 0, fadeOrigin.x || 0, fadeOrigin.y || 0, Math.max(width, height))
                    var cp = Math.max(currentFadeOut-0.000001, 0)
                    function rd(n) {
                        return Math.round(n*100)/100
                    }
                    function mx(n) {
                        return Math.min(Math.max(n,0),255)
                    }
                    var r1 = mx(Math.round((hoverBorderColor.r*255)+100)),
                        g1 = mx(Math.round((hoverBorderColor.g*255)+100)),
                        b1 = mx(Math.round((hoverBorderColor.b*255)+100)),
                        a1 = rd(hoverBorderColor.a),
                        r2 = mx(Math.round(hoverBorderColor.r*255)),
                        g2 = mx(Math.round(hoverBorderColor.g*255)),
                        b2 = mx(Math.round(hoverBorderColor.b*255)),
                        a2 = rd(hoverBorderColor.a*cp);
                        
                    gradient.addColorStop("0" ,"rgba("+r1+","+g1+","+b1+","+a1+")")
                    gradient.addColorStop(cp+"", "rgba("+r2+","+g2+","+b2+","+a2+")")
                    gradient.addColorStop("1.0", "rgba("+r2+","+g2+","+b2+",0)")

                    if (complexBorderEnabled) {
                        context.lineWidth = Math.max(innerBorderWidth-2, 1)
                    }
                    context.strokeStyle = gradient
                    context.stroke()
                }
            }
            
        }

    }
}
