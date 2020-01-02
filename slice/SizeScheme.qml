import QtQuick 2.7

Item
{
    /* * * * * * * * * * * * * * * * * *
     *
     *  Functions
     *
     * * * * * * * * * * * * * * * * * */
    function not_null(str) {
        return !(str === null || str === undefined);
    }
    
    /* * * * * * * * * * * * * * * * * *
     *
     *  Layer 0 options
     *  Defaults / Fallbacks
     *
     * * * * * * * * * * * * * * * * * */
    
    property int defaultSkewSlices:   26
    property int defaultSkewItem:      0
    property int defaultPaddingSlices: 0
    property int defaultSpacingSlices: 3
    property int defaultSpacingItem:   2
    property int defaultOffsetSlices:  5
    property int defaultImagePadding:  2
    

    /* * * * * * * * * * * * * * * * * *
     *
     *  Layer 2 options
     *  Common
     *
     * * * * * * * * * * * * * * * * * */
    
    
    
    property int skewItem:
    {
        if (not_null(config.skew_item)) return config.skew_item
        else                            return defaultSkewItem
    }
    property int skewInnerItem:
    {
        if (not_null(config.skew_inner_item)) return config.skew_inner_item
        else                                  return skewItem
    }
    property int skewOuterItem:
    {
        if (not_null(config.skew_outer_item)) return config.skew_outer_item
        else                                  return skewItem
    }
    property int skewItemSession:
    {
        if (not_null(config.skew_item_session))  return config.skew_item_session
        else                                     return skewItem
    }
    property int skewInnerItemUser:
    {
        if (not_null(config.skew_inner_item_user)) return config.skew_inner_item_user
        if (not_null(config.skew_item_user))       return config.skew_item_user
        else                                       return skewInnerItem
    }
    property int skewOuterItemUser:
    {
        if (not_null(config.skew_outer_item_user)) return config.skew_outer_item_user
        if (not_null(config.skew_item_user))       return config.skew_item_user
        else                                       return skewOuterItem
    }
    property int skewInnerItemPower:
    {
        if (not_null(config.skew_inner_item_power)) return config.skew_inner_item_power
        if (not_null(config.skew_item_power))       return config.skew_item_power
        else                                        return skewInnerItem
    }
    property int skewOuterItemPower:
    {
        if (not_null(config.skew_outer_item_power)) return config.skew_outer_item_power
        if (not_null(config.skew_item_power))       return config.skew_item_power
        else                                        return skewOuterItem
    }
    
    
    property int skewLeftItemPowerImage:
    {
        if (not_null(config.skew_left_item_power_image)) return config.skew_left_item_power_image
        else if (not_null(config.skew_item_power_image)) return config.skew_item_power_image
        else                                             return skewOuterItemPower
    }
    property int skewRightItemPowerImage:
    {
        if (not_null(config.skew_right_item_power_image)) return config.skew_right_item_power_image
        else if (not_null(config.skew_item_power_image))  return config.skew_item_power_image
        else                                              return skewInnerItemPower
    }
    property int skewLeftItemPowerText:
    {
        if (not_null(config.skew_left_item_power_text)) return config.skew_left_item_power_text
        else if (not_null(config.skew_item_power_text)) return config.skew_item_power_text
        else                                            return skewInnerItemPower
    }
    property int skewRightItemPowerText:
    {
        if (not_null(config.skew_right_item_power_text)) return config.skew_right_item_power_text
        else if (not_null(config.skew_item_power_text))  return config.skew_item_power_text
        else                                             return skewOuterItemPower
    }
    
    
    property int skewLeftItemUserImage:
    {
        if (not_null(config.skew_left_item_user_image)) return config.skew_left_item_user_image
        else if (not_null(config.skew_item_user_image)) return config.skew_item_user_image
        else                                            return skewOuterItemUser
    }
    property int skewRightItemUserImage:
    {
        if (not_null(config.skew_right_item_user_image)) return config.skew_right_item_user_image
        else if (not_null(config.skew_item_user_image))  return config.skew_item_user_image
        else                                             return skewInnerItemUser
    }
    property int skewLeftItemUserText:
    {
        if (not_null(config.skew_left_item_user_text)) return config.skew_left_item_user_text
        else if (not_null(config.skew_item_user_text)) return config.skew_item_user_text
        else                                           return skewInnerItemUser
    }
    property int skewRightItemUserText:
    {
        if (not_null(config.skew_right_item_user_text)) return config.skew_right_item_user_text
        else if (not_null(config.skew_item_user_text))  return config.skew_item_user_text
        else                                            return skewOuterItemUser
    }
    
    property int skewLeftItemSession:
    {
        if (not_null(config.skew_left_item_session)) return config.skew_left_item_session
        else if (not_null(config.skew_item_session)) return config.skew_item_session
        else                                         return skewItemSession
    }
    property int skewRightItemSession:
    {
        if (not_null(config.skew_right_item_session)) return config.skew_right_item_session
        else                                          return skewItemSession
    }
    
    
    
    property int imagePadding:
    {
        if (not_null(config.image_padding)) return config.image_padding
        else                                return defaultImagePadding
    }
    property int imagePaddingItemUser:
    {
        if (not_null(config.image_padding_item_user)) return config.image_padding_item_user
        else                                          return imagePadding
    }
    property int imagePaddingItemPower:
    {
        if (not_null(config.image_padding_item_power)) return config.image_padding_item_power
        else                                           return imagePadding
    }
    
    property int offsetSubHeadItemUser:
    {
        if (not_null(config.offset_sub_head_item_user)) return config.offset_sub_head_item_user
        else                                            return 0
    }
    property int offsetLowerCaseItemUser: 
    {
        if (not_null(config.offset_lower_case_item_user)) return config.offset_lower_case_item_user
        else                                              return 0
    }
    
    property int spacingItem:
    {
        if (not_null(config.spacing_item)) return config.spacing_item
        else                               return defaultSpacingItem
    }
    property int spacingItemUser:
    {
        if (not_null(config.spacing_item_user)) return config.spacing_item_user
        else                                    return spacingItem
    }
    property int spacingItemPower:
    {
        if (not_null(config.spacing_item_power)) return config.spacing_item_power
        else                                     return spacingItem
    }

    // Offset
    property int offsetSlices:
    {
        if (not_null(config.offset_slices)) return config.offset_slices
        else                                return defaultOffsetSlices
    }

    property int offsetSlicesTop:
    {
        if (not_null(config.offset_slices_top)) return config.offset_slices_top
        else                                    return offsetSlices
    }

    property int offsetHorizontalSlicesTop:
    {
        if (not_null(config.offset_horizontal_slices_top)) return config.offset_horizontal_slices_top
        else                                               return offsetSlicesTop
    }

    property int offsetVerticalSlicesTop:
    {
        if (not_null(config.offset_vertical_slices_top)) return config.offset_vertical_slices_top
        else                                             return offsetSlicesTop
    }

    property int offsetSlicesBottomRight:
    {
        if (not_null(config.offset_slices_bottom_right)) return config.offset_slices_bottom_right
        else                                             return offsetSlices
    }

    property int offsetHorizontalSlicesBottomRight:
    {
        if (not_null(config.offset_horizontal_slices_bottom_right)) return config.offset_horizontal_slices_bottom_right
        else                                                        return offsetSlicesBottomRight
    }

    property int offsetVerticalSlicesBottomRight:
    {
        if (not_null(config.offset_vertical_slices_bottom_right)) return config.offset_vertical_slices_bottom_right
        else                                                      return offsetSlicesBottomRight
    }

    property int offsetSlicesBottomLeft:
    {
        if (not_null(config.offset_slices_bottom_left)) return config.offset_slices_bottom_left
        else                                            return offsetSlices
    }

    property int offsetHorizontalSlicesBottomLeft:
    {
        if (not_null(config.offset_horizontal_slices_bottom_left)) return config.offset_horizontal_slices_bottom_left
        else                                                       return offsetSlicesBottomLeft
    }

    property int offsetVerticalSlicesBottomLeft:
    {
        if (not_null(config.offset_vertical_slices_bottom_left)) return config.offset_vertical_slices_bottom_left
        else                                                     return offsetSlicesBottomLeft
    }

    property int offsetSlicesLoginButtons:
    {
        if (not_null(config.offset_slices_login_buttons)) return config.offset_slices_login_buttons
        else                                              return offsetSlices
    }

    property int offsetHorizontalSlicesLoginButtons:
    {
        if (not_null(config.offset_horizontal_slices_login_buttons)) return config.offset_horizontal_slices_login_buttons
        else                                                         return offsetSlicesLoginButtons
    }

    property int offsetVerticalSlicesLoginButtons:
    {
        if (not_null(config.offset_vertical_slices_login_buttons)) return config.offset_vertical_slices_login_buttons
        else                                                       return offsetSlicesLoginButtons
    }
    
    // Spacing
    property int spacingSlices:
    {
        if (not_null(config.spacing_slices)) return config.spacing_slices
        else                                 return defaultSpacingSlices
    }

    property int spacingSlicesTop:
    {
        if (not_null(config.spacing_slices_top)) return config.spacing_slices_top
        else                                     return spacingSlices
    }

    property int spacingSlicesBottomRight:
    {
        if (not_null(config.spacing_slices_bottom_right)) return config.spacing_slices_bottom_right
        else                                              return spacingSlices
    }

    property int spacingSlicesBottomLeft:
    {
        if (not_null(config.spacing_slices_bottom_left)) return config.spacing_slices_bottom_left
        else                                             return spacingSlices
    }

    property int spacingSlicesLoginButtons:
    {
        if (not_null(config.spacing_slices_login_buttons)) return config.spacing_slices_login_buttons
        else                                               return spacingSlices
    }

    // Skew
    property int skewSlices:
    {
        if (not_null(config.skew_slices)) return config.skew_slices
        else                              return defaultSkewSlices
    }
    
    property int skewSlicesTop:
    {
        if (not_null(config.skew_slices_top)) return config.skew_slices_top
        else                                  return skewSlices
    }
    
    property int skewSlicesBottomLeft:
    {
        if (not_null(config.skew_slices_bottom_left)) return config.skew_slices_bottom_left
        else                                          return skewSlices
    }
    
    property int skewSlicesBottomRight:
    {
        if (not_null(config.skew_slices_bottom_right)) return config.skew_slices_bottom_right
        else                                           return skewSlices
    }
    
    property int skewSlicesLoginButtons:
    {
        if (not_null(config.skew_slices_login_buttons)) return config.skew_slices_login_buttons
        else                                            return skewSlices
    }
    
    // Padding
    property int paddingSlices:
    {
        if (not_null(config.padding_slices)) return config.padding_slices
        else                                 return defaultPaddingSlices
    }

    property int paddingHorizontalSlices:
    {
        if (not_null(config.padding_horizontal_slices)) return config.padding_horizontal_slices
        else                                            return paddingSlices
    }

    property int paddingVerticalSlices:
    {
        if (not_null(config.padding_vertical_slices)) return config.padding_vertical_slices
        else                                          return paddingSlices
    }

    property int paddingLeftSlices:
    {
        if (not_null(config.padding_left_slices))            return config.padding_left_slices
        else if (not_null(config.padding_horizontal_slices)) return config.padding_horizontal_slices
        else                                                 return paddingSlices
    }

    property int paddingRightSlices:
    {
        if (not_null(config.padding_right_slices))           return config.padding_right_slices
        else if (not_null(config.padding_horizontal_slices)) return config.padding_horizontal_slices
        else                                                 return paddingSlices
    }
    
    property int paddingTopSlices:
    {
        if (not_null(config.padding_top_slices))           return config.padding_top_slices
        else if (not_null(config.padding_vertical_slices)) return config.padding_vertical_slices
        else                                               return paddingSlices
    }
    
    property int paddingBottomSlices:
    {
        if (not_null(config.padding_bottom_slices))        return config.padding_bottom_slices
        else if (not_null(config.padding_vertical_slices)) return config.padding_vertical_slices
        else                                               return paddingSlices
    }

    property int paddingItem:
    {
        if (not_null(config.padding_item)) return config.padding_item
        else                               return defaultPaddingItem
    }

    property int paddingHorizontalItem:
    {
        if (not_null(config.padding_horizontal_item)) return config.padding_horizontal_item
        else                                          return paddingItem
    }

    property int paddingVerticalItem:
    {
        if (not_null(config.padding_vertical_item)) return config.padding_vertical_item
        else                                        return paddingItem
    }

    property int paddingLeftItem:
    {
        if (not_null(config.padding_left_item))            return config.padding_left_item
        else if (not_null(config.padding_horizontal_item)) return config.padding_horizontal_item
        else                                               return paddingItem
    }

    property int paddingRightItem:
    {
        if (not_null(config.padding_right_item))           return config.padding_right_item
        else if (not_null(config.padding_horizontal_item)) return config.padding_horizontal_item
        else                                               return paddingItem
    }
    
    property int paddingTopItem:
    {
        if (not_null(config.padding_top_item))           return config.padding_top_item
        else if (not_null(config.padding_vertical_item)) return config.padding_vertical_item
        else                                             return paddingItem
    }
    
    property int paddingBottomItem:
    {
        if (not_null(config.padding_bottom_item))        return config.padding_bottom_item
        else if (not_null(config.padding_vertical_item)) return config.padding_vertical_item
        else                                             return paddingItem
    }

    /* * * * * * * * * * * * * * * * * *
     *
     *  Layer 3 options
     *  Control types
     *
     * * * * * * * * * * * * * * * * * */
    // Loop Items
    
    property int paddingLeftItemSession:
    {
        if (not_null(config.padding_left_item_session))            return config.padding_left_item_session
        else if (not_null(config.padding_horizontal_item_session)) return config.padding_horizontal_item_session
        else if (not_null(config.padding_item_session))            return config.padding_item_session
        else                                                       return paddingLeftItem
    }

    property int paddingBottomItemSession:
    {
        if (not_null(config.padding_bottom_item_session))        return config.padding_bottom_item_session
        else if (not_null(config.padding_vertical_item_session)) return config.padding_vertical_item_session
        else if (not_null(config.padding_item_session))          return config.padding_item_session
        else                                                     return paddingBottomItem
    }

    property int paddingRightItemSession:
    {
        if (not_null(config.padding_right_item_session))           return config.padding_right_item_session
        else if (not_null(config.padding_horizontal_item_session)) return config.padding_horizontal_item_session
        else if (not_null(config.padding_item_session))            return config.padding_item_session
        else                                                       return paddingRightItem
    }

    property int paddingTopItemSession:
    {
        if (not_null(config.padding_top_item_session))           return config.padding_top_item_session
        else if (not_null(config.padding_vertical_item_session)) return config.padding_vertical_item_session
        else if (not_null(config.padding_item_session))          return config.padding_item_session
        else                                                     return paddingTopItem
    }

    property int paddingLeftItemUser:
    {
        if (not_null(config.padding_left_item_user))            return config.padding_left_item_user
        else if (not_null(config.padding_horizontal_item_user)) return config.padding_horizontal_item_user
        else if (not_null(config.padding_item_user))            return config.padding_item_user
        else                                                    return paddingLeftItem
    }

    property int paddingRightItemUser:
    {
        if (not_null(config.padding_right_item_user))           return config.padding_right_item_user
        else if (not_null(config.padding_horizontal_item_user)) return config.padding_horizontal_item_user
        else if (not_null(config.padding_item_user))            return config.padding_item_user
        else                                                    return paddingRightItem
    }

    property int paddingBottomItemUser:
    {
        if (not_null(config.padding_bottom_item_user))        return config.padding_bottom_item_user
        else if (not_null(config.padding_vertical_item_user)) return config.padding_vertical_item_user
        else if (not_null(config.padding_item_user))          return config.padding_item_user
        else                                                  return paddingBottomItem
    }

    property int paddingTopItemUser:
    {
        if (not_null(config.padding_top_item_user))           return config.padding_top_item_user
        else if (not_null(config.padding_vertical_item_user)) return config.padding_vertical_item_user
        else if (not_null(config.padding_item_user))          return config.padding_item_user
        else                                                  return paddingTopItem
    }

    property int paddingLeftItemPower:
    {
        if (not_null(config.padding_left_item_power))            return config.padding_left_item_power
        else if (not_null(config.padding_horizontal_item_power)) return config.padding_horizontal_item_power
        else if (not_null(config.padding_item_power))            return config.padding_item_power
        else                                                     return paddingLeftItem
    }

    property int paddingRightItemPower:
    {
        if (not_null(config.padding_right_item_power))           return config.padding_right_item_power
        else if (not_null(config.padding_horizontal_item_power)) return config.padding_horizontal_item_power
        else if (not_null(config.padding_item_power))            return config.padding_item_power
        else                                                     return paddingRightItem
    }

    property int paddingBottomItemPower:
    {
        if (not_null(config.padding_bottom_item_power))        return config.padding_bottom_item_power
        else if (not_null(config.padding_vertical_item_power)) return config.padding_vertical_item_power
        else if (not_null(config.padding_item_power))          return config.padding_item_power
        else                                                   return paddingBottomItem
    }

    property int paddingTopItemPower:
    {
        if (not_null(config.padding_top_item_power))           return config.padding_top_item_power
        else if (not_null(config.padding_vertical_item_power)) return config.padding_vertical_item_power
        else if (not_null(config.padding_item_power))          return config.padding_item_power
        else                                                   return paddingTopItem
    }

    // Buttons
    property int paddingLeftSlicesTop:
    {
        if (not_null(config.padding_left_slices_top))            return config.padding_left_slices_top
        else if (not_null(config.padding_horizontal_slices_top)) return config.padding_horizontal_slices_top
        else if (not_null(config.padding_slices_top))            return config.padding_slices_top
        else                                                     return paddingLeftSlices
    }
    
    property int paddingRightSlicesTop:
    {
        if (not_null(config.padding_right_slices_top))           return config.padding_right_slices_top
        else if (not_null(config.padding_horizontal_slices_top)) return config.padding_horizontal_slices_top
        else if (not_null(config.padding_slices_top))            return config.padding_slices_top
        else                                                     return paddingRightSlices
    }

    property int paddingBottomSlicesTop:
    {
        if (not_null(config.padding_bottom_slices_top))        return config.padding_bottom_slices_top
        else if (not_null(config.padding_vertical_slices_top)) return config.padding_vertical_slices_top
        else if (not_null(config.padding_slices_top))          return config.padding_slices_top
        else                                                   return paddingBottomSlices
    }
    
    property int paddingTopSlicesTop:
    {
        if (not_null(config.padding_top_slices_top))           return config.padding_top_slices_top
        else if (not_null(config.padding_vertical_slices_top)) return config.padding_vertical_slices_top
        else if (not_null(config.padding_slices_top))          return config.padding_slices_top
        else                                                   return paddingTopSlices
    }

    property int paddingLeftSlicesBottomRight:
    {
        if (not_null(config.padding_left_slices_bottom_right))            return config.padding_left_slices_bottom_right
        else if (not_null(config.padding_horizontal_slices_bottom_right)) return config.padding_horizontal_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))            return config.padding_slices_bottom_right
        else                                                              return paddingLeftSlices
    }

    property int paddingBottomSlicesBottomRight:
    {
        if (not_null(config.padding_bottom_slices_bottom_right))        return config.padding_bottom_slices_bottom_right
        else if (not_null(config.padding_vertical_slices_bottom_right)) return config.padding_vertical_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))          return config.padding_slices_bottom_right
        else                                                            return paddingBottomSlices
    }

    property int paddingRightSlicesBottomRight:
    {
        if (not_null(config.padding_right_slices_bottom_right))           return config.padding_right_slices_bottom_right
        else if (not_null(config.padding_horizontal_slices_bottom_right)) return config.padding_horizontal_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))            return config.padding_slices_bottom_right
        else                                                              return paddingRightSlices
    }

    property int paddingTopSlicesBottomRight:
    {
        if (not_null(config.padding_top_slices_bottom_right))           return config.padding_top_slices_bottom_right
        else if (not_null(config.padding_vertical_slices_bottom_right)) return config.padding_vertical_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))          return config.padding_slices_bottom_right
        else                                                            return paddingTopSlices
    }

    property int paddingLeftSlicesBottomLeft:
    {
        if (not_null(config.padding_left_slices_bottom_left))            return config.padding_left_slices_bottom_left
        else if (not_null(config.padding_horizontal_slices_bottom_left)) return config.padding_horizontal_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))            return config.padding_slices_bottom_left
        else                                                             return paddingLeftSlices
    }

    property int paddingRightSlicesBottomLeft:
    {
        if (not_null(config.padding_right_slices_bottom_left))           return config.padding_right_slices_bottom_left
        else if (not_null(config.padding_horizontal_slices_bottom_left)) return config.padding_horizontal_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))            return config.padding_slices_bottom_left
        else                                                             return paddingRightSlices
    }

    property int paddingBottomSlicesBottomLeft:
    {
        if (not_null(config.padding_bottom_slices_bottom_left))        return config.padding_bottom_slices_bottom_left
        else if (not_null(config.padding_vertical_slices_bottom_left)) return config.padding_vertical_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))          return config.padding_slices_bottom_left
        else                                                           return paddingBottomSlices
    }

    property int paddingTopSlicesBottomLeft:
    {
        if (not_null(config.padding_top_slices_bottom_left))           return config.padding_top_slices_bottom_left
        else if (not_null(config.padding_vertical_slices_bottom_left)) return config.padding_vertical_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))          return config.padding_slices_bottom_left
        else                                                           return paddingTopSlices
    }

    property int paddingLeftSlicesLoginButtons:
    {
        if (not_null(config.padding_left_slices_login_buttons))            return config.padding_left_slices_login_buttons
        else if (not_null(config.padding_horizontal_slices_login_buttons)) return config.padding_horizontal_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))            return config.padding_slices_login_buttons
        else                                                               return paddingLeftSlices
    }

    property int paddingRightSlicesLoginButtons:
    {
        if (not_null(config.padding_right_slices_login_buttons))           return config.padding_right_slices_login_buttons
        else if (not_null(config.padding_horizontal_slices_login_buttons)) return config.padding_horizontal_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))            return config.padding_slices_login_buttons
        else                                                               return paddingRightSlices
    }

    property int paddingBottomSlicesLoginButtons:
    {
        if (not_null(config.padding_bottom_slices_login_buttons))        return config.padding_bottom_slices_login_buttons
        else if (not_null(config.padding_vertical_slices_login_buttons)) return config.padding_vertical_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))          return config.padding_slices_login_buttons
        else                                                             return paddingBottomSlices
    }

    property int paddingTopSlicesLoginButtons:
    {
        if (not_null(config.padding_top_slices_login_buttons))           return config.padding_top_slices_login_buttons
        else if (not_null(config.padding_vertical_slices_login_buttons)) return config.padding_vertical_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))          return config.padding_slices_login_buttons
        else                                                             return paddingTopSlices
    }
}
