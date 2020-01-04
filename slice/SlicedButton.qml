import QtQuick 2.7

Item
{
    id: buttonRoot
    height: paddingTop + paddingBottom + buttonText.height + (buttonBg.realBorderWidth * 2)

    property font font: Qt.font({
        family: config.font,
        bold: true,
        pointSize: 13,
        capitalization: Font.AllUppercase,
        smooth: false
    });

    property string text: ""

    property bool highlighted: false
    property bool activated: false
    
    property int skew:          sizes.skewSlices
    property int skewLeft:      skew
    property int skewRight:     skew
    
    property bool slideEnabled: sizes.slideEnabledSlices
    property bool slideOnHover: sizes.slideOnHoverSlices
    property bool slideOnHighlight: sizes.slideOnHighlightSlices
    property int slideOffset: sizes.slideOffsetSlices
    readonly property int slidePos: height * slideOffset / 100

    property int currentSlideOffset: slidePos * slideDirection
    property int slideDirection: 1
    
    property int paddingTop:    sizes.paddingTopSlices
    property int paddingBottom: sizes.paddingBottomSlices
    property int paddingLeft:   sizes.paddingLeftSlices
    property int paddingRight:  sizes.paddingRightSlices

    readonly property int widthFull: buttonBg.width
    readonly property int widthPartial: buttonBg.widthPartial

    property color bgIdle: colors.buttonBg
    property color bgHover: colors.buttonBgHover

    property color bgIdleHighlighted: colors.buttonBgHighlighted
    property color bgHoverHighlighted: colors.buttonBgHoverHighlighted

    property color textIdle: colors.buttonText
    property color textHover: colors.buttonTextHover

    property color textIdleHighlighted: colors.buttonTextHighlighted
    property color textHoverHighlighted: colors.buttonTextHoverHighlighted

    property int borderWidth: sizes.borderWidthSlices
    property bool borderEnabled: sizes.borderEnabledSlices
    property bool complexBorderEnabled: sizes.complexBorderEnabledSlices
    property string borderCorner: sizes.borderCornerSlices
    property color borderColor: colors.buttonBorder
    property color innerBorderColor: colors.buttonBorderInner
    property int innerBorderWidth: sizes.innerBorderWidthSlices
    property color hoverBorderColor: colors.buttonBorderHover
    
    property variant fadeOrigin: {x:0;y:0}
    
    property color shineColor: colors.buttonShine
    property bool shineEnabled: sizes.shineEnabledSlices
    property int shinePos: sizes.shinePosSlices
    property variant shineBezier: sizes.shineBezierSlices
    
    property string backgroundTexture: colors.textureSlices
    
    property bool slid: (!slideEnabled) || (slideOnHighlight && highlighted) || (slideOnHover && state === 'hover')

    signal clicked()

    Behavior on x
    {
        PropertyAnimation { duration: 100 }
    }

    Behavior on currentSlideOffset
    {
        PropertyAnimation { duration: 100 }
    }

    onHighlightedChanged:
    {
        buttonBg.requestPaint()
    }

    onTextChanged:
    {
        buttonText.text = buttonRoot.text
    }

    state: "idle"
    states:
    [
        State
        {
            name: "idle"
            PropertyChanges
            {
                target: buttonBg;
                bgColor: highlighted ? bgIdleHighlighted : bgIdle
            }

            PropertyChanges
            {
                target: buttonText;
                color: highlighted ? textIdleHighlighted : textIdle
            }
            PropertyChanges
            {
                target: buttonBg;
                activated: false
            }
            PropertyChanges
            {
                target: buttonRoot;
                currentSlideOffset: slid ? 0 : (slidePos * slideDirection)
            }
        },
        State
        {
            name: "hover"
            PropertyChanges
            {
                target: buttonBg;
                bgColor: highlighted ? bgHoverHighlighted : bgHover
            }

            PropertyChanges
            {
                target: buttonText;
                color: highlighted ? textHoverHighlighted : textHover
            }
            PropertyChanges
            {
                target: buttonRoot;
                activated: true
            }
            PropertyChanges
            {
                target: buttonRoot;
                currentSlideOffset: slid ? 0 : (slidePos * slideDirection)
            }
        }
    ]
    
    SlicedRectangle
    {
        id: buttonBg
        baseWidth: buttonText.width + paddingLeft + paddingRight + (realBorderWidth * 2)
        baseHeight: parent.height
        skewLeft: buttonRoot.skewLeft
        bgColor: colors.buttonBg
        skewRight: buttonRoot.skewRight
        fadeOrigin: buttonRoot.fadeOrigin
        y: currentSlideOffset
        x: -verticalSlideOffset
        
        borderWidth: buttonRoot.borderWidth
        borderEnabled: buttonRoot.borderEnabled
        complexBorderEnabled: buttonRoot.complexBorderEnabled
        borderCorner: buttonRoot.borderCorner
        borderColor: buttonRoot.borderColor
        innerBorderColor: buttonRoot.innerBorderColor
        innerBorderWidth: buttonRoot.innerBorderWidth
        hoverBorderColor:buttonRoot.hoverBorderColor
        
        shineColor: buttonRoot.shineColor
        animationDelay: slideEnabled ? 100 : 0
        
        shineEnabled: buttonRoot.shineEnabled
        shinePos: buttonRoot.shinePos
        shineBezier: buttonRoot.shineBezier
        backgroundTexture: buttonRoot.backgroundTexture
        
        activated: buttonRoot.activated
    }
    property int verticalSlideOffset: Math.max(buttonBg.skewPaddingLeft, buttonBg.skewPaddingRight) * currentSlideOffset / buttonBg.height
    Text
    {
        id: buttonText
        x: paddingLeft + buttonBg.skewPaddingLeft + buttonBg.realBorderWidth - verticalSlideOffset
        y: currentSlideOffset + paddingTop + buttonBg.realBorderWidth
        color: colors.buttonText

        font: buttonRoot.font

        text: ""
    }
        
    function getAbsolutePosition(node) {
        var returnPos = {};
        returnPos.x = 0;
        returnPos.y = 0;
        if(node !== undefined && node !== null) {
            var parentValue = getAbsolutePosition(node.parent);
            returnPos.x = parentValue.x + node.x;
            returnPos.y = parentValue.y + node.y;
        }
        return returnPos;
    }

    MouseArea
    {
        width: widthFull
        height: parent.height

        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onPositionChanged:
        {
            if (buttonRoot.state === "hover") {
                var absPos = getAbsolutePosition()
                var mosPos = { x:mouseX, y:mouseY }
                fadeOrigin = {
                    x:mosPos.x-absPos.x,
                    y:mosPos.y-absPos.y
                }
            }
        }
        onEntered: 
        {
            var absPos = getAbsolutePosition()
            var mosPos = { x:mouseX, y:mouseY }
            fadeOrigin = {
                x:mosPos.x-absPos.x,
                y:mosPos.y-absPos.y
            }
            buttonRoot.state = "hover"
            buttonBg.requestPaint()
        }

        onExited:
        {
            buttonRoot.state = "idle"
            buttonBg.requestPaint()
        }

        onClicked: buttonRoot.clicked()
    }
}
