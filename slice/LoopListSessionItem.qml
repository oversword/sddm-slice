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
        x: sessionNameLabel.x - textBoxPaddingLeft - skewPaddingLeft
        y: sessionNameLabel.y - textBoxPaddingTop
        defaultSkewPadding: 0
        baseWidth: sessionNameLabel.width + textBoxPaddingLeft + textBoxPaddingRight
        baseHeight: sessionNameLabel.height + textBoxPaddingBottom + textBoxPaddingTop
        bgColor: ( hover ? colors.textBgHover : colors.textBg )
        skewLeft: sizes.skewLeftItemSession
        skewRight: sizes.skewRightItemSession
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
