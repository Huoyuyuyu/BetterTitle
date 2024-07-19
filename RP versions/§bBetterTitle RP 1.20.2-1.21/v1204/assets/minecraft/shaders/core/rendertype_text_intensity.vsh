#version 150

#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;
uniform int FogShape;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

vec2 guiPixel = vec2(ProjMat[0][0], -ProjMat[1][1]);
float o_unit = 8000 * guiPixel.x;
float y_unit = 80000 * guiPixel.x;

vec2 titlePos = vec2(1, 63.2*guiPixel.y);

vec2 Origin[10] = vec2[10](
    titlePos,
    vec2(1, 2),
    vec2(1, 0),
    vec2(0, 1),
    vec2(2, 1),
    vec2(0, 2),
    vec2(2, 2),
    vec2(0, 0),
    vec2(2, 0),
    vec2(1, 1)
);

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;

    if(gl_Position.z < 0.001){
        vec2 p = gl_Position.xy + vec2(5);

        float i = mod(floor(p.x / o_unit), 10);

        p.y += floor(p.x / y_unit) * guiPixel.y;
        p.x = mod(p.x, o_unit);

        p += Origin[int(i)] - titlePos;

        gl_Position.xy = p - vec2(5);
    }
}
