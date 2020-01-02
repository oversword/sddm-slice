import QtQuick 2.7

Item
{
    id: buttonRoot
    height: paddingTop + paddingBottom + buttonText.height

    property font font: Qt.font({
        family: config.font,
        bold: true,
        pointSize: 13,
        capitalization: Font.AllUppercase,
        smooth: false
    });

    property string text: ""

    property bool highlighted: false
    
    property int skew:          sizes.skewSlices
    property int skewLeft:      skew
    property int skewRight:     skew
    
    property bool slideEnabled: true
    property int slideDirection: 1
    property int slideOffset: 20
    property int currentSlideOffset: slideOffset * slideDirection
    property bool slideOnHover: true
    property bool slideOnHighlight: true
    
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
                target: buttonRoot;
                currentSlideOffset: slideEnabled ? ((slideOnHighlight && highlighted) ? 0 : (slideOffset * slideDirection)) : 0
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
                currentSlideOffset: slideEnabled ? (((slideOnHighlight && highlighted) || slideOnHover) ? 0 : (slideOffset * slideDirection)) : 0
            }
        }
    ]
    
    SlicedRectangle
    {
        id: buttonBg
        baseWidth: buttonText.width + paddingLeft + paddingRight
        baseHeight: parent.height
        skewLeft: buttonRoot.skewLeft
        bgColor: colors.buttonBg
        skewRight: buttonRoot.skewRight
        y: slideEnabled ? currentSlideOffset : 0
        x: slideEnabled ? -Math.max(skewPaddingLeft, skewPaddingRight) * currentSlideOffset / height : 0
    }

    Text
    {
        id: buttonText
        x: paddingLeft + buttonBg.skewPaddingLeft - (slideEnabled ? Math.max(buttonBg.skewPaddingLeft, buttonBg.skewPaddingRight) * currentSlideOffset / buttonBg.height : 0)
        y: (slideEnabled ? currentSlideOffset : 0) + paddingTop
        color: colors.buttonText

        font: buttonRoot.font

        text: ""
    }

    MouseArea
    {
        width: widthFull
        height: parent.height

        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onEntered: 
        {
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
