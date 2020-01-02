import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0

Item
{
    id: itemRoot
    opacity: computedDistance
    width: parent.width
    height: Math.max(minHeight, userLoginText.y + userLoginText.height + textBoxPaddingBottom)
    
    property bool hover: false
    property bool hoverEnabled: true

    transform: Scale
    {
        origin.x: itemRoot.height + 12
        xScale: computedDistance
        yScale: computedDistance
    }

    property real distance: 1.0
    readonly property real computedDistance: Math.sin(Math.PI / 2 * distance)
    property string userName: ""
    property string userLogin: ""
    property string userAvatar: "icons/no_avatar.svg"
    
    property int imagePadding: sizes.imagePaddingItemUser
    property int textBoxMargin: sizes.spacingItemUser
    property int subHeadOffset: sizes.offsetSubHeadItemUser
    property int lowerCaseOffset: sizes.offsetLowerCaseItemUser
    property int textBoxPaddingTop: sizes.paddingTopItemUser
    property int textBoxPaddingLeft: sizes.paddingLeftItemUser
    property int textBoxPaddingBottom: sizes.paddingBottomItemUser
    property int textBoxPaddingRight: sizes.paddingRightItemUser
    
    property int minHeight: 64 + (imagePadding * 2)
    readonly property int imageSize: itemRoot.height - (imagePadding * 2)
    readonly property bool loginIsMain: userName == ""

    SlicedRectangle
    {
        id: iconBackground
        defaultSkewPadding: 0
        x: skewLeft < 0 ? -skewPaddingLeft : 0
        baseWidth: itemRoot.height
        baseHeight: itemRoot.height
        bgColor: ( hoverEnabled && hover ? colors.iconBgHover : colors.iconBg )
        skewLeft: sizes.skewLeftItemUserImage
        skewRight: sizes.skewRightItemUserImage
    }

    Image
    {
        id: profilePicture
        source: userAvatar
        sourceSize.width: imageSize
        sourceSize.height: imageSize
        x: iconBackground.x + iconBackground.skewPaddingLeft + imagePadding
        y: imagePadding
    }

    SlicedRectangle
    {
        id: textBackground
        x: iconBackground.x + iconBackground.widthPartial + textBoxMargin
        y: 0
        defaultSkewPadding: 0
        baseWidth: parent.width - x - skewPaddingLeft - (skewRight < 0 ? skewPaddingRight : 0)
        baseHeight: itemRoot.height
        bgColor: ( hoverEnabled && hover ? colors.textBgHover : colors.textBg )
        skewLeft: sizes.skewLeftItemUserText
        skewRight: sizes.skewRightItemUserText
    }

    Text
    {
        id: userNameText
        text: userName
        color: ( hoverEnabled && hover ? colors.textHover : colors.text )
        
        font: fonts.listItemMed

        elide: Text.ElideRight

        x: textBackground.x + textBackground.skewPaddingLeft + textBoxPaddingLeft
        y: textBackground.y + textBoxPaddingTop

        width: textBackground.widthPartial - textBoxPaddingLeft - textBoxPaddingRight
    }

    Text
    {
        id: userLoginText
        text: userLogin
        color: ( hoverEnabled && hover
                    ? (loginIsMain ?
                        colors.textHover : colors.textDimmedHover)
                    : (loginIsMain ?
                        colors.text : colors.textDimmed) )
        font: loginIsMain ? fonts.listItemBig : fonts.listItemSub
        
        y: userNameText.y + (loginIsMain ? lowerCaseOffset : (userNameText.height + subHeadOffset))
        x: userNameText.x

        elide: Text.ElideRight

        width: textBackground.widthPartial - textBoxPaddingLeft - textBoxPaddingRight
    }
}
