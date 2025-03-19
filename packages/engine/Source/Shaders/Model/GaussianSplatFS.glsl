void gaussianSplatStage(inout vec4 color, in ProcessedAttributes attributes) {
    mediump float A = dot(v_vertPos, v_vertPos);
    if(A > 1.0)
        discard;
    mediump float scale = 4.0;
    mediump float B = exp(-A * scale) * (v_splatColor.a);
    
    vec3 splatColor = v_splatColor.rgb;

    #ifdef HAS_MODEL_COLOR
    splatColor = mix(splatColor, model_color.rgb, model_colorBlend);
    float highlight = ceil(model_colorBlend);
    splatColor *= mix(model_color.rgb, vec3(1.0), highlight);
    #endif

    color = vec4(splatColor * B, B);
}

