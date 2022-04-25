#pragma header

uniform float strength = 0.1;
int passes = 40;

void main() {
    if (strength != 0.0) {
        // recycled from note blur lol
        float r = 0;
        float g = 0;
        float b = 0;
        float a = 0;
        float t = 0;

        for (int i = -passes; i < passes; ++i) {
            vec4 color = flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x + (i * strength / passes), openfl_TextureCoordv.y));
            r += color.r;
            g += color.g;
            b += color.b;
            a += color.a;
            ++t;
        }

        gl_FragColor = vec4(r / t, g / t, b / t, a / t);
    } else {
        gl_FragColor = flixel_texture2D(bitmap, openfl_TextureCoordv);
    }
}