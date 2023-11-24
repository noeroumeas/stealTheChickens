shader_type spatial;

uniform float ring_scale : hint_range(0.1, 10) = 4.4;
uniform float wave_scale : hint_range(0.1, 10) = 8.454;
uniform float random_scale : hint_range(0.1, 10) = 4.6;
uniform float noise_scale : hint_range(0.01, 1) = 0.03;

float random(vec2 pos)
{
    return fract(sin(dot(pos, vec2(12.9898, 78.233))) * 43758.5453);
}

float value_noise(vec2 pos)
{
    vec2 p = floor(pos);
    vec2 f = fract(pos);

    float v00 = random(p + vec2(0.0, 0.0));
    float v10 = random(p + vec2(1.0, 0.0));
    float v01 = random(p + vec2(0.0, 1.0));
    float v11 = random(p + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(mix(v00, v10, u.x), mix(v01, v11, u.x), u.y);
}

void vertex() {
    // No changes to the vertex function for this shader.
}

void fragment() {
    vec2 tiled_uv = UV * vec2(5.0, 5.0); // Adjust the vector to control tiling size (5.0 in this example)
    vec2 shift_uv = tiled_uv;
    shift_uv.x += value_noise(tiled_uv * random_scale);
    float x = shift_uv.x + sin(shift_uv.y * wave_scale);
    float f = mod(x * ring_scale + random(tiled_uv) * noise_scale, 1.0);

    // Add some color variation
    vec3 base_color = vec3(0.545, 0.271, 0.075);
    vec3 wood_color = base_color + vec3(0.05, 0.05, 0.05) * sin(f * 10.0);

    // Control the shader response to light using LIGHT_COLOR
    vec3 light_direction = normalize(vec3(0.0, 1.0, -1.0));
    float light_intensity = max(1, dot(vec3(0.0, 0.0, 1.0), light_direction));

    // Adjust the influence of the light
    wood_color *= light_intensity;

    ALBEDO = wood_color;
    ALPHA = 1.0;
}
