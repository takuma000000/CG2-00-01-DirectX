#include "Object3d.hlsli"

Texture2D<float4> gTexture : register(t0);
SamplerState gSampler : register(s0);

struct Material {
    float4 color;
    int32_t enableLighting;
};

ConstantBuffer<Material> gMaterial : register(b0);

struct PixelShaderOutput {
    float4 color : SV_TARGET0;
};

struct DirectionalLight {
    float4 color;
    float3 direction;
    float intensity;
};



PixelShaderOutput main(VertexShaderOutput input) {
    PixelShaderOutput output;

    // テクスチャサンプルを行う
    float4 textureColor = gTexture.Sample(gSampler, input.texcoord);

    // ピクセルの色を計算する
    output.color = gMaterial.color * textureColor;

    return output;
}