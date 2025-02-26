#pragma header

uniform float binaryIntensity; // Intensity for the glitch and distortion effects
uniform float negativity;      // Negativity toggle (inverts colors)
uniform float glitchShift;     // Random shift intensity for glitching
uniform float distortionScale; // Intensity of the distortion effect

void main() {
    vec2 uv = openfl_TextureCoordv.xy;
    vec2 fragCoord = openfl_TextureCoordv * openfl_TextureSize;
    vec2 iResolution = openfl_TextureSize;

    // --- Base UV Coordinates ---
    vec2 distortedUV = uv;
    vec2 glitchUV = uv;

    // --- Distortion Effect ---
    float psize = 0.04 * binaryIntensity;
    float psq = 1.0 / psize;

    float px = floor(uv.x * psq + 0.5) * psize;
    float py = floor(uv.y * psq + 0.5) * psize;

    vec4 colSnap = texture2D(bitmap, vec2(px, py));

    float lum = pow(1.0 - (colSnap.r + colSnap.g + colSnap.b) / 3.0, binaryIntensity);

    float qsize = psize * lum * distortionScale;
    float qsq = 1.0 / qsize;

    float qx = floor(uv.x * qsq + 0.5) * qsize;
    float qy = floor(uv.y * qsq + 0.5) * qsize;

    float rx = (px - qx) * lum + uv.x;
    float ry = (py - qy) * lum + uv.y;

    distortedUV = vec2(rx, ry);

    // --- Glitch Effect ---
    float shiftX = (fract(sin(dot(uv * 100.0, vec2(12.9898, 78.233))) * 43758.5453) - 0.5) * glitchShift;
    float shiftY = (fract(sin(dot(uv * 200.0, vec2(39.3468, 11.1357))) * 54839.2763) - 0.5) * glitchShift;

    glitchUV.x += shiftX * binaryIntensity;
    glitchUV.y += shiftY * binaryIntensity;

    // --- Blend Distortion and Glitch ---
    vec4 distortColor = texture2D(bitmap, distortedUV);
    vec4 glitchColor = texture2D(bitmap, glitchUV);

    // Mix the two effects, emphasizing the chaotic nature
    vec4 mixedColor = mix(distortColor, glitchColor, sin(binaryIntensity * 3.14));

    // --- Add Color Offsets for Chaos ---
    mixedColor.rg *= vec2(sin(uv.x * 20.0), cos(uv.y * 20.0)) * 0.5 + 0.5;
    mixedColor.b *= sin((uv.x + uv.y) * 40.0) * 0.5 + 0.5;

    // --- Negativity Toggle ---
    mixedColor = mix(
        mixedColor,
        vec4(1.0 - mixedColor.rgb, mixedColor.a),
        negativity
    );

    gl_FragColor = mixedColor;
}