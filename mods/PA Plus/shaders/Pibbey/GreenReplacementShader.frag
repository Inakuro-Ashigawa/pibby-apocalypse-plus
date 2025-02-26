#pragma header

const float threshold = 0.5;
const float padding = 0.05;

uniform vec3 replacementColour; 

void main()
{
    vec2 uv = openfl_TextureCoordv;
    
    // Define the green color that we want to replace
    vec4 greenScreen = vec4(0.0, 1.0, 0.0, 1.0); // Green screen color (full green)
    
    // Sample the current color of the pixel
    vec3 color = texture2D(bitmap, uv).rgb;
    float alpha = texture2D(bitmap, uv).a;
    
    // Compute the difference between the color and green
    vec3 diff = color.xyz - greenScreen.xyz;
    
    // Calculate a smooth factor for the replacement based on the threshold and padding
    float fac = smoothstep(threshold - padding, threshold + padding, dot(diff, diff));
    
    // Mix the original color with the replacement color based on the factor
    color = mix(color, replacementColour, 1.0 - fac);
    
    // Output the final color with alpha
    gl_FragColor = vec4(color.rgb * alpha, alpha);
}
