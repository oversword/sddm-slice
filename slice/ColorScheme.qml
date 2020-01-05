import QtQuick 2.7

Item
{
    /* * * * * * * * * * * * * * * * * *
     *
     *  Layer 1 options
     *  Required
     *
     * * * * * * * * * * * * * * * * * */

    // Background
    property color background: config.color_bg

    // Base colors
    property color main: config.color_main
    property color dimmed: config.color_dimmed
    property color contrast: config.color_contrast


    /* * * * * * * * * * * * * * * * * *
     *
     *  Layer 2 options
     *  Common
     *
     * * * * * * * * * * * * * * * * * */
    
    
    property color shine: 
    {
        if (config.color_shine) return config.color_shine
        else                    return Qt.rgba(contrast.r, contrast.g, contrast.b, 0.2)
    }
    property color border: 
    {
        if (config.color_border) return config.color_border
        else                     return main
    }
    property color borderInner:
    {
        if (config.color_border_inner) return config.color_border_inner
        else                           return dimmed
    }
    property color borderHover:
    {
        if (config.color_border_hover) return config.color_border_hover
        else                           contrast
    }
    
    // Texture
    property string texture:
    {
        if (config.texture) return config.texture
        else                return ""
    }
    property string textureSlices:
    {
        if (config.texture_slices) return config.texture_slices
        else                       return texture
    }
    property string textureSlicesBottomLeft:
    {
        if (config.texture_slices_bottom_left) return config.texture_slices_bottom_left
        else                                   return textureSlices
    }
    property string textureSlicesBottomRight:
    {
        if (config.texture_slices_bottom_right) return config.texture_slices_bottom_right
        else                                    return textureSlices
    }
    property string textureSlicesTop:
    {
        if (config.texture_slices_top) return config.texture_slices_top
        else                           return textureSlices
    }
    property string textureSlicesLoginButtons:
    {
        if (config.texture_slices_login_buttons) return config.texture_slices_login_buttons
        else                                     return textureSlices
    }
    property string textureItem:
    {
        if (config.texture_item) return config.texture_item
        else                     return texture
    }
    property string textureItemUser:
    {
        if (config.texture_item_user) return config.texture_item_user
        else                          return textureItem
    }
    property string textureItemSession:
    {
        if (config.texture_item_session) return config.texture_item_session
        else                             return textureItem
    }
    property string textureItemPower:
    {
        if (config.texture_item_power) return config.texture_item_power
        else                           return textureItem
    }

    // Text elements
    property color text:
    {
        if (config.color_text) return config.color_text
        else                   return main
    }
    property color textDimmed:
    {
        if (config.color_text_dimmed) return config.color_text_dimmed
        else                          return dimmed
    } 
    property color textBg: {
        if (config.color_text_bg) return config.color_text_bg
        else                      return Qt.rgba(main.r, main.g, main.b, 0.1)
    }
    property color textHover:
    {
        if (config.color_text_hover) return config.color_text_hover
        else                         return text
    }
    property color textDimmedHover:
    {
        if (config.color_text_dimmed_hover) return config.color_text_dimmed_hover
        else                                return textDimmed
    }
    property color textBgHover:
    {
        if (config.color_text_bg_hover) return config.color_text_bg_hover
        else if (config.color_text_bg)  return config.color_text_bg
        else                            return Qt.rgba(main.r, main.g, main.b, 0.15)
    }
    property color textShine: 
    {
        if (config.color_text_shine) return config.color_text_shine
        else                         return shine
    }
    // Icon border
    property color textBorder: 
    {
        if (config.color_text_border) return config.color_text_border
        else                          return border
    }
    property color textBorderInner:
    {
        if (config.color_text_border_inner) return config.color_text_border_inner
        else                                return borderInner
    }
    property color textBorderHover:
    {
        if (config.color_text_border_hover) return config.color_text_border_hover
        else                                borderHover
    }

    // Icon elements
    property color icon:
    {
        if (config.color_icon) return config.color_icon
        else                   return text
    }
    property color iconBg:
    { 
        if (config.color_icon_bg) return config.color_icon_bg
        else                      return Qt.rgba(main.r, main.g, main.b, 0.05)
    }
    property color iconHover:
    {
        if (config.color_icon_hover) return config.color_icon_hover
        else if (config.color_icon)  return config.color_icon
        else                         return textHover
    }
    property color iconBgHover:
    {
        if (config.color_icon_bg_hover) return config.color_icon_bg_hover
        else if (config.color_icon_bg)  return config.color_icon_bg
        else                            return Qt.rgba(main.r, main.g, main.b, 0.1)
    }
    property color iconShine: 
    {
        if (config.color_icon_shine) return config.color_icon_shine
        else                         return shine
    }
    // Icon border
    property color iconBorder: 
    {
        if (config.color_icon_border) return config.color_icon_border
        else                          return border
    }
    property color iconBorderInner:
    {
        if (config.color_icon_border_inner) return config.color_icon_border_inner
        else                                return borderInner
    }
    property color iconBorderHover:
    {
        if (config.color_icon_border_hover) return config.color_icon_border_hover
        else                                return borderHover
    }

    // Button text
    property color buttonText:
    {
        if (config.color_button_text) return config.color_button_text
        else                          return contrast
    }
    property color buttonTextHover:
    {
        if (config.color_button_text_hover)     return config.color_button_text_hover
        else                                    return buttonText
    }
    property color buttonTextHighlighted:
    {
        if (config.color_button_text_selected)  return config.color_button_text_selected
        else                                    return contrast
    } 
    property color buttonTextHoverHighlighted:
    {
        if (config.color_button_text_selected_hover) return config.color_button_text_selected_hover
        else                                         return buttonTextHighlighted
    }

    // Button background
    property color buttonBg:
    {
        if (config.color_button_bg) return config.color_button_bg
        else                        return Qt.rgba(dimmed.r, dimmed.g, dimmed.b, 0.9)
    }
    property color buttonBgHover:
    {
        if (config.color_button_bg_hover) return config.color_button_bg_hover
        else if (config.color_button_bg)  return config.color_button_bg
        else                              return dimmed
    }
    property color buttonBgHighlighted:
    {
        if (config.color_button_bg_selected) return config.color_button_bg_selected
        else                                 return Qt.rgba(main.r, main.g, main.b, 0.9)
    } 
    property color buttonBgHoverHighlighted:
    {
        if (config.color_button_bg_selected_hover) return config.color_button_bg_selected_hover
        else if (config.color_button_bg_selected)  return config.color_button_bg_selected
        else                                       return main
    }
    property color buttonShine: 
    {
        if (config.color_button_shine) return config.color_button_shine
        else                           return shine
    }
    
    // Button border
    property color buttonBorder: 
    {
        if (config.color_button_border) return config.color_button_border
        else                            return border
    }
    property color buttonBorderInner:
    {
        if (config.color_button_border_inner) return config.color_button_border_inner
        else                                  return borderInner
    }
    property color buttonBorderHover:
    {
        if (config.color_button_border_hover) return config.color_button_border_hover
        else                                  return borderHover
    }

    // Progress bar
    property color progressBar:
    {
        if (config.color_progress_bar) return config.color_progress_bar
        else                           return main
    }
    property color progressBarBg: 
    {
        if (config.color_progress_bar_bg) return config.color_progress_bar_bg
        else                              return dimmed
    }


    /* * * * * * * * * * * * * * * * * *
     *
     *  Layer 3 options
     *  Control types
     *
     * * * * * * * * * * * * * * * * * */

    // Error message
    property color errorText:
    {
        if (config.color_error_text) return config.color_error_text
        else                         return text
    }
    property color errorBg:
    {
        if (config.color_error_bg) return config.color_error_bg
        else                       return textBg
    } 

    // Input field
    property color inputText:
    {
        if (config.color_input_text) return config.color_input_text
        else                         return text
    }
    property color inputBg:
    {
        if (config.color_input_bg) return config.color_input_bg
        else                       return textBg
    }
    property color inputPlaceholderText:
    {
        if (config.color_placeholder_text) return config.color_placeholder_text
        else                               return textDimmed
    } 
    property color inputSelectionText:
    {
        if (config.color_selection_text) return config.color_selection_text
        else                             return inputBg
    }
    property color inputSelectionBg:
    {
        if (config.color_selection_bg) return config.color_selection_bg
        else                           return inputText
    }

    // Progress bar
    property color progressBarSlider:
    {
        if (config.color_progress_bar_slider) return config.color_progress_bar_slider
        else                                  return progressBar
    }

} 
