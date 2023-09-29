Shader "Custom/SteamVR_SphericalProjection" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_N ("N (normal of plane)", Vector) = (0,0,0,0)
		_Phi0 ("Phi0", Float) = 0
		_Phi1 ("Phi1", Float) = 1
		_Theta0 ("Theta0", Float) = 0
		_Theta1 ("Theta1", Float) = 1
		_UAxis ("uAxis", Vector) = (0,0,0,0)
		_VAxis ("vAxis", Vector) = (0,0,0,0)
		_UOrigin ("uOrigin", Vector) = (0,0,0,0)
		_VOrigin ("vOrigin", Vector) = (0,0,0,0)
		_UScale ("uScale", Float) = 1
		_VScale ("vScale", Float) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 29809
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
						float _Phi0;
						float _Phi1;
						float _Theta0;
						float _Theta1;
						vec4 unused_0_5[5];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = (-vec2(_Phi0, _Theta0)) + vec2(_Phi1, _Theta1);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * u_xlat0.xy + vec2(_Phi0, _Theta0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
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
						float _Phi0;
						float _Phi1;
						float _Theta0;
						float _Theta1;
						vec4 unused_0_5[5];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[40];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_StereoMatrixVP[1 / 4][1 % 4];
					    u_xlat1 = unity_StereoMatrixVP[0 / 4][0 % 4] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_StereoMatrixVP[2 / 4][2 % 4] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_StereoMatrixVP[3 / 4][3 % 4] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = (-vec2(_Phi0, _Theta0)) + vec2(_Phi1, _Theta1);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * u_xlat0.xy + vec2(_Phi0, _Theta0);
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
						vec4 unused_0_0[2];
						vec4 _N;
						vec4 unused_0_2;
						vec4 _UAxis;
						vec4 _VAxis;
						vec4 _UOrigin;
						vec4 _VOrigin;
						float _UScale;
						float _VScale;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = sin(vs_TEXCOORD0.yx);
					    u_xlat1.xy = cos(vs_TEXCOORD0.yx);
					    u_xlat2.x = u_xlat0.y * u_xlat0.x;
					    u_xlat2.z = u_xlat0.x * u_xlat1.y;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat0.x = dot(u_xlat2.xyz, _N.xyz);
					    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xxx;
					    u_xlat1.xyz = u_xlat0.xyz + (-_UOrigin.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + (-_VOrigin.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, _VAxis.xyz);
					    u_xlat0.y = u_xlat0.x * _VScale;
					    u_xlat6 = dot(u_xlat1.xyz, _UAxis.xyz);
					    u_xlat0.x = u_xlat6 * _UScale;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
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
						vec4 unused_0_0[2];
						vec4 _N;
						vec4 unused_0_2;
						vec4 _UAxis;
						vec4 _VAxis;
						vec4 _UOrigin;
						vec4 _VOrigin;
						float _UScale;
						float _VScale;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = sin(vs_TEXCOORD0.yx);
					    u_xlat1.xy = cos(vs_TEXCOORD0.yx);
					    u_xlat2.x = u_xlat0.y * u_xlat0.x;
					    u_xlat2.z = u_xlat0.x * u_xlat1.y;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat0.x = dot(u_xlat2.xyz, _N.xyz);
					    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xxx;
					    u_xlat1.xyz = u_xlat0.xyz + (-_UOrigin.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + (-_VOrigin.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, _VAxis.xyz);
					    u_xlat0.y = u_xlat0.x * _VScale;
					    u_xlat6 = dot(u_xlat1.xyz, _UAxis.xyz);
					    u_xlat0.x = u_xlat6 * _UScale;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
					    return;
					}"
				}
			}
		}
	}
}