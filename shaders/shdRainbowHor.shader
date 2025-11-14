attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float fCoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    fCoord = in_Position.x;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float fCoord;


vec3 hsv(float H, float S, float V){
    //be sure to add up rgb
    float cn = H*0.025;
    //Col is the fully saturated color.
    vec3 col = vec3((float((H>=0.) && (H<40.))*1.)+(float((H>=200.) && (H<240.))*1.)+(float((H>=40.) && (H<80.))*(2.-cn))+(float((H>=160.) && (H<200.))*(cn-4.)),(float((H>=40.) && (H<120.))*1.)+(float((H>=120.) && (H<160.))*(4.-cn))+(float((H>=0.) && (H<40.))*cn),(float((H>=120.) && (H<200.))*1.)+(float((H>=200.) && (H<240.))*(6.-cn))+(float((H>=80.) && (H<120.))*(cn-2.)));
    vec3 gray = vec3(V,V,V);
    col *= V;
    return gray + (col-gray) * S;
}
void main()
{
    vec4 oldCol = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(hsv(mod(fCoord*0.3,240.),.6,1.),oldCol.a);
}
