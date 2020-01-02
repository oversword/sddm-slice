import QtQuick 2.7
import QtGraphicalEffects 1.0

Item
{
    id: itemRoot
    opacity: distance
    property int duration: 100
    width: parent.width
    height: descriptionLabel.height + textBoxPaddingBottom + textBoxPaddingTop
    
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
    readonly property int imageWidth: itemRoot.height - (imagePadding * 2)
/*
    Rectangle
    {
        id: iconBackground
        width: itemRoot.height
        height: itemRoot.height
        color: ( hover ? colors.iconBgHover : colors.iconBg )
    }
    */

    SlicedRectangle
    {
        id: iconBackground
        baseWidth: itemRoot.height
        baseHeight: itemRoot.height
        bgColor: ( hover ? colors.iconBgHover : colors.iconBg )
        skewLeft: sizes.skewLeftItemPowerImage
        skewRight: sizes.skewRightItemPowerImage
    }

    Image
    {
        id: powerItemIcon
        source: icon
        sourceSize.width: imageWidth
        sourceSize.height: imageWidth
        x: imagePadding + iconBackground.skewPaddingLeft
        y: imagePadding
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
        baseWidth: parent.width - x - skewPaddingLeft - skewPaddingRight
        baseHeight: itemRoot.height
        bgColor: ( hover ? colors.textBgHover : colors.textBg )
        skewLeft: sizes.skewLeftItemPowerText
        skewRight: sizes.skewRightItemPowerText
    }

    Text
    {
        id: descriptionLabel
        text: itemRoot.title
        color: ( hover ? colors.textHover : colors.text )
        width: parent.width - x - textBackground.skewPaddingRight - textBoxPaddingRight

        font: fonts.listItemMed
        elide: Text.ElideRight

        x: textBackground.x + textBackground.skewPaddingLeft + textBoxPaddingLeft
        y: textBoxPaddingTop
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
