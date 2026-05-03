#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(binding = 1) uniform sampler2D source;

void main() {
    vec4 originalColor = texture(source, qt_TexCoord0);
    vec3 premultipliedRgb = originalColor.rgb * originalColor.a;

    if (mod(gl_FragCoord.x, 8.0) < 2.0) {
        fragColor = vec4(vec3(0.0), 0.0); // fully transparent black
    } else {
        fragColor = vec4(premultipliedRgb, originalColor.a);
    }
}