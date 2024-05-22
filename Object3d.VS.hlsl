struct TransformationMatrix {
	float4x4 wvp;
};

ConstantBuffer<TransformationMatrix> gTransformationMatrix : register(b0);

struct VertexShaderOutput {
	float4 position : SV_POSITION;
};

struct VertexShaderInput {
	float4 position : POSITION0;
};

VertexShaderOutput main(VertexShaderInput input) {
	VertexShaderOutput output;
	output.position = mul(input.position, gTransformationMatrix.wvp);
	return output;
}
