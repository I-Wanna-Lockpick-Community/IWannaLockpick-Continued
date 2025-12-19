attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 fCoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    fCoord = in_Position.xy;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 fCoord;
uniform float shaderMode;
uniform float time;
uniform vec2 offsetPos;
uniform vec2 size;
uniform vec2 UVPos;
uniform vec2 UVEnd;
const vec4 ICE_COLOR_FILL = vec4(1, 1, 1, 0.7058824);
const vec4 ICE_COLOR_BACK = vec4(0.8554, 0.91, 0.91, 0.39215687);
const vec4 MUD_COLOR_FILL = vec4(0.2823529412, 0.0509803922, 0.0509803922, 0.7058823529);
const vec4 MUD_COLOR_BACK = vec4(0.2823529412, 0.0509803922, 0.0509803922, 0.1960784314);
const vec4 GRAFFITI_COLOR_TOP = vec4(0.72156864, 0.21568628, 0, 1);
const vec4 GRAFFITI_COLOR_BOTTOM = vec4(0.72156864, 0.46666667, 0, 1);

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}
vec3 hsv(float H, float S, float V){
    //be sure to add up rgb
    float cn = H*0.025;
    //Col is the fully saturated color.
    vec3 col = vec3((float((H>=0.) && (H<40.))*1.)+(float((H>=200.) && (H<240.))*1.)+(float((H>=40.) && (H<80.))*(2.-cn))+(float((H>=160.) && (H<200.))*(cn-4.)),(float((H>=40.) && (H<120.))*1.)+(float((H>=120.) && (H<160.))*(4.-cn))+(float((H>=0.) && (H<40.))*cn),(float((H>=120.) && (H<200.))*1.)+(float((H>=200.) && (H<240.))*(6.-cn))+(float((H>=80.) && (H<120.))*(cn-2.)));
    vec3 gray = vec3(V,V,V);
    col *= V;
    return gray + (col-gray) * S;
}

vec4 lerpColor(vec4 color1, vec4 color2, float t) {
	return color1 * (1.0-t) + color2 * t;
}

bool iceStripe(float start, float width, vec2 positer) {
    float thispos = positer.x + positer.y;
    float end = start+width;
    return max(size.x,size.y) > end && thispos > start && thispos < end;
}

bool mudStripe(float _start, float width, vec2 position, vec2 minposition) {
	float x = mod(position.x, 16.0);
	float y = mod(position.y-4.0, 59.0)+4.0;
	float start = _start + floor(abs(6.0-abs(7.5-x))/2.0);
	if (minposition.x < 1.5) start++;
	float end = _start + width + abs(2.0-floor(abs(7.5-x)/2.0));
	return y > start && y < end;
}

void main() {
    vec2 position = floor(fCoord-offsetPos);
    vec2 unposition = size - position - vec2(1,1);
    vec2 minposition = vec2(min(position.x,unposition.x),min(position.y,unposition.y));
    if (shaderMode == 12.0) {
        // glitch
        vec4 oldCol = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
        float colHue = rand(vec2(fCoord.x+time,fCoord.y));
        float satRand = rand(vec2(fCoord.x,fCoord.y+time));
        gl_FragColor = vec4(hsv(240.*colHue,oldCol.r*satRand,oldCol.g),oldCol.a);
    } else if (shaderMode == 19.0) {
        // ice (frozen)
        if ((minposition.x < 0.5 || minposition.y < 0.5) // border
            || (minposition.x+minposition.y < 4.5) // corners
            || ((minposition.x < 1.5 || minposition.y < 1.5) && minposition.x < 4.5 && minposition.y < 4.5) // corners
            || iceStripe(14.5,10.0,position)
            || iceStripe(42.5,14.0,position)
            || iceStripe(10.5,3.0,unposition)
            || iceStripe(19.5,5.0,unposition)
            || iceStripe(41.5,5.0,unposition)) {
            gl_FragColor = ICE_COLOR_FILL;
        } else {
            gl_FragColor = ICE_COLOR_BACK;
        }
    } else if (shaderMode == 20.0) {
        // mud (crumbled)
		if ((minposition.x < 0.5 || minposition.y < 0.5) // border
			|| (minposition.x + 2.0*minposition.y < 6.5) // corners
			|| mudStripe(4.5,11.0,position,minposition)
			|| mudStripe(24.5,5.0,position,minposition)
			|| mudStripe(37.5,9.0,position,minposition)
			|| mudStripe(54.5,5.0,position,minposition)) {
            gl_FragColor = MUD_COLOR_FILL;
        } else {
            gl_FragColor = MUD_COLOR_BACK;
        }
    } else if (shaderMode == 21.0) {
        // graffiti (painted)
        gl_FragColor = lerpColor(GRAFFITI_COLOR_TOP, GRAFFITI_COLOR_BOTTOM, position.y/size.y);
        vec2 t = fract(position/vec2(128.0,128.0));
        gl_FragColor.a = texture2D(gm_BaseTexture, UVPos*t + UVEnd*(vec2(1.0,1.0)-t)).a;
    }
}
