import QtQuick 2.7

Item
{
    /* * * * * * * * * * * * * * * * * *
     *
     *  Functions
     *
     * * * * * * * * * * * * * * * * * */
    function not_null(str) {
        if (str === false || str === 0 || str === "") return true
        return !(str === null || str === undefined);
    }
    function bezier(name) {
        switch (name) {
            case "subtle":
                return [{x:10,y:10},{x:-10,y:10}]
            case "twist":
                return [{x:10,y:10},{x:-10,y:-10}]
            case "default":
            case "flat":
            default:
                return [{x:0,y:0},{x:0,y:0}]
        }
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
    property int defaultPaddingItem:   2
    property int defaultOffsetSlices:  5
    property int defaultImagePadding:  2
    
    property int defaultInnerBorderWidth: 2
    property int defaultBorderWidth:      4
    property string defaultBorderCorner: 'round'
    property bool defaultBorderEnabled:  false
    property bool defaultComplexBorderEnabled: false
    
    property bool defaultShineEnabled:  false
    property int defaultShinePos:        50
    property variant defaultShineBezier: bezier("default")
    
    property bool defaultSlideEnabled: false
    property bool defaultSlideOnHover: true
    property bool defaultSlideOnHighlight: false
    property int defaultSlideOffset:       20
    

    /* * * * * * * * * * * * * * * * * *
     *
     *  Layer 2 options
     *  Common
     *
     * * * * * * * * * * * * * * * * * */
    property int userAreaWidth:
    {
        if (not_null(config.user_area_width)) return config.user_area_width
        else                                  return 450
    }
    property int powerAreaWidth:
    {
        if (not_null(config.power_area_width)) return config.power_area_width
        else                                   return 370
    }
    // Sliding
    property bool slideEnabled:
    {
        if (not_null(config.slide_enabled)) return bool(config.slide_enabled)
        else                                return defaultSlideEnabled
    }
    property bool slideEnabledSlices:
    {
        if (not_null(config.slide_enabled_slices)) return bool(config.slide_enabled_slices)
        else                                       return slideEnabled
    }
    property bool slideEnabledSlicesBottomLeft:
    {
        if (not_null(config.slide_enabled_slices_bottom_left)) return bool(config.slide_enabled_slices_bottom_left)
        else                                                   return slideEnabledSlices
    }
    property bool slideEnabledSlicesBottomRight:
    {
        if (not_null(config.slide_enabled_slices_bottom_right)) return bool(config.slide_enabled_slices_bottom_right)
        else                                                    return slideEnabledSlices
    }
    property bool slideEnabledSlicesTop:
    {
        if (not_null(config.slide_enabled_slices_top)) return bool(config.slide_enabled_slices_top)
        else                                           return slideEnabledSlices
    }
    property bool slideEnabledSlicesLoginButtons:
    {
        if (not_null(config.slide_enabled_slices_login_buttons)) return bool(config.slide_enabled_slices_login_buttons)
        else                                                     return slideEnabledSlices
    }
    property bool slideEnabledItem:
    {
        if (not_null(config.slide_enabled_item)) return bool(config.slide_enabled_item)
        else                                     return slideEnabled
    }
    property bool slideEnabledItemUser:
    {
        if (not_null(config.slide_enabled_item_user)) return bool(config.slide_enabled_item_user)
        else                                          return slideEnabledItem
    }
    property bool slideEnabledItemSession:
    {
        if (not_null(config.slide_enabled_item_session)) return bool(config.slide_enabled_item_session)
        else                                             return slideEnabledItem
    }
    property bool slideEnabledItemPower:
    {
        if (not_null(config.slide_enabled_item_power)) return bool(config.slide_enabled_item_power)
        else                                           return slideEnabledItem
    }
    property bool slideOnHover:
    {
        if (not_null(config.slide_on_hover)) return bool(config.slide_on_hover)
        else                                 return defaultSlideOnHover
    }
    property bool slideOnHoverSlices:
    {
        if (not_null(config.slide_on_hover_slices)) return bool(config.slide_on_hover_slices)
        else                                        return slideOnHover
    }
    property bool slideOnHoverSlicesBottomLeft:
    {
        if (not_null(config.slide_on_hover_slices_bottom_left)) return bool(config.slide_on_hover_slices_bottom_left)
        else                                                    return slideOnHoverSlices
    }
    property bool slideOnHoverSlicesBottomRight:
    {
        if (not_null(config.slide_on_hover_slices_bottom_right)) return bool(config.slide_on_hover_slices_bottom_right)
        else                                                     return slideOnHoverSlices
    }
    property bool slideOnHoverSlicesTop:
    {
        if (not_null(config.slide_on_hover_slices_top)) return bool(config.slide_on_hover_slices_top)
        else                                            return slideOnHoverSlices
    }
    property bool slideOnHoverSlicesLoginButtons:
    {
        if (not_null(config.slide_on_hover_slices_login_buttons)) return bool(config.slide_on_hover_slices_login_buttons)
        else                                                      return slideOnHoverSlices
    }
    property bool slideOnHoverItem:
    {
        if (not_null(config.slide_on_hover_item)) return bool(config.slide_on_hover_item)
        else                                      return slideOnHover
    }
    property bool slideOnHoverItemUser:
    {
        if (not_null(config.slide_on_hover_item_user)) return bool(config.slide_on_hover_item_user)
        else                                           return slideOnHoverItem
    }
    property bool slideOnHoverItemSession:
    {
        if (not_null(config.slide_on_hover_item_session)) return bool(config.slide_on_hover_item_session)
        else                                              return slideOnHoverItem
    }
    property bool slideOnHoverItemPower:
    {
        if (not_null(config.slide_on_hover_item_power)) return bool(config.slide_on_hover_item_power)
        else                                            return slideOnHoverItem
    }
    property bool slideOnHighlight:
    {
        if (not_null(config.slide_on_highlight)) return bool(config.slide_on_highlight)
        else                                     return defaultSlideOnHighlight
    }
    property bool slideOnHighlightSlices:
    {
        if (not_null(config.slide_on_highlight_slices)) return bool(config.slide_on_highlight_slices)
        else                                            return slideOnHighlight
    }
    property bool slideOnHighlightSlicesBottomLeft:
    {
        if (not_null(config.slide_on_highlight_slices_bottom_left)) return bool(config.slide_on_highlight_slices_bottom_left)
        else                                                        return slideOnHighlightSlices
    }
    property bool slideOnHighlightSlicesBottomRight:
    {
        if (not_null(config.slide_on_highlight_slices_bottom_right)) return bool(config.slide_on_highlight_slices_bottom_right)
        else                                                         return slideOnHighlightSlices
    }
    property bool slideOnHighlightSlicesTop:
    {
        if (not_null(config.slide_on_highlight_slices_top)) return bool(config.slide_on_highlight_slices_top)
        else                                                return slideOnHighlightSlices
    }
    property bool slideOnHighlightSlicesLoginButtons:
    {
        if (not_null(config.slide_on_highlight_slices_login_buttons)) return bool(config.slide_on_highlight_slices_login_buttons)
        else                                                          return slideOnHighlightSlices
    }
    property bool slideOnHighlightItem:
    {
        if (not_null(config.slide_on_highlight_item)) return bool(config.slide_on_highlight_item)
        else                                          return slideOnHighlight
    }
    property bool slideOnHighlightItemUser:
    {
        if (not_null(config.slide_on_highlight_item_user)) return bool(config.slide_on_highlight_item_user)
        else                                               return slideOnHighlightItem
    }
    property bool slideOnHighlightItemSession:
    {
        if (not_null(config.slide_on_highlight_item_session)) return bool(config.slide_on_highlight_item_session)
        else                                                  return slideOnHighlightItem
    }
    property bool slideOnHighlightItemPower:
    {
        if (not_null(config.slide_on_highlight_item_power)) return bool(config.slide_on_highlight_item_power)
        else                                                return slideOnHighlightItem
    }
    property int slideOffset:
    {
        if (not_null(config.slide_offset)) return config.slide_offset
        else                               return defaultSlideOffset
    }
    property int slideOffsetSlices:
    {
        if (not_null(config.slide_offset_slices)) return config.slide_offset_slices
        else                                      return slideOffset
    }
    property int slideOffsetSlicesBottomLeft:
    {
        if (not_null(config.slide_offset_slices_bottom_left)) return config.slide_offset_slices_bottom_left
        else                                                  return slideOffsetSlices
    }
    property int slideOffsetSlicesBottomRight:
    {
        if (not_null(config.slide_offset_slices_bottom_right)) return config.slide_offset_slices_bottom_right
        else                                                   return slideOffsetSlices
    }
    property int slideOffsetSlicesTop:
    {
        if (not_null(config.slide_offset_slices_top)) return config.slide_offset_slices_top
        else                                          return slideOffsetSlices
    }
    property int slideOffsetSlicesLoginButtons:
    {
        if (not_null(config.slide_offset_slices_login_buttons)) return config.slide_offset_slices_login_buttons
        else                                                    return slideOffsetSlices
    }
    property int slideOffsetItem:
    {
        if (not_null(config.slide_offset_item)) return config.slide_offset_item
        else                                    return slideOffset
    }
    property int slideOffsetItemUser:
    {
        if (not_null(config.slide_offset_item_user)) return config.slide_offset_item_user
        else                                         return slideOffsetItem
    }
    property int slideOffsetItemSession:
    {
        if (not_null(config.slide_offset_item_session)) return config.slide_offset_item_session
        else                                            return slideOffsetItem
    }
    property int slideOffsetItemPower:
    {
        if (not_null(config.slide_offset_item_power)) return config.slide_offset_item_power
        else                                          return slideOffsetItem
    }
    
    // Borders
    property int innerBorderWidth:
    {
        if (not_null(config.inner_border_width)) return config.inner_border_width
        else                                     return defaultInnerBorderWidth
    }
    property int innerBorderWidthSlices:
    {
        if (not_null(config.inner_border_width_slices)) return config.inner_border_width_slices
        else                                            return innerBorderWidth
    }
    property int innerBorderWidthSlicesBottomLeft:
    {
        if (not_null(config.inner_border_width_slices_bottom_left)) return config.inner_border_width_slices_bottom_left
        else                                                        return innerBorderWidthSlices
    }
    property int innerBorderWidthSlicesBottomRight:
    {
        if (not_null(config.inner_border_width_slices_bottom_right)) return config.inner_border_width_slices_bottom_right
        else                                                         return innerBorderWidthSlices
    }
    property int innerBorderWidthSlicesTop:
    {
        if (not_null(config.inner_border_width_slices_top)) return config.inner_border_width_slices_top
        else                                                return innerBorderWidthSlices
    }
    property int innerBorderWidthSlicesLoginButtons:
    {
        if (not_null(config.inner_border_width_slices_login_buttons)) return config.inner_border_width_slices_login_buttons
        else                                                          return innerBorderWidthSlices
    }
    property int innerBorderWidthItem:
    {
        if (not_null(config.inner_border_width_item)) return config.inner_border_width_item
        else                                          return innerBorderWidth
    }
    property int innerBorderWidthItemUser:
    {
        if (not_null(config.inner_border_width_item_user)) return config.inner_border_width_item_user
        else                                               return innerBorderWidthItem
    }
    property int innerBorderWidthItemSession:
    {
        if (not_null(config.inner_border_width_item_session)) return config.inner_border_width_item_session
        else                                                  return innerBorderWidthItem
    }
    property int innerBorderWidthItemPower:
    {
        if (not_null(config.inner_border_width_item_power)) return config.inner_border_width_item_power
        else                                                return innerBorderWidthItem
    }
    property int borderWidth:
    {
        if (not_null(config.border_width)) return config.border_width
        else                               return defaultBorderWidth
    }
    property int borderWidthSlices:
    {
        if (not_null(config.border_width_slices)) return config.border_width_slices
        else                                      return borderWidth
    }
    property int borderWidthSlicesBottomLeft:
    {
        if (not_null(config.border_width_slices_bottom_left)) return config.border_width_slices_bottom_left
        else                                                  return borderWidthSlices
    }
    property int borderWidthSlicesBottomRight:
    {
        if (not_null(config.border_width_slices_bottom_right)) return config.border_width_slices_bottom_right
        else                                                   return borderWidthSlices
    }
    property int borderWidthSlicesTop:
    {
        if (not_null(config.border_width_slices_top)) return config.border_width_slices_top
        else                                          return borderWidthSlices
    }
    property int borderWidthSlicesLoginButtons:
    {
        if (not_null(config.border_width_slices_login_buttons)) return config.border_width_slices_login_buttons
        else                                                    return borderWidthSlices
    }
    property int borderWidthItem:
    {
        if (not_null(config.border_width_item)) return config.border_width_item
        else                                    return borderWidth
    }
    property int borderWidthItemUser:
    {
        if (not_null(config.border_width_item_user)) return config.border_width_item_user
        else                                         return borderWidthItem
    }
    property int borderWidthItemSession:
    {
        if (not_null(config.border_width_item_session)) return config.border_width_item_session
        else                                            return borderWidthItem
    }
    property int borderWidthItemPower:
    {
        if (not_null(config.border_width_item_power)) return config.border_width_item_power
        else                                          return borderWidthItem
    }
    property string borderCorner:
    {
        if (not_null(config.border_corner)) return config.border_corner
        else                                return defaultBorderCorner
    }
    property string borderCornerSlices:
    {
        if (not_null(config.border_corner_slices)) return config.border_corner_slices
        else                                       return borderCorner
    }
    property string borderCornerSlicesBottomLeft:
    {
        if (not_null(config.border_corner_slices_bottom_left)) return config.border_corner_slices_bottom_left
        else                                                   return borderCornerSlices
    }
    property string borderCornerSlicesBottomRight:
    {
        if (not_null(config.border_corner_slices_bottom_right)) return config.border_corner_slices_bottom_right
        else                                                    return borderCornerSlices
    }
    property string borderCornerSlicesTop:
    {
        if (not_null(config.border_corner_slices_top)) return config.border_corner_slices_top
        else                                           return borderCornerSlices
    }
    property string borderCornerSlicesLoginButtons:
    {
        if (not_null(config.border_corner_slices_login_buttons)) return config.border_corner_slices_login_buttons
        else                                                     return borderCornerSlices
    }
    property string borderCornerItem:
    {
        if (not_null(config.border_corner_item)) return config.border_corner_item
        else                                     return borderCorner
    }
    property string borderCornerItemUser:
    {
        if (not_null(config.border_corner_item_user)) return config.border_corner_item_user
        else                                          return borderCornerItem
    }
    property string borderCornerItemSession:
    {
        if (not_null(config.border_corner_item_session)) return config.border_corner_item_session
        else                                             return borderCornerItem
    }
    property string borderCornerItemPower:
    {
        if (not_null(config.border_corner_item_power)) return config.border_corner_item_power
        else                                           return borderCornerItem
    }
    property bool borderEnabled:
    {
        if (not_null(config.border_enabled)) return bool(config.border_enabled)
        else                                 return defaultBorderEnabled
    }
    property bool borderEnabledSlices:
    {
        if (not_null(config.border_enabled_slices)) return bool(config.border_enabled_slices)
        else                                        return borderEnabled
    }
    property bool borderEnabledSlicesBottomLeft:
    {
        if (not_null(config.border_enabled_slices_bottom_left)) return bool(config.border_enabled_slices_bottom_left)
        else                                                    return borderEnabledSlices
    }
    property bool borderEnabledSlicesBottomRight:
    {
        if (not_null(config.border_enabled_slices_bottom_right)) return bool(config.border_enabled_slices_bottom_right)
        else                                                     return borderEnabledSlices
    }
    property bool borderEnabledSlicesTop:
    {
        if (not_null(config.border_enabled_slices_top)) return bool(config.border_enabled_slices_top)
        else                                            return borderEnabledSlices
    }
    property bool borderEnabledSlicesLoginButtons:
    {
        if (not_null(config.border_enabled_slices_login_buttons)) return bool(config.border_enabled_slices_login_buttons)
        else                                                      return borderEnabledSlices
    }
    property bool borderEnabledItem:
    {
        if (not_null(config.border_enabled_item)) return bool(config.border_enabled_item)
        else                                      return borderEnabled
    }
    property bool borderEnabledItemUser:
    {
        if (not_null(config.border_enabled_item_user)) return bool(config.border_enabled_item_user)
        else                                           return borderEnabledItem
    }
    property bool borderEnabledItemSession:
    {
        if (not_null(config.border_enabled_item_session)) return bool(config.border_enabled_item_session)
        else                                              return borderEnabledItem
    }
    property bool borderEnabledItemPower:
    {
        if (not_null(config.border_enabled_item_power)) return bool(config.border_enabled_item_power)
        else                                            return borderEnabledItem
    }
    property bool complexBorderEnabled:
    {
        if (not_null(config.complex_border_enabled)) return bool(config.complex_border_enabled)
        else                                         return defaultComplexBorderEnabled
    }
    property bool complexBorderEnabledSlices:
    {
        if (not_null(config.complex_border_enabled_slices)) return bool(config.complex_border_enabled_slices)
        else                                                return complexBorderEnabled
    }
    property bool complexBorderEnabledSlicesBottomLeft:
    {
        if (not_null(config.complex_border_enabled_slices_bottom_left)) return bool(config.complex_border_enabled_slices_bottom_left)
        else                                                            return complexBorderEnabledSlices
    }
    property bool complexBorderEnabledSlicesBottomRight:
    {
        if (not_null(config.complex_border_enabled_slices_bottom_right)) return bool(config.complex_border_enabled_slices_bottom_right)
        else                                                             return complexBorderEnabledSlices
    }
    property bool complexBorderEnabledSlicesTop:
    {
        if (not_null(config.complex_border_enabled_slices_top)) return bool(config.complex_border_enabled_slices_top)
        else                                                    return complexBorderEnabledSlices
    }
    property bool complexBorderEnabledSlicesLoginButtons:
    {
        if (not_null(config.complex_border_enabled_slices_login_buttons)) return bool(config.complex_border_enabled_slices_login_buttons)
        else                                                              return complexBorderEnabledSlices
    }
    property bool complexBorderEnabledItem:
    {
        if (not_null(config.complex_border_enabled_item)) return bool(config.complex_border_enabled_item)
        else                                              return complexBorderEnabled
    }
    property bool complexBorderEnabledItemUser:
    {
        if (not_null(config.complex_border_enabled_item_user)) return bool(config.complex_border_enabled_item_user)
        else                                                   return complexBorderEnabledItem
    }
    property bool complexBorderEnabledItemSession:
    {
        if (not_null(config.complex_border_enabled_item_session)) return bool(config.complex_border_enabled_item_session)
        else                                                      return complexBorderEnabledItem
    }
    property bool complexBorderEnabledItemPower:
    {
        if (not_null(config.complex_border_enabled_item_power)) return bool(config.complex_border_enabled_item_power)
        else                                                    return complexBorderEnabledItem
    }
    
    // Shine
    property int shinePos:
    {
        if (not_null(config.shine_pos)) return config.shine_pos
        else                            return defaultShinePos
    }
    property int shinePosSlices:
    {
        if (not_null(config.shine_pos_slices)) return config.shine_pos_slices
        else                                   return shinePos
    }
    property int shinePosSlicesBottomLeft:
    {
        if (not_null(config.shine_pos_slices_bottom_left)) return config.shine_pos_slices_bottom_left
        else                                               return shinePosSlices
    }
    property int shinePosSlicesBottomRight:
    {
        if (not_null(config.shine_pos_slices_bottom_right)) return config.shine_pos_slices_bottom_right
        else                                                return shinePosSlices
    }
    property int shinePosSlicesTop:
    {
        if (not_null(config.shine_pos_slices_top)) return config.shine_pos_slices_top
        else                                       return shinePosSlices
    }
    property int shinePosSlicesLoginButtons:
    {
        if (not_null(config.shine_pos_slices_login_buttons)) return config.shine_pos_slices_login_buttons
        else                                                 return shinePosSlices
    }
    property int shinePosItem:
    {
        if (not_null(config.shine_pos_item)) return config.shine_pos_item
        else                                 return shinePos
    }
    property int shinePosItemUser:
    {
        if (not_null(config.shine_pos_item_user)) return config.shine_pos_item_user
        else                                      return shinePosItem
    }
    property int shinePosItemSession:
    {
        if (not_null(config.shine_pos_item_session)) return config.shine_pos_item_session
        else                                         return shinePosItem
    }
    property int shinePosItemPower:
    {
        if (not_null(config.shine_pos_item_power)) return config.shine_pos_item_power
        else                                       return shinePosItem
    }

    property variant shineBezier:
    {
        if (not_null(config.shine_bezier)) return bezier(config.shine_bezier)
        else                               return defaultShineBezier
    }
    property variant shineBezierSlices:
    {
        if (not_null(config.shine_bezier_slices)) return bezier(config.shine_bezier_slices)
        else                                      return shineBezier
    }
    property variant shineBezierSlicesBottomLeft:
    {
        if (not_null(config.shine_bezier_slices_bottom_left)) return bezier(config.shine_bezier_slices_bottom_left)
        else                                                  return shineBezierSlices
    }
    property variant shineBezierSlicesBottomRight:
    {
        if (not_null(config.shine_bezier_slices_bottom_right)) return bezier(config.shine_bezier_slices_bottom_right)
        else                                                   return shineBezierSlices
    }
    property variant shineBezierSlicesTop:
    {
        if (not_null(config.shine_bezier_slices_top)) return bezier(config.shine_bezier_slices_top)
        else                                          return shineBezierSlices
    }
    property variant shineBezierSlicesLoginButtons:
    {
        if (not_null(config.shine_bezier_slices_login_buttons)) return bezier(config.shine_bezier_slices_login_buttons)
        else                                                    return shineBezierSlices
    }
    property variant shineBezierItem:
    {
        if (not_null(config.shine_bezier_item)) return bezier(config.shine_bezier_item)
        else                                    return shineBezier
    }
    property variant shineBezierItemUser:
    {
        if (not_null(config.shine_bezier_item_user)) return bezier(config.shine_bezier_item_user)
        else                                         return shineBezierItem
    }
    property variant shineBezierItemSession:
    {
        if (not_null(config.shine_bezier_item_session)) return bezier(config.shine_bezier_item_session)
        else                                            return shineBezierItem
    }
    property variant shineBezierItemPower:
    {
        if (not_null(config.shine_bezier_item_power)) return bezier(config.shine_bezier_item_power)
        else                                          return shineBezierItem
    }
    property bool shineEnabled:
    {
        if (not_null(config.shine_enabled)) return bool(config.shine_enabled)
        else                                return defaultShineEnabled
    }
    property bool shineEnabledSlices:
    {
        if (not_null(config.shine_enabled_slices)) return bool(config.shine_enabled_slices)
        else                                       return shineEnabled
    }
    property bool shineEnabledSlicesBottomLeft:
    {
        if (not_null(config.shine_enabled_slices_bottom_left)) return bool(config.shine_enabled_slices_bottom_left)
        else                                                   return shineEnabledSlices
    }
    property bool shineEnabledSlicesBottomRight:
    {
        if (not_null(config.shine_enabled_slices_bottom_right)) return bool(config.shine_enabled_slices_bottom_right)
        else                                                    return shineEnabledSlices
    }
    property bool shineEnabledSlicesTop:
    {
        if (not_null(config.shine_enabled_slices_top)) return bool(config.shine_enabled_slices_top)
        else                                           return shineEnabledSlices
    }
    property bool shineEnabledSlicesLoginButtons:
    {
        if (not_null(config.shine_enabled_slices_login_buttons)) return bool(config.shine_enabled_slices_login_buttons)
        else                                                     return shineEnabledSlices
    }
    property bool shineEnabledItem:
    {
        if (not_null(config.shine_enabled_item)) return bool(config.shine_enabled_item)
        else                                     return shineEnabled
    }
    property bool shineEnabledItemUser:
    {
        if (not_null(config.shine_enabled_item_user)) return bool(config.shine_enabled_item_user)
        else                                          return shineEnabledItem
    }
    property bool shineEnabledItemSession:
    {
        if (not_null(config.shine_enabled_item_session)) return bool(config.shine_enabled_item_session)
        else                                             return shineEnabledItem
    }
    property bool shineEnabledItemPower:
    {
        if (not_null(config.shine_enabled_item_power)) return bool(config.shine_enabled_item_power)
        else                                           return shineEnabledItem
    }

    
    
    
    
    
    
    
    
    
    
    
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
