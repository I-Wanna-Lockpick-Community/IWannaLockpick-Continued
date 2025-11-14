attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 pos;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    pos = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 pos;
uniform vec2 offsetPos;
uniform vec2 size;
const vec4 COLOR_FILL = vec4(1, 1, 1, 0.7058824);
const vec4 COLOR_BACK = vec4(0.8554, 0.91, 0.91, 0.39215687);

bool stripe(float start, float width, vec2 positer) {
    float thispos = positer.x + positer.y;
    float end = start+width;
    return max(size.x,size.y) > end && thispos > start && thispos < end;
}

void main()
{
    vec2 position = floor(pos-offsetPos);
    vec2 unposition = size - position - vec2(1,1);
    vec2 minposition = vec2(min(position.x,unposition.x),min(position.y,unposition.y));

    if ((minposition.x < 0.5 || minposition.y < 0.5) // border
        || (minposition.x+minposition.y < 4.5) // corners
        || ((minposition.x < 1.5 || minposition.y < 1.5) && minposition.x < 4.5 && minposition.y < 4.5) // corners
        || stripe(14.5,10.0,position)
        || stripe(42.5,14.0,position)
        || stripe(10.5,3.0,unposition)
        || stripe(19.5,5.0,unposition)
        || stripe(41.5,5.0,unposition)) {
        gl_FragColor = COLOR_FILL;
    } else {
        gl_FragColor = COLOR_BACK;
    }
}
