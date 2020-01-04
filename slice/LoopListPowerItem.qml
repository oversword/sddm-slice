import QtQuick 2.7
import QtGraphicalEffects 1.0

Item
{
    id: itemRoot
    opacity: distance
    property int duration: 100
    width: parent.width
    height: descriptionLabel.height + textBoxPaddingBottom + textBoxPaddingTop + (textBackground.realBorderWidth * 2)
    
    property bool hover: false
    
    property int textBoxPaddingTop: sizes.paddingTopItemPower
    property int textBoxPaddingLeft: sizes.paddingLeftItemPower
    property int textBoxPaddingBottom: sizes.paddingBottomItemPower
    property int textBoxPaddingRight: sizes.paddingRightItemPower
    
    property int imagePadding: sizes.imagePaddingItemPower
    property int textBoxMargin: sizes.spacingItemPower

    signal clicked()
    signal entered()

    transform: Scale
    {
        origin.x: iconBackground.width + textBoxMargin
        origin.y: itemRoot.height / 2
        xScale: distance
        yScale: distance
    }

    Behavior on distance
    {
        PropertyAnimation { duration: itemRoot.duration }
    }

    property real distance: 1.0
    property string icon: "icons/no_avatar.svg"
    property string title: ""
    readonly property int imageWidth: itemRoot.height - (imagePadding * 2) - (textBackground.realBorderWidth * 2)

    SlicedRectangle
    {
        id: iconBackground
        baseWidth: itemRoot.height
        baseHeight: itemRoot.height
        bgColor: ( hover ? colors.iconBgHover : colors.iconBg )
        skewLeft: sizes.skewLeftItemPowerImage
        skewRight: sizes.skewRightItemPowerImage
            
        borderWidth: sizes.borderWidthItemPower
        borderEnabled: sizes.borderEnabledItemPower
        complexBorderEnabled: sizes.complexBorderEnabledItemPower
        borderCorner: sizes.borderCornerItemPower
        innerBorderWidth: sizes.innerBorderWidthItemPower
        
        borderColor: colors.iconBorder
        innerBorderColor: colors.iconBorderInner
        hoverBorderColor: colors.iconBorderHover
        
        shineColor: colors.iconShine
        shineEnabled: sizes.shineEnabledItemPower
        shinePos: sizes.shinePosItemPower
        shineBezier: sizes.shineBezierItemPower
        
        backgroundTexture: colors.textureItemPower
        
        activated: hover
    }

    Image
    {
        id: powerItemIcon
        source: icon
        sourceSize.width: imageWidth
        sourceSize.height: imageWidth
        x: imagePadding + iconBackground.skewPaddingLeft + iconBackground.realBorderWidth
        y: imagePadding + iconBackground.realBorderWidth
        opacity: 0
    }

    ColorOverlay
    {
        id: powerItemIconOverlay
        anchors.fill: powerItemIcon
        source: powerItemIcon
        color: ( hover ? colors.iconHover : colors.icon )
        opacity: parent.opacity
    }

    SlicedRectangle
    {
        id: textBackground
        x: iconBackground.widthPartial + textBoxMargin
        baseWidth: parent.width - x - skewPaddingLeft - skewPaddingRight - textBackground.realBorderWidth - iconBackground.realBorderWidth
        baseHeight: itemRoot.height
        bgColor: ( hover ? colors.textBgHover : colors.textBg )
        skewLeft: sizes.skewLeftItemPowerText
        skewRight: sizes.skewRightItemPowerText
            
        borderWidth: sizes.borderWidthItemPower
        borderEnabled: sizes.borderEnabledItemPower
        complexBorderEnabled: sizes.complexBorderEnabledItemPower
        borderCorner: sizes.borderCornerItemPower
        innerBorderWidth: sizes.innerBorderWidthItemPower
        
        borderColor: colors.textBorder
        innerBorderColor: colors.textBorderInner
        hoverBorderColor: colors.textBorderHover
        
        shineColor: colors.textShine
        shineEnabled: sizes.shineEnabledItemPower
        shinePos: sizes.shinePosItemPower
        shineBezier: sizes.shineBezierItemPower
        
        backgroundTexture: colors.textureItemPower
        
        activated: hover
    }

    Text
    {
        id: descriptionLabel
        text: itemRoot.title
        color: ( hover ? colors.textHover : colors.text )
        width: parent.width - x - textBackground.skewPaddingRight - textBoxPaddingRight - (textBackground.realBorderWidth * 2)

        font: fonts.listItemMed
        elide: Text.ElideRight

        x: textBackground.x + textBackground.skewPaddingLeft + textBoxPaddingLeft + textBackground.realBorderWidth
        y: textBoxPaddingTop + textBackground.realBorderWidth
    }

    MouseArea
    {
        width: itemRoot.width
        height: itemRoot.height
        hoverEnabled: true

        onClicked: itemRoot.clicked()
        onEntered: itemRoot.entered()
    }
}
