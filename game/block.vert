#version 330 core

in vec3 pos;     // Position of vertex.
in vec2 tex;     // Texture coordinate of vertex.
in vec3 normal;  // Normal vector of vertex.

uniform mat4 matrix;  // Transformation matrix for the object.
uniform vec3 camera;  // Position of camera.
uniform float fogdis; // Distance at which the fog effect should be fully applied.

out vec2 Tex;         // Texture coordinate to be passed to the fragment shader.
out float diff;       // Diffuse lighting intensity to be passed to the fragment shader.
out float fog_factor; // Fog intensity to be passed to the fragment shader.

const vec3 lightdir = normalize(vec3(-1, 1, -1)); // Direction of the light source.

void main() {
    // Calculate the position of the vertex in clip space.
    gl_Position = matrix * vec4(pos, 1.0);

    // Calculate the distance from the camera to the vertex, and use it to calculate the fog factor.
    float camera_distance = distance(pos, camera);
    fog_factor = pow(clamp(camera_distance/fogdis, 0, 1), 4);

    // Pass the texture coordinate to the fragment shader.
    Tex = tex;

    // Calculate the diffuse lighting intensity based on the normal vector and the direction of the light source.
    diff = max(0, dot(normal, lightdir));

}
