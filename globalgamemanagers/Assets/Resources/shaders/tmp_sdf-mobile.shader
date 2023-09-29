Shader "TextMeshPro/Mobile/Distance Field" {
	Properties {
		_FaceColor ("Face Color", Vector) = (1,1,1,1)
		_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
		_OutlineColor ("Outline Color", Vector) = (0,0,0,1)
		_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
		_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
		_UnderlayColor ("Border Color", Vector) = (0,0,0,0.5)
		_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
		_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
		_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
		_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
		_WeightNormal ("Weight Normal", Float) = 0
		_WeightBold ("Weight Bold", Float) = 0.5
		_ShaderFlags ("Flags", Float) = 0
		_ScaleRatioA ("Scale RatioA", Float) = 1
		_ScaleRatioB ("Scale RatioB", Float) = 1
		_ScaleRatioC ("Scale RatioC", Float) = 1
		_MainTex ("Font Atlas", 2D) = "white" {}
		_TextureWidth ("Texture Width", Float) = 512
		_TextureHeight ("Texture Height", Float) = 512
		_GradientScale ("Gradient Scale", Float) = 5
		_ScaleX ("Scale X", Float) = 1
		_ScaleY ("Scale Y", Float) = 1
		_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
		_Sharpness ("Sharpness", Range(-1, 1)) = 0
		_VertexOffsetX ("Vertex OffsetX", Float) = 0
		_VertexOffsetY ("Vertex OffsetY", Float) = 0
		_ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
		_MaskSoftnessX ("Mask SoftnessX", Float) = 0
		_MaskSoftnessY ("Mask SoftnessY", Float) = 0
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_ColorMask ("Color Mask", Float) = 15
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
			ColorMask 0 -1
			ZWrite Off
			Cull Off
			Stencil {
				ReadMask 0
				WriteMask 0
				Comp Disabled
				Pass Keep
				Fail Keep
				ZFail Keep
			}
			Fog {
				Mode Off
			}
			GpuProgramID 31078
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat6.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = u_xlat15 * u_xlat1.x;
					    u_xlat11 = (-_PerspectiveFilter) + 1.0;
					    u_xlat11 = u_xlat11 * abs(u_xlat6.x);
					    u_xlat15 = u_xlat15 * u_xlat1.x + (-u_xlat11);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat11;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat6.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					bool u_xlatb6;
					vec2 u_xlat7;
					float u_xlat9;
					vec2 u_xlat12;
					float u_xlat15;
					vec2 u_xlat17;
					float u_xlat19;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb6 = 0.0>=in_TEXCOORD1.y;
					    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat12.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat12.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat12.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat7.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat7.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat7.xy;
					    u_xlat7.xy = abs(u_xlat7.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat7.xy = u_xlat2.ww / u_xlat7.xy;
					    u_xlat19 = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat9 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					    u_xlat9 = u_xlat19 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat9);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat12.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat12.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat15 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat5.xyz = vec3(u_xlat15) * u_xlat5.xyz;
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat19 = u_xlat19 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat9 = abs(u_xlat15) * u_xlat19 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat6.x = u_xlat6.x * u_xlat1.x + _WeightNormal;
					    u_xlat6.x = u_xlat6.x * 0.25 + _FaceDilate;
					    u_xlat6.x = u_xlat6.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat9 / u_xlat1.x;
					    u_xlat6.x = (-u_xlat6.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat6.x * u_xlat1.x + -0.5;
					    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat6.x = u_xlat6.x * 0.5;
					    u_xlat3.x = u_xlat1.x * u_xlat6.x;
					    u_xlat4 = in_COLOR0 * _FaceColor;
					    u_xlat4.xyz = u_xlat4.www * u_xlat4.xyz;
					    u_xlat5.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat5.xyz = u_xlat5.www * _OutlineColor.xyz;
					    u_xlat3.x = u_xlat3.x + u_xlat3.x;
					    u_xlat3.x = min(u_xlat3.x, 1.0);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat5 = (-u_xlat4) + u_xlat5;
					    vs_COLOR1 = u_xlat3.xxxx * u_xlat5 + u_xlat4;
					    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat5.xy = u_xlat12.xy + (-u_xlat3.xy);
					    u_xlat17.xy = (-u_xlat3.xy) + u_xlat3.zw;
					    vs_TEXCOORD0.zw = u_xlat5.xy / u_xlat17.xy;
					    vs_TEXCOORD1.y = (-u_xlat6.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat6.x * u_xlat1.x + u_xlat1.w;
					    u_xlat6.xy = u_xlat12.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
					    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat6.xy;
					    u_xlat6.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat7.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat6.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = u_xlat4;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat6.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = u_xlat15 * u_xlat1.x;
					    u_xlat11 = (-_PerspectiveFilter) + 1.0;
					    u_xlat11 = u_xlat11 * abs(u_xlat6.x);
					    u_xlat15 = u_xlat15 * u_xlat1.x + (-u_xlat11);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat11;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat6.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					bool u_xlatb6;
					vec2 u_xlat7;
					float u_xlat9;
					vec2 u_xlat12;
					float u_xlat15;
					vec2 u_xlat17;
					float u_xlat19;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb6 = 0.0>=in_TEXCOORD1.y;
					    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat12.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat12.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat12.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat7.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat7.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat7.xy;
					    u_xlat7.xy = abs(u_xlat7.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat7.xy = u_xlat2.ww / u_xlat7.xy;
					    u_xlat19 = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat9 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					    u_xlat9 = u_xlat19 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat9);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat12.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat12.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat15 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat5.xyz = vec3(u_xlat15) * u_xlat5.xyz;
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat19 = u_xlat19 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat9 = abs(u_xlat15) * u_xlat19 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat6.x = u_xlat6.x * u_xlat1.x + _WeightNormal;
					    u_xlat6.x = u_xlat6.x * 0.25 + _FaceDilate;
					    u_xlat6.x = u_xlat6.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat9 / u_xlat1.x;
					    u_xlat6.x = (-u_xlat6.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat6.x * u_xlat1.x + -0.5;
					    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat6.x = u_xlat6.x * 0.5;
					    u_xlat3.x = u_xlat1.x * u_xlat6.x;
					    u_xlat4 = in_COLOR0 * _FaceColor;
					    u_xlat4.xyz = u_xlat4.www * u_xlat4.xyz;
					    u_xlat5.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat5.xyz = u_xlat5.www * _OutlineColor.xyz;
					    u_xlat3.x = u_xlat3.x + u_xlat3.x;
					    u_xlat3.x = min(u_xlat3.x, 1.0);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat5 = (-u_xlat4) + u_xlat5;
					    vs_COLOR1 = u_xlat3.xxxx * u_xlat5 + u_xlat4;
					    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat5.xy = u_xlat12.xy + (-u_xlat3.xy);
					    u_xlat17.xy = (-u_xlat3.xy) + u_xlat3.zw;
					    vs_TEXCOORD0.zw = u_xlat5.xy / u_xlat17.xy;
					    vs_TEXCOORD1.y = (-u_xlat6.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat6.x * u_xlat1.x + u_xlat1.w;
					    u_xlat6.xy = u_xlat12.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
					    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat6.xy;
					    u_xlat6.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat7.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat6.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = u_xlat4;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNDERLAY_ON" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[12];
						float _UnderlayOffsetX;
						float _UnderlayOffsetY;
						float _UnderlayDilate;
						float _UnderlaySoftness;
						vec4 unused_0_11[2];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _ScaleRatioC;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_18[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _TextureWidth;
						float _TextureHeight;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec2 u_xlat8;
					float u_xlat14;
					float u_xlat15;
					float u_xlat21;
					bool u_xlatb21;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0.w = _FaceColor.w;
					    u_xlat3.xyz = in_COLOR0.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat4 = u_xlat3 * _FaceColor;
					    u_xlat2.xyz = u_xlat4.www * u_xlat4.xyz;
					    vs_COLOR0.xyz = u_xlat2.xyz;
					    u_xlat5.xyz = (-u_xlat2.xyz);
					    u_xlat5.w = (-u_xlat4.w);
					    u_xlat6.xyz = _OutlineColor.www * _OutlineColor.xyz;
					    u_xlat6.w = _OutlineColor.w;
					    u_xlat5 = u_xlat5 + u_xlat6;
					    u_xlat14 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat1.xyz = vec3(u_xlat14) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat2.xyz = vec3(u_xlat14) * u_xlat2.xyz;
					    u_xlat14 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat8.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat8.x * u_xlat1.x;
					    u_xlat8.x = u_xlat21 * u_xlat1.x;
					    u_xlat15 = (-_PerspectiveFilter) + 1.0;
					    u_xlat15 = u_xlat15 * abs(u_xlat8.x);
					    u_xlat21 = u_xlat21 * u_xlat1.x + (-u_xlat15);
					    u_xlat14 = abs(u_xlat14) * u_xlat21 + u_xlat15;
					    u_xlatb21 = glstate_matrix_projection[3].w==0.0;
					    u_xlat14 = (u_xlatb21) ? u_xlat14 : u_xlat8.x;
					    u_xlat21 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat21 = u_xlat21 * u_xlat14 + 1.0;
					    u_xlat1.x = u_xlat14 / u_xlat21;
					    u_xlat21 = _OutlineWidth * _ScaleRatioA;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat8.x = u_xlat1.x * u_xlat21;
					    u_xlat8.x = u_xlat8.x + u_xlat8.x;
					    u_xlat8.x = min(u_xlat8.x, 1.0);
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat2 = u_xlat5 * u_xlat8.xxxx;
					    vs_COLOR1.xyz = u_xlat4.xyz * u_xlat4.www + u_xlat2.xyz;
					    vs_COLOR1.w = u_xlat3.w * _FaceColor.w + u_xlat2.w;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat8.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat8.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat7.x = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat7.x + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat21) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat21 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_TEXCOORD3.z = in_COLOR0.w;
					    vs_TEXCOORD3.w = 0.0;
					    u_xlat1 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
					    u_xlat7.xz = (-u_xlat1.zw) * vec2(_GradientScale);
					    u_xlat7.xz = u_xlat7.xz / vec2(_TextureWidth, _TextureHeight);
					    vs_TEXCOORD3.xy = u_xlat7.xz + in_TEXCOORD0.xy;
					    u_xlat7.x = u_xlat1.x * u_xlat14 + 1.0;
					    u_xlat7.x = u_xlat14 / u_xlat7.x;
					    u_xlat14 = u_xlat1.y * 0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat7.x + -0.5;
					    vs_TEXCOORD4.y = (-u_xlat14) * u_xlat7.x + u_xlat0.x;
					    vs_TEXCOORD4.x = u_xlat7.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNDERLAY_ON" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[12];
						float _UnderlayOffsetX;
						float _UnderlayOffsetY;
						float _UnderlayDilate;
						float _UnderlaySoftness;
						vec4 unused_0_11[2];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _ScaleRatioC;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_18[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _TextureWidth;
						float _TextureHeight;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat11;
					vec2 u_xlat16;
					vec2 u_xlat19;
					vec2 u_xlat22;
					float u_xlat25;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat16.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat16.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat16.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat9.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat9.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat9.xy;
					    u_xlat9.xy = abs(u_xlat9.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat9.xy = u_xlat2.ww / u_xlat9.xy;
					    u_xlat25 = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlat25 = inversesqrt(u_xlat25);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat11 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat11 * u_xlat3.x;
					    u_xlat11 = u_xlat25 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat11);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat19.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat19.x = inversesqrt(u_xlat19.x);
					        u_xlat4.xyz = u_xlat19.xxx * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat16.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat16.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat19.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat19.x = inversesqrt(u_xlat19.x);
					        u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
					        u_xlat19.x = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat25 = u_xlat25 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat11 = abs(u_xlat19.x) * u_xlat25 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat1.x + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat11 + 1.0;
					    u_xlat1.x = u_xlat11 / u_xlat1.x;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat8.x * u_xlat1.x + -0.5;
					    u_xlat3.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat3.x = u_xlat3.x * 0.5;
					    u_xlat19.x = u_xlat1.x * u_xlat3.x;
					    u_xlat4.xyz = in_COLOR0.xyz;
					    u_xlat4.w = 1.0;
					    u_xlat5 = u_xlat4 * _FaceColor;
					    u_xlat4.xyz = u_xlat5.www * u_xlat5.xyz;
					    u_xlat6.xyz = _OutlineColor.www * _OutlineColor.xyz;
					    u_xlat19.x = u_xlat19.x + u_xlat19.x;
					    u_xlat19.x = min(u_xlat19.x, 1.0);
					    u_xlat19.x = sqrt(u_xlat19.x);
					    u_xlat7.xyz = (-u_xlat4.xyz);
					    u_xlat7.w = (-u_xlat5.w);
					    u_xlat6.w = _OutlineColor.w;
					    u_xlat6 = u_xlat6 + u_xlat7;
					    u_xlat6 = u_xlat19.xxxx * u_xlat6;
					    vs_COLOR1.xyz = u_xlat5.xyz * u_xlat5.www + u_xlat6.xyz;
					    vs_COLOR1.w = u_xlat4.w * _FaceColor.w + u_xlat6.w;
					    u_xlat5 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
					    u_xlat19.x = u_xlat5.x * u_xlat11 + 1.0;
					    u_xlat11 = u_xlat11 / u_xlat19.x;
					    u_xlat8.x = u_xlat8.x * u_xlat11 + -0.5;
					    u_xlat19.x = u_xlat5.y * 0.5;
					    vs_TEXCOORD4.y = (-u_xlat19.x) * u_xlat11 + u_xlat8.x;
					    u_xlat19.xy = (-u_xlat5.zw) * vec2(_GradientScale);
					    u_xlat19.xy = u_xlat19.xy / vec2(_TextureWidth, _TextureHeight);
					    u_xlat5 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat5 = min(u_xlat5, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat16.xy + (-u_xlat5.xy);
					    u_xlat22.xy = (-u_xlat5.xy) + u_xlat5.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat22.xy;
					    vs_TEXCOORD1.y = (-u_xlat3.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat3.x * u_xlat1.x + u_xlat1.w;
					    u_xlat8.xy = u_xlat16.xy * vec2(2.0, 2.0) + (-u_xlat5.xy);
					    vs_TEXCOORD2.xy = (-u_xlat5.zw) + u_xlat8.xy;
					    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat9.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
					    vs_TEXCOORD3.xy = u_xlat19.xy + in_TEXCOORD0.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0.w = _FaceColor.w;
					    vs_COLOR0.xyz = u_xlat4.xyz;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_TEXCOORD3.z = in_COLOR0.w;
					    vs_TEXCOORD3.w = 0.0;
					    vs_TEXCOORD4.x = u_xlat11;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_ALPHACLIP" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat6.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = u_xlat15 * u_xlat1.x;
					    u_xlat11 = (-_PerspectiveFilter) + 1.0;
					    u_xlat11 = u_xlat11 * abs(u_xlat6.x);
					    u_xlat15 = u_xlat15 * u_xlat1.x + (-u_xlat11);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat11;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat6.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "UNITY_UI_ALPHACLIP" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					bool u_xlatb6;
					vec2 u_xlat7;
					float u_xlat9;
					vec2 u_xlat12;
					float u_xlat15;
					vec2 u_xlat17;
					float u_xlat19;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb6 = 0.0>=in_TEXCOORD1.y;
					    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat12.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat12.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat12.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat7.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat7.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat7.xy;
					    u_xlat7.xy = abs(u_xlat7.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat7.xy = u_xlat2.ww / u_xlat7.xy;
					    u_xlat19 = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat9 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					    u_xlat9 = u_xlat19 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat9);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat12.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat12.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat15 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat5.xyz = vec3(u_xlat15) * u_xlat5.xyz;
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat19 = u_xlat19 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat9 = abs(u_xlat15) * u_xlat19 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat6.x = u_xlat6.x * u_xlat1.x + _WeightNormal;
					    u_xlat6.x = u_xlat6.x * 0.25 + _FaceDilate;
					    u_xlat6.x = u_xlat6.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat9 / u_xlat1.x;
					    u_xlat6.x = (-u_xlat6.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat6.x * u_xlat1.x + -0.5;
					    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat6.x = u_xlat6.x * 0.5;
					    u_xlat3.x = u_xlat1.x * u_xlat6.x;
					    u_xlat4 = in_COLOR0 * _FaceColor;
					    u_xlat4.xyz = u_xlat4.www * u_xlat4.xyz;
					    u_xlat5.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat5.xyz = u_xlat5.www * _OutlineColor.xyz;
					    u_xlat3.x = u_xlat3.x + u_xlat3.x;
					    u_xlat3.x = min(u_xlat3.x, 1.0);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat5 = (-u_xlat4) + u_xlat5;
					    vs_COLOR1 = u_xlat3.xxxx * u_xlat5 + u_xlat4;
					    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat5.xy = u_xlat12.xy + (-u_xlat3.xy);
					    u_xlat17.xy = (-u_xlat3.xy) + u_xlat3.zw;
					    vs_TEXCOORD0.zw = u_xlat5.xy / u_xlat17.xy;
					    vs_TEXCOORD1.y = (-u_xlat6.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat6.x * u_xlat1.x + u_xlat1.w;
					    u_xlat6.xy = u_xlat12.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
					    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat6.xy;
					    u_xlat6.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat7.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat6.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = u_xlat4;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNITY_UI_ALPHACLIP" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat6.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = u_xlat15 * u_xlat1.x;
					    u_xlat11 = (-_PerspectiveFilter) + 1.0;
					    u_xlat11 = u_xlat11 * abs(u_xlat6.x);
					    u_xlat15 = u_xlat15 * u_xlat1.x + (-u_xlat11);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat11;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat6.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNITY_UI_ALPHACLIP" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					bool u_xlatb6;
					vec2 u_xlat7;
					float u_xlat9;
					vec2 u_xlat12;
					float u_xlat15;
					vec2 u_xlat17;
					float u_xlat19;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb6 = 0.0>=in_TEXCOORD1.y;
					    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat12.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat12.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat12.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat7.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat7.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat7.xy;
					    u_xlat7.xy = abs(u_xlat7.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat7.xy = u_xlat2.ww / u_xlat7.xy;
					    u_xlat19 = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat9 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					    u_xlat9 = u_xlat19 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat9);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat12.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat12.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat15 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat5.xyz = vec3(u_xlat15) * u_xlat5.xyz;
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat19 = u_xlat19 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat9 = abs(u_xlat15) * u_xlat19 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat6.x = u_xlat6.x * u_xlat1.x + _WeightNormal;
					    u_xlat6.x = u_xlat6.x * 0.25 + _FaceDilate;
					    u_xlat6.x = u_xlat6.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat9 / u_xlat1.x;
					    u_xlat6.x = (-u_xlat6.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat6.x * u_xlat1.x + -0.5;
					    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat6.x = u_xlat6.x * 0.5;
					    u_xlat3.x = u_xlat1.x * u_xlat6.x;
					    u_xlat4 = in_COLOR0 * _FaceColor;
					    u_xlat4.xyz = u_xlat4.www * u_xlat4.xyz;
					    u_xlat5.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat5.xyz = u_xlat5.www * _OutlineColor.xyz;
					    u_xlat3.x = u_xlat3.x + u_xlat3.x;
					    u_xlat3.x = min(u_xlat3.x, 1.0);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat5 = (-u_xlat4) + u_xlat5;
					    vs_COLOR1 = u_xlat3.xxxx * u_xlat5 + u_xlat4;
					    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat5.xy = u_xlat12.xy + (-u_xlat3.xy);
					    u_xlat17.xy = (-u_xlat3.xy) + u_xlat3.zw;
					    vs_TEXCOORD0.zw = u_xlat5.xy / u_xlat17.xy;
					    vs_TEXCOORD1.y = (-u_xlat6.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat6.x * u_xlat1.x + u_xlat1.w;
					    u_xlat6.xy = u_xlat12.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
					    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat6.xy;
					    u_xlat6.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat7.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat6.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = u_xlat4;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[12];
						float _UnderlayOffsetX;
						float _UnderlayOffsetY;
						float _UnderlayDilate;
						float _UnderlaySoftness;
						vec4 unused_0_11[2];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _ScaleRatioC;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_18[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _TextureWidth;
						float _TextureHeight;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec2 u_xlat8;
					float u_xlat14;
					float u_xlat15;
					float u_xlat21;
					bool u_xlatb21;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0.w = _FaceColor.w;
					    u_xlat3.xyz = in_COLOR0.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat4 = u_xlat3 * _FaceColor;
					    u_xlat2.xyz = u_xlat4.www * u_xlat4.xyz;
					    vs_COLOR0.xyz = u_xlat2.xyz;
					    u_xlat5.xyz = (-u_xlat2.xyz);
					    u_xlat5.w = (-u_xlat4.w);
					    u_xlat6.xyz = _OutlineColor.www * _OutlineColor.xyz;
					    u_xlat6.w = _OutlineColor.w;
					    u_xlat5 = u_xlat5 + u_xlat6;
					    u_xlat14 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat1.xyz = vec3(u_xlat14) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat2.xyz = vec3(u_xlat14) * u_xlat2.xyz;
					    u_xlat14 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat8.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat8.x * u_xlat1.x;
					    u_xlat8.x = u_xlat21 * u_xlat1.x;
					    u_xlat15 = (-_PerspectiveFilter) + 1.0;
					    u_xlat15 = u_xlat15 * abs(u_xlat8.x);
					    u_xlat21 = u_xlat21 * u_xlat1.x + (-u_xlat15);
					    u_xlat14 = abs(u_xlat14) * u_xlat21 + u_xlat15;
					    u_xlatb21 = glstate_matrix_projection[3].w==0.0;
					    u_xlat14 = (u_xlatb21) ? u_xlat14 : u_xlat8.x;
					    u_xlat21 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat21 = u_xlat21 * u_xlat14 + 1.0;
					    u_xlat1.x = u_xlat14 / u_xlat21;
					    u_xlat21 = _OutlineWidth * _ScaleRatioA;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat8.x = u_xlat1.x * u_xlat21;
					    u_xlat8.x = u_xlat8.x + u_xlat8.x;
					    u_xlat8.x = min(u_xlat8.x, 1.0);
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat2 = u_xlat5 * u_xlat8.xxxx;
					    vs_COLOR1.xyz = u_xlat4.xyz * u_xlat4.www + u_xlat2.xyz;
					    vs_COLOR1.w = u_xlat3.w * _FaceColor.w + u_xlat2.w;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat8.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat8.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat7.x = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat7.x + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat21) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat21 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_TEXCOORD3.z = in_COLOR0.w;
					    vs_TEXCOORD3.w = 0.0;
					    u_xlat1 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
					    u_xlat7.xz = (-u_xlat1.zw) * vec2(_GradientScale);
					    u_xlat7.xz = u_xlat7.xz / vec2(_TextureWidth, _TextureHeight);
					    vs_TEXCOORD3.xy = u_xlat7.xz + in_TEXCOORD0.xy;
					    u_xlat7.x = u_xlat1.x * u_xlat14 + 1.0;
					    u_xlat7.x = u_xlat14 / u_xlat7.x;
					    u_xlat14 = u_xlat1.y * 0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat7.x + -0.5;
					    vs_TEXCOORD4.y = (-u_xlat14) * u_xlat7.x + u_xlat0.x;
					    vs_TEXCOORD4.x = u_xlat7.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[12];
						float _UnderlayOffsetX;
						float _UnderlayOffsetY;
						float _UnderlayDilate;
						float _UnderlaySoftness;
						vec4 unused_0_11[2];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _ScaleRatioC;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_18[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _TextureWidth;
						float _TextureHeight;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat11;
					vec2 u_xlat16;
					vec2 u_xlat19;
					vec2 u_xlat22;
					float u_xlat25;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat16.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat16.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat16.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat9.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat9.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat9.xy;
					    u_xlat9.xy = abs(u_xlat9.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat9.xy = u_xlat2.ww / u_xlat9.xy;
					    u_xlat25 = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlat25 = inversesqrt(u_xlat25);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat11 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat11 * u_xlat3.x;
					    u_xlat11 = u_xlat25 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat11);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat19.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat19.x = inversesqrt(u_xlat19.x);
					        u_xlat4.xyz = u_xlat19.xxx * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat16.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat16.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat19.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat19.x = inversesqrt(u_xlat19.x);
					        u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
					        u_xlat19.x = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat25 = u_xlat25 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat11 = abs(u_xlat19.x) * u_xlat25 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat1.x + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat11 + 1.0;
					    u_xlat1.x = u_xlat11 / u_xlat1.x;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat8.x * u_xlat1.x + -0.5;
					    u_xlat3.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat3.x = u_xlat3.x * 0.5;
					    u_xlat19.x = u_xlat1.x * u_xlat3.x;
					    u_xlat4.xyz = in_COLOR0.xyz;
					    u_xlat4.w = 1.0;
					    u_xlat5 = u_xlat4 * _FaceColor;
					    u_xlat4.xyz = u_xlat5.www * u_xlat5.xyz;
					    u_xlat6.xyz = _OutlineColor.www * _OutlineColor.xyz;
					    u_xlat19.x = u_xlat19.x + u_xlat19.x;
					    u_xlat19.x = min(u_xlat19.x, 1.0);
					    u_xlat19.x = sqrt(u_xlat19.x);
					    u_xlat7.xyz = (-u_xlat4.xyz);
					    u_xlat7.w = (-u_xlat5.w);
					    u_xlat6.w = _OutlineColor.w;
					    u_xlat6 = u_xlat6 + u_xlat7;
					    u_xlat6 = u_xlat19.xxxx * u_xlat6;
					    vs_COLOR1.xyz = u_xlat5.xyz * u_xlat5.www + u_xlat6.xyz;
					    vs_COLOR1.w = u_xlat4.w * _FaceColor.w + u_xlat6.w;
					    u_xlat5 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
					    u_xlat19.x = u_xlat5.x * u_xlat11 + 1.0;
					    u_xlat11 = u_xlat11 / u_xlat19.x;
					    u_xlat8.x = u_xlat8.x * u_xlat11 + -0.5;
					    u_xlat19.x = u_xlat5.y * 0.5;
					    vs_TEXCOORD4.y = (-u_xlat19.x) * u_xlat11 + u_xlat8.x;
					    u_xlat19.xy = (-u_xlat5.zw) * vec2(_GradientScale);
					    u_xlat19.xy = u_xlat19.xy / vec2(_TextureWidth, _TextureHeight);
					    u_xlat5 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat5 = min(u_xlat5, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat16.xy + (-u_xlat5.xy);
					    u_xlat22.xy = (-u_xlat5.xy) + u_xlat5.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat22.xy;
					    vs_TEXCOORD1.y = (-u_xlat3.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat3.x * u_xlat1.x + u_xlat1.w;
					    u_xlat8.xy = u_xlat16.xy * vec2(2.0, 2.0) + (-u_xlat5.xy);
					    vs_TEXCOORD2.xy = (-u_xlat5.zw) + u_xlat8.xy;
					    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat9.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
					    vs_TEXCOORD3.xy = u_xlat19.xy + in_TEXCOORD0.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0.w = _FaceColor.w;
					    vs_COLOR0.xyz = u_xlat4.xyz;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_TEXCOORD3.z = in_COLOR0.w;
					    vs_TEXCOORD3.w = 0.0;
					    vs_TEXCOORD4.x = u_xlat11;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat6.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = u_xlat15 * u_xlat1.x;
					    u_xlat11 = (-_PerspectiveFilter) + 1.0;
					    u_xlat11 = u_xlat11 * abs(u_xlat6.x);
					    u_xlat15 = u_xlat15 * u_xlat1.x + (-u_xlat11);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat11;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat6.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					bool u_xlatb6;
					vec2 u_xlat7;
					float u_xlat9;
					vec2 u_xlat12;
					float u_xlat15;
					vec2 u_xlat17;
					float u_xlat19;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb6 = 0.0>=in_TEXCOORD1.y;
					    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat12.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat12.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat12.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat7.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat7.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat7.xy;
					    u_xlat7.xy = abs(u_xlat7.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat7.xy = u_xlat2.ww / u_xlat7.xy;
					    u_xlat19 = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat9 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					    u_xlat9 = u_xlat19 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat9);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat12.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat12.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat15 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat5.xyz = vec3(u_xlat15) * u_xlat5.xyz;
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat19 = u_xlat19 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat9 = abs(u_xlat15) * u_xlat19 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat6.x = u_xlat6.x * u_xlat1.x + _WeightNormal;
					    u_xlat6.x = u_xlat6.x * 0.25 + _FaceDilate;
					    u_xlat6.x = u_xlat6.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat9 / u_xlat1.x;
					    u_xlat6.x = (-u_xlat6.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat6.x * u_xlat1.x + -0.5;
					    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat6.x = u_xlat6.x * 0.5;
					    u_xlat3.x = u_xlat1.x * u_xlat6.x;
					    u_xlat4 = in_COLOR0 * _FaceColor;
					    u_xlat4.xyz = u_xlat4.www * u_xlat4.xyz;
					    u_xlat5.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat5.xyz = u_xlat5.www * _OutlineColor.xyz;
					    u_xlat3.x = u_xlat3.x + u_xlat3.x;
					    u_xlat3.x = min(u_xlat3.x, 1.0);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat5 = (-u_xlat4) + u_xlat5;
					    vs_COLOR1 = u_xlat3.xxxx * u_xlat5 + u_xlat4;
					    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat5.xy = u_xlat12.xy + (-u_xlat3.xy);
					    u_xlat17.xy = (-u_xlat3.xy) + u_xlat3.zw;
					    vs_TEXCOORD0.zw = u_xlat5.xy / u_xlat17.xy;
					    vs_TEXCOORD1.y = (-u_xlat6.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat6.x * u_xlat1.x + u_xlat1.w;
					    u_xlat6.xy = u_xlat12.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
					    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat6.xy;
					    u_xlat6.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat7.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat6.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = u_xlat4;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat6.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = u_xlat15 * u_xlat1.x;
					    u_xlat11 = (-_PerspectiveFilter) + 1.0;
					    u_xlat11 = u_xlat11 * abs(u_xlat6.x);
					    u_xlat15 = u_xlat15 * u_xlat1.x + (-u_xlat11);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat11;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat6.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					bool u_xlatb6;
					vec2 u_xlat7;
					float u_xlat9;
					vec2 u_xlat12;
					float u_xlat15;
					vec2 u_xlat17;
					float u_xlat19;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb6 = 0.0>=in_TEXCOORD1.y;
					    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat12.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat12.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat12.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat7.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat7.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat7.xy;
					    u_xlat7.xy = abs(u_xlat7.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat7.xy = u_xlat2.ww / u_xlat7.xy;
					    u_xlat19 = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat9 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					    u_xlat9 = u_xlat19 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat9);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat12.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat12.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat15 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat5.xyz = vec3(u_xlat15) * u_xlat5.xyz;
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat19 = u_xlat19 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat9 = abs(u_xlat15) * u_xlat19 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat6.x = u_xlat6.x * u_xlat1.x + _WeightNormal;
					    u_xlat6.x = u_xlat6.x * 0.25 + _FaceDilate;
					    u_xlat6.x = u_xlat6.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat9 / u_xlat1.x;
					    u_xlat6.x = (-u_xlat6.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat6.x * u_xlat1.x + -0.5;
					    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat6.x = u_xlat6.x * 0.5;
					    u_xlat3.x = u_xlat1.x * u_xlat6.x;
					    u_xlat4 = in_COLOR0 * _FaceColor;
					    u_xlat4.xyz = u_xlat4.www * u_xlat4.xyz;
					    u_xlat5.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat5.xyz = u_xlat5.www * _OutlineColor.xyz;
					    u_xlat3.x = u_xlat3.x + u_xlat3.x;
					    u_xlat3.x = min(u_xlat3.x, 1.0);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat5 = (-u_xlat4) + u_xlat5;
					    vs_COLOR1 = u_xlat3.xxxx * u_xlat5 + u_xlat4;
					    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat5.xy = u_xlat12.xy + (-u_xlat3.xy);
					    u_xlat17.xy = (-u_xlat3.xy) + u_xlat3.zw;
					    vs_TEXCOORD0.zw = u_xlat5.xy / u_xlat17.xy;
					    vs_TEXCOORD1.y = (-u_xlat6.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat6.x * u_xlat1.x + u_xlat1.w;
					    u_xlat6.xy = u_xlat12.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
					    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat6.xy;
					    u_xlat6.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat7.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat6.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = u_xlat4;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNDERLAY_ON" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[12];
						float _UnderlayOffsetX;
						float _UnderlayOffsetY;
						float _UnderlayDilate;
						float _UnderlaySoftness;
						vec4 unused_0_11[2];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _ScaleRatioC;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_18[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _TextureWidth;
						float _TextureHeight;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec2 u_xlat8;
					float u_xlat14;
					float u_xlat15;
					float u_xlat21;
					bool u_xlatb21;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0.w = _FaceColor.w;
					    u_xlat3.xyz = in_COLOR0.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat4 = u_xlat3 * _FaceColor;
					    u_xlat2.xyz = u_xlat4.www * u_xlat4.xyz;
					    vs_COLOR0.xyz = u_xlat2.xyz;
					    u_xlat5.xyz = (-u_xlat2.xyz);
					    u_xlat5.w = (-u_xlat4.w);
					    u_xlat6.xyz = _OutlineColor.www * _OutlineColor.xyz;
					    u_xlat6.w = _OutlineColor.w;
					    u_xlat5 = u_xlat5 + u_xlat6;
					    u_xlat14 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat1.xyz = vec3(u_xlat14) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat2.xyz = vec3(u_xlat14) * u_xlat2.xyz;
					    u_xlat14 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat8.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat8.x * u_xlat1.x;
					    u_xlat8.x = u_xlat21 * u_xlat1.x;
					    u_xlat15 = (-_PerspectiveFilter) + 1.0;
					    u_xlat15 = u_xlat15 * abs(u_xlat8.x);
					    u_xlat21 = u_xlat21 * u_xlat1.x + (-u_xlat15);
					    u_xlat14 = abs(u_xlat14) * u_xlat21 + u_xlat15;
					    u_xlatb21 = glstate_matrix_projection[3].w==0.0;
					    u_xlat14 = (u_xlatb21) ? u_xlat14 : u_xlat8.x;
					    u_xlat21 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat21 = u_xlat21 * u_xlat14 + 1.0;
					    u_xlat1.x = u_xlat14 / u_xlat21;
					    u_xlat21 = _OutlineWidth * _ScaleRatioA;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat8.x = u_xlat1.x * u_xlat21;
					    u_xlat8.x = u_xlat8.x + u_xlat8.x;
					    u_xlat8.x = min(u_xlat8.x, 1.0);
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat2 = u_xlat5 * u_xlat8.xxxx;
					    vs_COLOR1.xyz = u_xlat4.xyz * u_xlat4.www + u_xlat2.xyz;
					    vs_COLOR1.w = u_xlat3.w * _FaceColor.w + u_xlat2.w;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat8.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat8.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat7.x = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat7.x + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat21) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat21 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_TEXCOORD3.z = in_COLOR0.w;
					    vs_TEXCOORD3.w = 0.0;
					    u_xlat1 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
					    u_xlat7.xz = (-u_xlat1.zw) * vec2(_GradientScale);
					    u_xlat7.xz = u_xlat7.xz / vec2(_TextureWidth, _TextureHeight);
					    vs_TEXCOORD3.xy = u_xlat7.xz + in_TEXCOORD0.xy;
					    u_xlat7.x = u_xlat1.x * u_xlat14 + 1.0;
					    u_xlat7.x = u_xlat14 / u_xlat7.x;
					    u_xlat14 = u_xlat1.y * 0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat7.x + -0.5;
					    vs_TEXCOORD4.y = (-u_xlat14) * u_xlat7.x + u_xlat0.x;
					    vs_TEXCOORD4.x = u_xlat7.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNDERLAY_ON" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[12];
						float _UnderlayOffsetX;
						float _UnderlayOffsetY;
						float _UnderlayDilate;
						float _UnderlaySoftness;
						vec4 unused_0_11[2];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _ScaleRatioC;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_18[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _TextureWidth;
						float _TextureHeight;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat11;
					vec2 u_xlat16;
					vec2 u_xlat19;
					vec2 u_xlat22;
					float u_xlat25;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat16.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat16.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat16.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat9.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat9.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat9.xy;
					    u_xlat9.xy = abs(u_xlat9.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat9.xy = u_xlat2.ww / u_xlat9.xy;
					    u_xlat25 = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlat25 = inversesqrt(u_xlat25);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat11 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat11 * u_xlat3.x;
					    u_xlat11 = u_xlat25 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat11);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat19.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat19.x = inversesqrt(u_xlat19.x);
					        u_xlat4.xyz = u_xlat19.xxx * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat16.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat16.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat19.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat19.x = inversesqrt(u_xlat19.x);
					        u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
					        u_xlat19.x = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat25 = u_xlat25 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat11 = abs(u_xlat19.x) * u_xlat25 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat1.x + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat11 + 1.0;
					    u_xlat1.x = u_xlat11 / u_xlat1.x;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat8.x * u_xlat1.x + -0.5;
					    u_xlat3.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat3.x = u_xlat3.x * 0.5;
					    u_xlat19.x = u_xlat1.x * u_xlat3.x;
					    u_xlat4.xyz = in_COLOR0.xyz;
					    u_xlat4.w = 1.0;
					    u_xlat5 = u_xlat4 * _FaceColor;
					    u_xlat4.xyz = u_xlat5.www * u_xlat5.xyz;
					    u_xlat6.xyz = _OutlineColor.www * _OutlineColor.xyz;
					    u_xlat19.x = u_xlat19.x + u_xlat19.x;
					    u_xlat19.x = min(u_xlat19.x, 1.0);
					    u_xlat19.x = sqrt(u_xlat19.x);
					    u_xlat7.xyz = (-u_xlat4.xyz);
					    u_xlat7.w = (-u_xlat5.w);
					    u_xlat6.w = _OutlineColor.w;
					    u_xlat6 = u_xlat6 + u_xlat7;
					    u_xlat6 = u_xlat19.xxxx * u_xlat6;
					    vs_COLOR1.xyz = u_xlat5.xyz * u_xlat5.www + u_xlat6.xyz;
					    vs_COLOR1.w = u_xlat4.w * _FaceColor.w + u_xlat6.w;
					    u_xlat5 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
					    u_xlat19.x = u_xlat5.x * u_xlat11 + 1.0;
					    u_xlat11 = u_xlat11 / u_xlat19.x;
					    u_xlat8.x = u_xlat8.x * u_xlat11 + -0.5;
					    u_xlat19.x = u_xlat5.y * 0.5;
					    vs_TEXCOORD4.y = (-u_xlat19.x) * u_xlat11 + u_xlat8.x;
					    u_xlat19.xy = (-u_xlat5.zw) * vec2(_GradientScale);
					    u_xlat19.xy = u_xlat19.xy / vec2(_TextureWidth, _TextureHeight);
					    u_xlat5 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat5 = min(u_xlat5, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat16.xy + (-u_xlat5.xy);
					    u_xlat22.xy = (-u_xlat5.xy) + u_xlat5.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat22.xy;
					    vs_TEXCOORD1.y = (-u_xlat3.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat3.x * u_xlat1.x + u_xlat1.w;
					    u_xlat8.xy = u_xlat16.xy * vec2(2.0, 2.0) + (-u_xlat5.xy);
					    vs_TEXCOORD2.xy = (-u_xlat5.zw) + u_xlat8.xy;
					    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat9.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
					    vs_TEXCOORD3.xy = u_xlat19.xy + in_TEXCOORD0.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0.w = _FaceColor.w;
					    vs_COLOR0.xyz = u_xlat4.xyz;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_TEXCOORD3.z = in_COLOR0.w;
					    vs_TEXCOORD3.w = 0.0;
					    vs_TEXCOORD4.x = u_xlat11;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat6.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = u_xlat15 * u_xlat1.x;
					    u_xlat11 = (-_PerspectiveFilter) + 1.0;
					    u_xlat11 = u_xlat11 * abs(u_xlat6.x);
					    u_xlat15 = u_xlat15 * u_xlat1.x + (-u_xlat11);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat11;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat6.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					bool u_xlatb6;
					vec2 u_xlat7;
					float u_xlat9;
					vec2 u_xlat12;
					float u_xlat15;
					vec2 u_xlat17;
					float u_xlat19;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb6 = 0.0>=in_TEXCOORD1.y;
					    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat12.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat12.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat12.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat7.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat7.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat7.xy;
					    u_xlat7.xy = abs(u_xlat7.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat7.xy = u_xlat2.ww / u_xlat7.xy;
					    u_xlat19 = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat9 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					    u_xlat9 = u_xlat19 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat9);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat12.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat12.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat15 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat5.xyz = vec3(u_xlat15) * u_xlat5.xyz;
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat19 = u_xlat19 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat9 = abs(u_xlat15) * u_xlat19 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat6.x = u_xlat6.x * u_xlat1.x + _WeightNormal;
					    u_xlat6.x = u_xlat6.x * 0.25 + _FaceDilate;
					    u_xlat6.x = u_xlat6.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat9 / u_xlat1.x;
					    u_xlat6.x = (-u_xlat6.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat6.x * u_xlat1.x + -0.5;
					    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat6.x = u_xlat6.x * 0.5;
					    u_xlat3.x = u_xlat1.x * u_xlat6.x;
					    u_xlat4 = in_COLOR0 * _FaceColor;
					    u_xlat4.xyz = u_xlat4.www * u_xlat4.xyz;
					    u_xlat5.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat5.xyz = u_xlat5.www * _OutlineColor.xyz;
					    u_xlat3.x = u_xlat3.x + u_xlat3.x;
					    u_xlat3.x = min(u_xlat3.x, 1.0);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat5 = (-u_xlat4) + u_xlat5;
					    vs_COLOR1 = u_xlat3.xxxx * u_xlat5 + u_xlat4;
					    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat5.xy = u_xlat12.xy + (-u_xlat3.xy);
					    u_xlat17.xy = (-u_xlat3.xy) + u_xlat3.zw;
					    vs_TEXCOORD0.zw = u_xlat5.xy / u_xlat17.xy;
					    vs_TEXCOORD1.y = (-u_xlat6.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat6.x * u_xlat1.x + u_xlat1.w;
					    u_xlat6.xy = u_xlat12.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
					    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat6.xy;
					    u_xlat6.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat7.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat6.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = u_xlat4;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat6.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = u_xlat15 * u_xlat1.x;
					    u_xlat11 = (-_PerspectiveFilter) + 1.0;
					    u_xlat11 = u_xlat11 * abs(u_xlat6.x);
					    u_xlat15 = u_xlat15 * u_xlat1.x + (-u_xlat11);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat11;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat6.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					bool u_xlatb6;
					vec2 u_xlat7;
					float u_xlat9;
					vec2 u_xlat12;
					float u_xlat15;
					vec2 u_xlat17;
					float u_xlat19;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb6 = 0.0>=in_TEXCOORD1.y;
					    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat12.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat12.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat12.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat7.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat7.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat7.xy;
					    u_xlat7.xy = abs(u_xlat7.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat7.xy = u_xlat2.ww / u_xlat7.xy;
					    u_xlat19 = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat9 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					    u_xlat9 = u_xlat19 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat9);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat12.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat12.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat15 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat15 = inversesqrt(u_xlat15);
					        u_xlat5.xyz = vec3(u_xlat15) * u_xlat5.xyz;
					        u_xlat15 = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat19 = u_xlat19 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat9 = abs(u_xlat15) * u_xlat19 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat6.x = u_xlat6.x * u_xlat1.x + _WeightNormal;
					    u_xlat6.x = u_xlat6.x * 0.25 + _FaceDilate;
					    u_xlat6.x = u_xlat6.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat9 / u_xlat1.x;
					    u_xlat6.x = (-u_xlat6.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat6.x * u_xlat1.x + -0.5;
					    u_xlat6.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat6.x = u_xlat6.x * 0.5;
					    u_xlat3.x = u_xlat1.x * u_xlat6.x;
					    u_xlat4 = in_COLOR0 * _FaceColor;
					    u_xlat4.xyz = u_xlat4.www * u_xlat4.xyz;
					    u_xlat5.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat5.xyz = u_xlat5.www * _OutlineColor.xyz;
					    u_xlat3.x = u_xlat3.x + u_xlat3.x;
					    u_xlat3.x = min(u_xlat3.x, 1.0);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat5 = (-u_xlat4) + u_xlat5;
					    vs_COLOR1 = u_xlat3.xxxx * u_xlat5 + u_xlat4;
					    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat5.xy = u_xlat12.xy + (-u_xlat3.xy);
					    u_xlat17.xy = (-u_xlat3.xy) + u_xlat3.zw;
					    vs_TEXCOORD0.zw = u_xlat5.xy / u_xlat17.xy;
					    vs_TEXCOORD1.y = (-u_xlat6.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat6.x * u_xlat1.x + u_xlat1.w;
					    u_xlat6.xy = u_xlat12.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
					    vs_TEXCOORD2.xy = (-u_xlat3.zw) + u_xlat6.xy;
					    u_xlat6.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat7.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat6.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = u_xlat4;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[12];
						float _UnderlayOffsetX;
						float _UnderlayOffsetY;
						float _UnderlayDilate;
						float _UnderlaySoftness;
						vec4 unused_0_11[2];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _ScaleRatioC;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_18[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _TextureWidth;
						float _TextureHeight;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec2 u_xlat8;
					float u_xlat14;
					float u_xlat15;
					float u_xlat21;
					bool u_xlatb21;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0.w = _FaceColor.w;
					    u_xlat3.xyz = in_COLOR0.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat4 = u_xlat3 * _FaceColor;
					    u_xlat2.xyz = u_xlat4.www * u_xlat4.xyz;
					    vs_COLOR0.xyz = u_xlat2.xyz;
					    u_xlat5.xyz = (-u_xlat2.xyz);
					    u_xlat5.w = (-u_xlat4.w);
					    u_xlat6.xyz = _OutlineColor.www * _OutlineColor.xyz;
					    u_xlat6.w = _OutlineColor.w;
					    u_xlat5 = u_xlat5 + u_xlat6;
					    u_xlat14 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat1.xyz = vec3(u_xlat14) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat2.xyz = vec3(u_xlat14) * u_xlat2.xyz;
					    u_xlat14 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat8.x = _Sharpness + 1.0;
					    u_xlat1.x = u_xlat8.x * u_xlat1.x;
					    u_xlat8.x = u_xlat21 * u_xlat1.x;
					    u_xlat15 = (-_PerspectiveFilter) + 1.0;
					    u_xlat15 = u_xlat15 * abs(u_xlat8.x);
					    u_xlat21 = u_xlat21 * u_xlat1.x + (-u_xlat15);
					    u_xlat14 = abs(u_xlat14) * u_xlat21 + u_xlat15;
					    u_xlatb21 = glstate_matrix_projection[3].w==0.0;
					    u_xlat14 = (u_xlatb21) ? u_xlat14 : u_xlat8.x;
					    u_xlat21 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat21 = u_xlat21 * u_xlat14 + 1.0;
					    u_xlat1.x = u_xlat14 / u_xlat21;
					    u_xlat21 = _OutlineWidth * _ScaleRatioA;
					    u_xlat21 = u_xlat21 * 0.5;
					    u_xlat8.x = u_xlat1.x * u_xlat21;
					    u_xlat8.x = u_xlat8.x + u_xlat8.x;
					    u_xlat8.x = min(u_xlat8.x, 1.0);
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat2 = u_xlat5 * u_xlat8.xxxx;
					    vs_COLOR1.xyz = u_xlat4.xyz * u_xlat4.www + u_xlat2.xyz;
					    vs_COLOR1.w = u_xlat3.w * _FaceColor.w + u_xlat2.w;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat8.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat8.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat7.x = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat7.x + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat21) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat21 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_TEXCOORD3.z = in_COLOR0.w;
					    vs_TEXCOORD3.w = 0.0;
					    u_xlat1 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
					    u_xlat7.xz = (-u_xlat1.zw) * vec2(_GradientScale);
					    u_xlat7.xz = u_xlat7.xz / vec2(_TextureWidth, _TextureHeight);
					    vs_TEXCOORD3.xy = u_xlat7.xz + in_TEXCOORD0.xy;
					    u_xlat7.x = u_xlat1.x * u_xlat14 + 1.0;
					    u_xlat7.x = u_xlat14 / u_xlat7.x;
					    u_xlat14 = u_xlat1.y * 0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat7.x + -0.5;
					    vs_TEXCOORD4.y = (-u_xlat14) * u_xlat7.x + u_xlat0.x;
					    vs_TEXCOORD4.x = u_xlat7.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					#extension GL_AMD_vertex_shader_layer : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[12];
						float _UnderlayOffsetX;
						float _UnderlayOffsetY;
						float _UnderlayDilate;
						float _UnderlaySoftness;
						vec4 unused_0_11[2];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _ScaleRatioC;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_18[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _TextureWidth;
						float _TextureHeight;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						float _Sharpness;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_3_1[20];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_3[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_5[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					flat out uint vs_SV_InstanceID0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					int u_xlati0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat11;
					vec2 u_xlat16;
					vec2 u_xlat19;
					vec2 u_xlat22;
					float u_xlat25;
					void main()
					{
					    u_xlati0 = int(uint(gl_InstanceID) & 1u);
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat16.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlati1 = u_xlati0 << 2;
					    u_xlat2 = u_xlat16.yyyy * unity_ObjectToWorld[1];
					    u_xlat2 = unity_ObjectToWorld[0] * u_xlat16.xxxx + u_xlat2;
					    u_xlat2 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat3 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat2.wwww + u_xlat3;
					    u_xlat9.xy = _ScreenParams.yy * unity_StereoMatrixP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4].xy;
					    u_xlat9.xy = unity_StereoMatrixP[u_xlati1 / 4][u_xlati1 % 4].xy * _ScreenParams.xx + u_xlat9.xy;
					    u_xlat9.xy = abs(u_xlat9.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat9.xy = u_xlat2.ww / u_xlat9.xy;
					    u_xlat25 = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlat25 = inversesqrt(u_xlat25);
					    u_xlat3.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat11 = _Sharpness + 1.0;
					    u_xlat3.x = u_xlat11 * u_xlat3.x;
					    u_xlat11 = u_xlat25 * u_xlat3.x;
					    u_xlatb1 = 0.0==unity_StereoMatrixP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4].w;
					    if(u_xlatb1){
					        u_xlat1.x = (-_PerspectiveFilter) + 1.0;
					        u_xlat1.x = u_xlat1.x * abs(u_xlat11);
					        u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					        u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					        u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					        u_xlat19.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					        u_xlat19.x = inversesqrt(u_xlat19.x);
					        u_xlat4.xyz = u_xlat19.xxx * u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat16.yyy * unity_ObjectToWorld[1].xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[0].xyz * u_xlat16.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat5.xyz;
					        u_xlat5.xyz = (-u_xlat5.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati0].xyz;
					        u_xlat19.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat19.x = inversesqrt(u_xlat19.x);
					        u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
					        u_xlat19.x = dot(u_xlat4.xyz, u_xlat5.xyz);
					        u_xlat25 = u_xlat25 * u_xlat3.x + (-u_xlat1.x);
					        u_xlat11 = abs(u_xlat19.x) * u_xlat25 + u_xlat1.x;
					    }
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat1.x + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat1.x = u_xlat1.x * u_xlat11 + 1.0;
					    u_xlat1.x = u_xlat11 / u_xlat1.x;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat8.x * u_xlat1.x + -0.5;
					    u_xlat3.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat3.x = u_xlat3.x * 0.5;
					    u_xlat19.x = u_xlat1.x * u_xlat3.x;
					    u_xlat4.xyz = in_COLOR0.xyz;
					    u_xlat4.w = 1.0;
					    u_xlat5 = u_xlat4 * _FaceColor;
					    u_xlat4.xyz = u_xlat5.www * u_xlat5.xyz;
					    u_xlat6.xyz = _OutlineColor.www * _OutlineColor.xyz;
					    u_xlat19.x = u_xlat19.x + u_xlat19.x;
					    u_xlat19.x = min(u_xlat19.x, 1.0);
					    u_xlat19.x = sqrt(u_xlat19.x);
					    u_xlat7.xyz = (-u_xlat4.xyz);
					    u_xlat7.w = (-u_xlat5.w);
					    u_xlat6.w = _OutlineColor.w;
					    u_xlat6 = u_xlat6 + u_xlat7;
					    u_xlat6 = u_xlat19.xxxx * u_xlat6;
					    vs_COLOR1.xyz = u_xlat5.xyz * u_xlat5.www + u_xlat6.xyz;
					    vs_COLOR1.w = u_xlat4.w * _FaceColor.w + u_xlat6.w;
					    u_xlat5 = vec4(_UnderlaySoftness, _UnderlayDilate, _UnderlayOffsetX, _UnderlayOffsetY) * vec4(vec4(_ScaleRatioC, _ScaleRatioC, _ScaleRatioC, _ScaleRatioC));
					    u_xlat19.x = u_xlat5.x * u_xlat11 + 1.0;
					    u_xlat11 = u_xlat11 / u_xlat19.x;
					    u_xlat8.x = u_xlat8.x * u_xlat11 + -0.5;
					    u_xlat19.x = u_xlat5.y * 0.5;
					    vs_TEXCOORD4.y = (-u_xlat19.x) * u_xlat11 + u_xlat8.x;
					    u_xlat19.xy = (-u_xlat5.zw) * vec2(_GradientScale);
					    u_xlat19.xy = u_xlat19.xy / vec2(_TextureWidth, _TextureHeight);
					    u_xlat5 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat5 = min(u_xlat5, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat16.xy + (-u_xlat5.xy);
					    u_xlat22.xy = (-u_xlat5.xy) + u_xlat5.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat22.xy;
					    vs_TEXCOORD1.y = (-u_xlat3.x) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat3.x * u_xlat1.x + u_xlat1.w;
					    u_xlat8.xy = u_xlat16.xy * vec2(2.0, 2.0) + (-u_xlat5.xy);
					    vs_TEXCOORD2.xy = (-u_xlat5.zw) + u_xlat8.xy;
					    u_xlat8.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat9.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat8.xy;
					    vs_TEXCOORD3.xy = u_xlat19.xy + in_TEXCOORD0.xy;
					    gl_Position = u_xlat2;
					    vs_COLOR0.w = _FaceColor.w;
					    vs_COLOR0.xyz = u_xlat4.xyz;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
					    vs_TEXCOORD3.z = in_COLOR0.w;
					    vs_TEXCOORD3.w = 0.0;
					    vs_TEXCOORD4.x = u_xlat11;
					    vs_SV_InstanceID0 =  uint(gl_InstanceID);
					    gl_Layer = u_xlati0;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    SV_Target0 = u_xlat0.xxxx * vs_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    SV_Target0 = u_xlat0.xxxx * vs_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = u_xlat1.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + vs_COLOR1;
					    SV_Target0 = u_xlat1.yyyy * u_xlat0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = u_xlat1.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + vs_COLOR1;
					    SV_Target0 = u_xlat1.yyyy * u_xlat0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNDERLAY_ON" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[18];
						vec4 _UnderlayColor;
						vec4 unused_0_2[11];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD4.x + (-vs_TEXCOORD4.y);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
					    u_xlat1.w = _UnderlayColor.w;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xy = u_xlat2.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat1 = u_xlat2.xxxx * u_xlat1 + vs_COLOR1;
					    u_xlat3 = u_xlat2.yyyy * u_xlat1;
					    u_xlat1.x = (-u_xlat1.w) * u_xlat2.y + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx + u_xlat3;
					    SV_Target0 = u_xlat0 * vs_TEXCOORD3.zzzz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNDERLAY_ON" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[18];
						vec4 _UnderlayColor;
						vec4 unused_0_2[11];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD4.x + (-vs_TEXCOORD4.y);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
					    u_xlat1.w = _UnderlayColor.w;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xy = u_xlat2.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat1 = u_xlat2.xxxx * u_xlat1 + vs_COLOR1;
					    u_xlat3 = u_xlat2.yyyy * u_xlat1;
					    u_xlat1.x = (-u_xlat1.w) * u_xlat2.y + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx + u_xlat3;
					    SV_Target0 = u_xlat0 * vs_TEXCOORD3.zzzz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_ALPHACLIP" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2 = vs_COLOR0.w * u_xlat0.x + -0.00100000005;
					    u_xlat1 = u_xlat0.xxxx * vs_COLOR0;
					    SV_Target0 = u_xlat1;
					    u_xlatb0 = u_xlat2<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "UNITY_UI_ALPHACLIP" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2 = vs_COLOR0.w * u_xlat0.x + -0.00100000005;
					    u_xlat1 = u_xlat0.xxxx * vs_COLOR0;
					    SV_Target0 = u_xlat1;
					    u_xlatb0 = u_xlat2<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNITY_UI_ALPHACLIP" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = u_xlat1.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + vs_COLOR1;
					    u_xlat1.x = u_xlat0.w * u_xlat1.y + -0.00100000005;
					    u_xlat0 = u_xlat1.yyyy * u_xlat0;
					    SV_Target0 = u_xlat0;
					    u_xlatb0 = u_xlat1.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNITY_UI_ALPHACLIP" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = u_xlat1.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + vs_COLOR1;
					    u_xlat1.x = u_xlat0.w * u_xlat1.y + -0.00100000005;
					    u_xlat0 = u_xlat1.yyyy * u_xlat0;
					    SV_Target0 = u_xlat0;
					    u_xlatb0 = u_xlat1.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[18];
						vec4 _UnderlayColor;
						vec4 unused_0_2[11];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD4.x + (-vs_TEXCOORD4.y);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
					    u_xlat1.w = _UnderlayColor.w;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xy = u_xlat2.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat1 = u_xlat2.xxxx * u_xlat1 + vs_COLOR1;
					    u_xlat3 = u_xlat2.yyyy * u_xlat1;
					    u_xlat1.x = (-u_xlat1.w) * u_xlat2.y + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx + u_xlat3;
					    u_xlat1.x = u_xlat0.w * vs_TEXCOORD3.z + -0.00100000005;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD3.zzzz;
					    SV_Target0 = u_xlat0;
					    u_xlatb0 = u_xlat1.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[18];
						vec4 _UnderlayColor;
						vec4 unused_0_2[11];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD4.x + (-vs_TEXCOORD4.y);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
					    u_xlat1.w = _UnderlayColor.w;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xy = u_xlat2.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat1 = u_xlat2.xxxx * u_xlat1 + vs_COLOR1;
					    u_xlat3 = u_xlat2.yyyy * u_xlat1;
					    u_xlat1.x = (-u_xlat1.w) * u_xlat2.y + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx + u_xlat3;
					    u_xlat1.x = u_xlat0.w * vs_TEXCOORD3.z + -0.00100000005;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD3.zzzz;
					    SV_Target0 = u_xlat0;
					    u_xlatb0 = u_xlat1.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat2) * vs_COLOR0;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat2) * vs_COLOR0;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = u_xlat1.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + vs_COLOR1;
					    u_xlat0 = u_xlat1.yyyy * u_xlat0;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    SV_Target0 = u_xlat0 * u_xlat1.xxxx;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = u_xlat1.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + vs_COLOR1;
					    u_xlat0 = u_xlat1.yyyy * u_xlat0;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    SV_Target0 = u_xlat0 * u_xlat1.xxxx;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNDERLAY_ON" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[18];
						vec4 _UnderlayColor;
						vec4 unused_0_2[7];
						vec4 _ClipRect;
						vec4 unused_0_4[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD4.x + (-vs_TEXCOORD4.y);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
					    u_xlat1.w = _UnderlayColor.w;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xy = u_xlat2.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat1 = u_xlat2.xxxx * u_xlat1 + vs_COLOR1;
					    u_xlat3 = u_xlat2.yyyy * u_xlat1;
					    u_xlat1.x = (-u_xlat1.w) * u_xlat2.y + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx + u_xlat3;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    SV_Target0 = u_xlat0 * vs_TEXCOORD3.zzzz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNDERLAY_ON" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[18];
						vec4 _UnderlayColor;
						vec4 unused_0_2[7];
						vec4 _ClipRect;
						vec4 unused_0_4[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD4.x + (-vs_TEXCOORD4.y);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
					    u_xlat1.w = _UnderlayColor.w;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xy = u_xlat2.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat1 = u_xlat2.xxxx * u_xlat1 + vs_COLOR1;
					    u_xlat3 = u_xlat2.yyyy * u_xlat1;
					    u_xlat1.x = (-u_xlat1.w) * u_xlat2.y + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx + u_xlat3;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    SV_Target0 = u_xlat0 * vs_TEXCOORD3.zzzz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat2) * vs_COLOR0;
					    u_xlat2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
					    u_xlat1 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat1;
					    u_xlatb0 = u_xlat2<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat2) * vs_COLOR0;
					    u_xlat2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
					    u_xlat1 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat1;
					    u_xlatb0 = u_xlat2<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = u_xlat1.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + vs_COLOR1;
					    u_xlat0 = u_xlat1.yyyy * u_xlat0;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat3 = u_xlat0.w * u_xlat1.x + -0.00100000005;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    SV_Target0 = u_xlat0;
					    u_xlatb0 = u_xlat3<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = u_xlat1.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + vs_COLOR1;
					    u_xlat0 = u_xlat1.yyyy * u_xlat0;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat3 = u_xlat0.w * u_xlat1.x + -0.00100000005;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    SV_Target0 = u_xlat0;
					    u_xlatb0 = u_xlat3<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[18];
						vec4 _UnderlayColor;
						vec4 unused_0_2[7];
						vec4 _ClipRect;
						vec4 unused_0_4[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD4.x + (-vs_TEXCOORD4.y);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
					    u_xlat1.w = _UnderlayColor.w;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xy = u_xlat2.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat1 = u_xlat2.xxxx * u_xlat1 + vs_COLOR1;
					    u_xlat3 = u_xlat2.yyyy * u_xlat1;
					    u_xlat1.x = (-u_xlat1.w) * u_xlat2.y + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx + u_xlat3;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat1.x = u_xlat0.w * vs_TEXCOORD3.z + -0.00100000005;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD3.zzzz;
					    SV_Target0 = u_xlat0;
					    u_xlatb0 = u_xlat1.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "OUTLINE_ON" "STEREO_INSTANCING_ON" "UNDERLAY_ON" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[18];
						vec4 _UnderlayColor;
						vec4 unused_0_2[7];
						vec4 _ClipRect;
						vec4 unused_0_4[3];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat0.x = u_xlat0.w * vs_TEXCOORD4.x + (-vs_TEXCOORD4.y);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = _UnderlayColor.www * _UnderlayColor.xyz;
					    u_xlat1.w = _UnderlayColor.w;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1 = vs_COLOR0 + (-vs_COLOR1);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xy = u_xlat2.ww * vs_TEXCOORD1.xx + (-vs_TEXCOORD1.zy);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat1 = u_xlat2.xxxx * u_xlat1 + vs_COLOR1;
					    u_xlat3 = u_xlat2.yyyy * u_xlat1;
					    u_xlat1.x = (-u_xlat1.w) * u_xlat2.y + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx + u_xlat3;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat1.x = u_xlat0.w * vs_TEXCOORD3.z + -0.00100000005;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD3.zzzz;
					    SV_Target0 = u_xlat0;
					    u_xlatb0 = u_xlat1.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
			}
		}
	}
	CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}