#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

vec2 guiPixel = vec2(ProjMat[0][0], -ProjMat[1][1]);
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

bool range(float num, float MIN, float MAX){
    return num >= MIN && num <= MAX;
}

void main() {

    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    
    if(ProjMat[2][3] == 0.0 && 2/guiPixel.x < 1400){
        
        vec2 p = Position.xy + vec2(750);

        float i = mod(floor(p.x / 1500), 10);

        p.y -= 0.5*floor(p.x / 15000);
        p.x = mod(p.x, 1500);

        p -= vec2(750);

        gl_Position = ProjMat * ModelViewMat * vec4(vec3(p, Position.z), 1.0);

        gl_Position.xy += Origin[int(i)] - titlePos;
    }
}

