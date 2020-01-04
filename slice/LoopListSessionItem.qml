import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0

Item
{
    id: itemRoot
    opacity: computedDistance
    scale: computedDistance

    property real distance: 1.0
    readonly property real computedDistance: Math.sin(Math.PI / 2 * distance)
    property string sessionName: ""
    property bool hover: false
    
    property int textBoxPaddingLeft: sizes.paddingLeftItemSession
    property int textBoxPaddingRight: sizes.paddingRightItemSession
    property int textBoxPaddingTop: sizes.paddingTopItemSession
    property int textBoxPaddingBottom: sizes.paddingBottomItemSession

    SlicedRectangle
    {
        id: textBackground
        x: sessionNameLabel.x - textBoxPaddingLeft - skewPaddingLeft - realBorderWidth
        y: sessionNameLabel.y - textBoxPaddingTop- realBorderWidth
        defaultSkewPadding: 0
        baseWidth: sessionNameLabel.width + textBoxPaddingLeft + textBoxPaddingRight + (realBorderWidth * 2)
        baseHeight: sessionNameLabel.height + textBoxPaddingBottom + textBoxPaddingTop + (realBorderWidth * 2)
        bgColor: ( hover ? colors.textBgHover : colors.textBg )
        skewLeft: sizes.skewLeftItemSession
        skewRight: sizes.skewRightItemSession
            
        borderWidth: sizes.borderWidthItemSession
        borderEnabled: sizes.borderEnabledItemSession
        complexBorderEnabled: sizes.complexBorderEnabledItemSession
        borderCorner: sizes.borderCornerItemSession
        innerBorderWidth: sizes.innerBorderWidthItemSession
        
        borderColor: colors.textBorder
        innerBorderColor: colors.textBorderInner
        hoverBorderColor: colors.textBorderHover
        
        shineColor: colors.textShine
        shineEnabled: sizes.shineEnabledItemSession
        shinePos: sizes.shinePosItemSession
        shineBezier: sizes.shineBezierItemSession
        
        backgroundTexture: colors.textureItemSession
        
        activated: hover
    }

    Text
    {
        id: sessionNameLabel
        anchors.centerIn: parent
        text: sessionName
        color: ( hover ? colors.textHover : colors.text )

        font: fonts.listItemMed

        x: parent.x + textBoxPaddingLeft
        y: textBoxPaddingTop
    }
}
