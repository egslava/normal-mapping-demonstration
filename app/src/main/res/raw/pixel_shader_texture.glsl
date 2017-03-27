precision mediump float;
uniform vec4 vColor;

uniform vec2 vLightPosition;

varying vec3 uPosition;
varying vec2 v_TexCoordinate;

//const vec3 LIGHT_POS = vec3(0.5, 0.5, -0.025);

uniform sampler2D u_Normal;
uniform sampler2D u_Texture;


void main() {

  vec3 NORMAL = vec3(0.0, 0.0, 1.0);

  vec3 LIGHT_POS = vec3(vLightPosition, 0.75225);

  vec3 vectorToLight = LIGHT_POS - uPosition;

//  vec3 texNormal = ((texture2D(u_Normal, v_TexCoordinate).rgb - 0.5)* 2.0)* vec3(1.0, -1.0, 1.0);
  vec3 texColor = texture2D(u_Texture, v_TexCoordinate).rgb;

  float b = dot( normalize(vectorToLight), NORMAL);
  gl_FragColor = vec4( texColor * b , 1.0);//uPosition;
}
