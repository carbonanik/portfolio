#version 460 core

#include <flutter/runtime_effect.glsl>

#define pixelation 2

uniform vec2 uResolution;
uniform float uTime;
uniform sampler2D uTex;

out vec4 oColor;

float character(float n, vec2 p)
{
    p = floor(p * vec2(8.0, -8.0) + (vec2(-4.0, 4.0) + vec2(1.0)));
    if (clamp(p.x, 0.0, 4.0) == p.x && clamp(p.y, 0.0, 4.0) == p.y)
    {
        float x = (5.0 * p.y + p.x);
        float signbit = (n < 0.0) ? 1.0 : 0.0;
        signbit = (x == 0.0) ? signbit : 0.0;
        return (fract(abs(n*exp2(-x-1.0))) >= 0.5) ? 1.0 : signbit;
    }

    return 0.0;

}

void main()
{
    vec2 fragCoord = vec2(FlutterFragCoord().xy);
    fragCoord /= float(pixelation);
    vec2 uv = fragCoord.xy;
    vec2 cursor_position = (floor(uv/8.0)*8.0+(0.5/float(pixelation)))/(uResolution.xy / float(pixelation));
    vec3 col = texture(uTex, cursor_position).rgb;

    //Greenscreen
    #define graytype 4

    #if graytype == 1
    float luma = (col.r + col.b) * 0.5;
    #elif graytype == 2
    float luma = (col.r + col.g + col.b)/3.0;
    #elif graytype == 3
    float luma = dot(col, vec3(0.2126, 0.7152, 0.0722));
    #else
    vec3 colortarget = vec3(0., 255., 0.)/255.0;
    vec3 diff = col - colortarget;
    vec3 square_diff = diff * diff;
    vec3 distance_coefs = vec3((0.5 * diff.r + 2.0), 4.0, (-0.5 * diff.r + 3.0));

    float colordistance = 0.28 * sqrt(dot(square_diff, distance_coefs));

    col = (colordistance > 0.35) ? col : vec3(0.0);
    float luma = dot(col, vec3(0.2126, 0.7152, 0.0722));

    #endif


    float gray = smoothstep(0.0, 1.0, luma);//increase contrast

    float n = float[](0., 4194304., 131200., 324., 330., 283712., 12650880., 4532768.,
    13191552., 10648704., 11195936., 15218734., 15255086., 15252014., 15324974., 11512810.
    )[int(gray * 16.)];


    vec2 p = fract(uv * 0.125);

    col = pow(col, vec3(0.55));
    col = col*character(n, p);

    col = mix(vec3(character(n, p)), col, 1.0);

    oColor = vec4(col, 1.0);
}