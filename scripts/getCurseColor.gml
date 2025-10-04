///getCurseColor(color);
// Returns the color to multiply the curse particle by

switch argument0 {
    case color_MASTER: return make_color_rgb(238, 232, 160);
    case color_PURE: return make_color_rgb(219, 246, 247);
    case color_GLITCH: return make_color_rgb(150, 150, 150);
    case color_STONE: return make_color_rgb(126, 136, 146);
    case color_SILVER: return make_color_rgb(204, 204, 204);
    case color_DYNAMITE: return make_color_rgb(185, 115, 40);
    // @addcolor if key image/animation
    default: return global.mainTone[argument0];
}
