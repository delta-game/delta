#version 330 core

in vec2 Tex;             // Texture coordinate.
in float diff;           // Diffuse lighting factor.
in float fog_factor;     // Fog blending factor.

// Texture sampler.
uniform sampler2D tex;

// Output color.
out vec4 FragColor;

// Sky color used for fog.
const vec3 sky_color = vec3(0.57, 0.71, 0.77);

void main() {
    // Sample texture color.
    vec3 color = vec3(texture(tex, vec2(Tex.x, 1-Tex.y)));

    // If the color is magenta, discard the fragment.
    // This is the color we've picked have in our 
    // texture file atm. Might change as we up the
    // resolution and rejigger a few more things.
    if (color == vec3(1,0,1)) {
        discard;
    }

    // Adjust diffuse lighting based on block type.(?)
    float df = diff;
    if (color == vec3(1,1,1)) {
        df = 1- diff * 0.2;
    }

    // Calculate ambient and diffuse lighting colors.
    vec3 ambient = 0.5 * vec3(1, 1, 1);
    vec3 diffcolor = df * 0.5 * vec3(1,1,1);

    // Combine texture color and lighting colors.
    color = (ambient + diffcolor) * color;

    // Blend with sky color based on fog factor.
    color = mix(color, sky_color, fog_factor);

    // Set output color.
    FragColor = vec4(color, 1);
}
