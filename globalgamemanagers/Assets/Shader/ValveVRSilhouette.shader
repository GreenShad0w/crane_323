Shader "Valve/VR/Silhouette" {
	Properties {
		g_vOutlineColor ("Outline Color", Vector) = (0.5,0.5,0.5,1)
		g_flOutlineWidth ("Outline width", Range(0.001, 0.03)) = 0.005
		g_flCornerAdjust ("Corner Adjustment", Range(0, 2)) = 0.5
	}
	SubShader {
		Tags { "QUEUE" = "Geometry-1" "RenderType" = "Outline" }
		Pass {
			Tags { "LIGHTMODE" = "ALWAYS" "QUEUE" = "Geometry-1" "RenderType" = "Outline" }
			ColorMask 0 -1
			ZWrite Off
			Cull Off
			Stencil {
				Ref 1
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}
			GpuProgramID 15622
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_5_0
					
					#version 430
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
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[7];
					};
					UNITY_BINDING(1) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec3 in_NORMAL0;
					layout(location = 0) out vec4 vs_TEXCOORD0;
					layout(location = 1) out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"vs_5_0
					
					#version 430
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
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[7];
					};
					UNITY_BINDING(1) uniform UnityStereoGlobals {
						vec4 unused_1_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_1_2[40];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec3 in_NORMAL0;
					layout(location = 0) out vec4 vs_TEXCOORD0;
					layout(location = 1) out vec3 vs_TEXCOORD1;
					layout(location = 2) flat out uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati1;
					vec4 u_xlat2;
					void main()
					{
					    vs_TEXCOORD0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlati1 = int(bitfieldInsert(0,gl_InstanceID,2,1) );
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    vs_SV_InstanceID0 = 0u;
					    gl_Layer = int(uint(gl_InstanceID) & 1u);
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(1.0, 0.0, 1.0, 1.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(1.0, 0.0, 1.0, 1.0);
					    return;
					}"
				}
			}
		}
		Pass {
			Tags { "LIGHTMODE" = "ALWAYS" "QUEUE" = "Geometry-1" "RenderType" = "Outline" }
			Cull Off
			Stencil {
				Ref 1
				Comp NotEqual
				Pass Keep
				Fail Keep
				ZFail Keep
			}
			GpuProgramID 71369
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_5_0
					
					#version 430
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
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[7];
					};
					UNITY_BINDING(1) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec3 in_NORMAL0;
					layout(location = 0) out vec4 vs_TEXCOORD0;
					layout(location = 1) out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"vs_5_0
					
					#version 430
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
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[7];
					};
					UNITY_BINDING(1) uniform UnityStereoGlobals {
						vec4 unused_1_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_1_2[40];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec3 in_NORMAL0;
					layout(location = 0) out vec4 vs_TEXCOORD0;
					layout(location = 1) out vec3 vs_TEXCOORD1;
					layout(location = 2) flat out uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati1;
					vec4 u_xlat2;
					void main()
					{
					    vs_TEXCOORD0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlati1 = int(bitfieldInsert(0,gl_InstanceID,2,1) );
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    vs_SV_InstanceID0 = 0u;
					    gl_Layer = int(uint(gl_InstanceID) & 1u);
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_5_0
					
					#version 430
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
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform Props {
						vec4 g_vOutlineColor;
						vec4 unused_0_1;
					};
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = g_vOutlineColor;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"ps_5_0
					
					#version 430
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
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform Props {
						vec4 g_vOutlineColor;
						vec4 unused_0_1;
					};
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = g_vOutlineColor;
					    return;
					}"
				}
			}
			Program "gp" {
				SubProgram "d3d11 " {
					"gs_5_0
					
					#version 430
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
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					UNITY_BINDING(1) uniform UnityPerFrame {
						vec4 unused_1_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_1_2[4];
						mat4x4 unity_MatrixInvV;
						mat4x4 unity_MatrixVP;
						vec4 unused_1_5[2];
					};
					UNITY_BINDING(2) uniform Props {
						vec4 unused_2_0;
						float g_flOutlineWidth;
						float g_flCornerAdjust;
					};
					layout(location = 0) in  vec4 vs_TEXCOORD0 [3];
					layout(location = 1) in  vec3 vs_TEXCOORD1 [3];
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec2 u_xlat22;
					float u_xlat27;
					float u_xlat28;
					layout(triangles) in;
					layout(triangle_strip) out;
					layout(location = 0) out vec4 gs_TEXCOORD0;
					layout(location = 1) out vec3 gs_TEXCOORD1;
					layout(max_vertices = 18) out;
					void main()
					{
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    u_xlat0.xyz = (-vs_TEXCOORD0[0].xyz) + vs_TEXCOORD0[2].xyz;
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat1.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD0[1].xyz) + vs_TEXCOORD0[0].xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = inversesqrt(u_xlat28);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat28) + (-u_xlat1.xyz);
					    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
					    u_xlat28 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat28 = inversesqrt(u_xlat28);
					    u_xlat1.xyz = vec3(u_xlat28) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(g_flCornerAdjust, g_flCornerAdjust, g_flCornerAdjust)) + vs_TEXCOORD1[0].xyz;
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    gl_Position = gl_in[0].gl_Position;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    u_xlat3.xyz = unity_WorldToObject[1].xyz * unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = unity_WorldToObject[0].xyz * unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[2].xyz * unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[3].xyz * unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat28 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat4.xy = vec2(u_xlat28) * glstate_matrix_projection[1].xy;
					    u_xlat5.xyz = unity_WorldToObject[1].xyz * unity_MatrixInvV[0].yyy;
					    u_xlat5.xyz = unity_WorldToObject[0].xyz * unity_MatrixInvV[0].xxx + u_xlat5.xyz;
					    u_xlat5.xyz = unity_WorldToObject[2].xyz * unity_MatrixInvV[0].zzz + u_xlat5.xyz;
					    u_xlat5.xyz = unity_WorldToObject[3].xyz * unity_MatrixInvV[0].www + u_xlat5.xyz;
					    u_xlat28 = dot(u_xlat5.xyz, u_xlat1.xyz);
					    u_xlat4.xy = glstate_matrix_projection[0].xy * vec2(u_xlat28) + u_xlat4.xy;
					    u_xlat28 = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat28 = inversesqrt(u_xlat28);
					    u_xlat4.xy = vec2(u_xlat28) * u_xlat4.xy;
					    u_xlat6 = unity_ObjectToWorld[1] * vs_TEXCOORD0[0].yyyy;
					    u_xlat6 = unity_ObjectToWorld[0] * vs_TEXCOORD0[0].xxxx + u_xlat6;
					    u_xlat6 = unity_ObjectToWorld[2] * vs_TEXCOORD0[0].zzzz + u_xlat6;
					    u_xlat6 = u_xlat6 + unity_ObjectToWorld[3];
					    u_xlat7 = u_xlat6.yyyy * unity_MatrixVP[1];
					    u_xlat7 = unity_MatrixVP[0] * u_xlat6.xxxx + u_xlat7;
					    u_xlat7 = unity_MatrixVP[2] * u_xlat6.zzzz + u_xlat7;
					    u_xlat6 = unity_MatrixVP[3] * u_xlat6.wwww + u_xlat7;
					    u_xlat4.xy = u_xlat4.xy * u_xlat6.ww;
					    u_xlat4.xy = u_xlat4.xy * vec2(g_flOutlineWidth) + u_xlat6.xy;
					    gl_Position.xy = u_xlat4.xy;
					    gl_Position.zw = u_xlat6.zw;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    u_xlat7.xyz = (-vs_TEXCOORD0[2].xyz) + vs_TEXCOORD0[1].xyz;
					    u_xlat28 = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat28 = inversesqrt(u_xlat28);
					    u_xlat2.xyz = u_xlat7.xyz * vec3(u_xlat28) + (-u_xlat2.xyz);
					    u_xlat7.xyz = vec3(u_xlat28) * u_xlat7.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27) + (-u_xlat7.xyz);
					    u_xlat27 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(g_flCornerAdjust, g_flCornerAdjust, g_flCornerAdjust)) + vs_TEXCOORD1[1].xyz;
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    gl_Position = gl_in[1].gl_Position;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    gl_Position.xy = u_xlat4.xy;
					    gl_Position.zw = u_xlat6.zw;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat22.xy = vec2(u_xlat27) * glstate_matrix_projection[1].xy;
					    u_xlat27 = dot(u_xlat5.xyz, u_xlat2.xyz);
					    u_xlat22.xy = glstate_matrix_projection[0].xy * vec2(u_xlat27) + u_xlat22.xy;
					    u_xlat27 = dot(u_xlat22.xy, u_xlat22.xy);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat22.xy = vec2(u_xlat27) * u_xlat22.xy;
					    u_xlat7 = unity_ObjectToWorld[1] * vs_TEXCOORD0[1].yyyy;
					    u_xlat7 = unity_ObjectToWorld[0] * vs_TEXCOORD0[1].xxxx + u_xlat7;
					    u_xlat7 = unity_ObjectToWorld[2] * vs_TEXCOORD0[1].zzzz + u_xlat7;
					    u_xlat7 = u_xlat7 + unity_ObjectToWorld[3];
					    u_xlat8 = u_xlat7.yyyy * unity_MatrixVP[1];
					    u_xlat8 = unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat8;
					    u_xlat8 = unity_MatrixVP[2] * u_xlat7.zzzz + u_xlat8;
					    u_xlat7 = unity_MatrixVP[3] * u_xlat7.wwww + u_xlat8;
					    u_xlat22.xy = u_xlat22.xy * u_xlat7.ww;
					    u_xlat22.xy = u_xlat22.xy * vec2(g_flOutlineWidth) + u_xlat7.xy;
					    gl_Position.xy = u_xlat22.xy;
					    gl_Position.zw = u_xlat7.zw;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    gl_Position = gl_in[1].gl_Position;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    gl_Position = gl_in[1].gl_Position;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    gl_Position.xy = u_xlat22.xy;
					    gl_Position.zw = u_xlat7.zw;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(g_flCornerAdjust, g_flCornerAdjust, g_flCornerAdjust)) + vs_TEXCOORD1[2].xyz;
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat3.xy = vec2(u_xlat27) * glstate_matrix_projection[1].xy;
					    u_xlat27 = dot(u_xlat5.xyz, u_xlat0.xyz);
					    u_xlat3.xy = glstate_matrix_projection[0].xy * vec2(u_xlat27) + u_xlat3.xy;
					    u_xlat27 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xy = vec2(u_xlat27) * u_xlat3.xy;
					    u_xlat5 = unity_ObjectToWorld[1] * vs_TEXCOORD0[2].yyyy;
					    u_xlat5 = unity_ObjectToWorld[0] * vs_TEXCOORD0[2].xxxx + u_xlat5;
					    u_xlat5 = unity_ObjectToWorld[2] * vs_TEXCOORD0[2].zzzz + u_xlat5;
					    u_xlat5 = u_xlat5 + unity_ObjectToWorld[3];
					    u_xlat7 = u_xlat5.yyyy * unity_MatrixVP[1];
					    u_xlat7 = unity_MatrixVP[0] * u_xlat5.xxxx + u_xlat7;
					    u_xlat7 = unity_MatrixVP[2] * u_xlat5.zzzz + u_xlat7;
					    u_xlat5 = unity_MatrixVP[3] * u_xlat5.wwww + u_xlat7;
					    u_xlat3.xy = u_xlat3.xy * u_xlat5.ww;
					    u_xlat3.xy = u_xlat3.xy * vec2(g_flOutlineWidth) + u_xlat5.xy;
					    gl_Position.xy = u_xlat3.xy;
					    gl_Position.zw = u_xlat5.zw;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    gl_Position = gl_in[1].gl_Position;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    gl_Position.xy = u_xlat3.xy;
					    gl_Position.zw = u_xlat5.zw;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    gl_Position = gl_in[2].gl_Position;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    gl_Position = gl_in[2].gl_Position;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    gl_Position.xy = u_xlat3.xy;
					    gl_Position.zw = u_xlat5.zw;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    gl_Position = gl_in[0].gl_Position;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    gl_Position.xy = u_xlat3.xy;
					    gl_Position.zw = u_xlat5.zw;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    gl_Position.xy = u_xlat4.xy;
					    gl_Position.zw = u_xlat6.zw;
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    gl_Position = gl_in[0].gl_Position;
					    EmitVertex();
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"gs_5_0
					
					#version 430
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
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					UNITY_BINDING(1) uniform UnityStereoGlobals {
						mat4x4 unity_StereoMatrixP[2];
						vec4 unused_1_1[12];
						mat4x4 unity_StereoMatrixInvV[2];
						vec4 unused_1_3[4];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_1_5[40];
					};
					UNITY_BINDING(2) uniform Props {
						vec4 unused_2_0;
						float g_flOutlineWidth;
						float g_flCornerAdjust;
					};
					layout(location = 0) in  vec4 vs_TEXCOORD0 [3];
					layout(location = 1) in  vec3 vs_TEXCOORD1 [3];
					layout(location = 2) flat in  uint vs_SV_InstanceID0 [3];
					layout(location = 3) flat in  uint gl_Layer [3];
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec2 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec2 u_xlat23;
					float u_xlat27;
					float u_xlat28;
					int u_xlati28;
					float u_xlat29;
					int u_xlati30;
					layout(triangles) in;
					layout(triangle_strip) out;
					layout(location = 0) out vec4 gs_TEXCOORD0;
					layout(location = 1) out vec3 gs_TEXCOORD1;
					layout(location = 2) flat out uint gs_SV_InstanceID0;
					layout(max_vertices = 18) out;
					void main()
					{
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    u_xlat0.xyz = (-vs_TEXCOORD0[0].xyz) + vs_TEXCOORD0[2].xyz;
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat1.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD0[1].xyz) + vs_TEXCOORD0[0].xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = inversesqrt(u_xlat28);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat28) + (-u_xlat1.xyz);
					    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
					    u_xlat28 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat28 = inversesqrt(u_xlat28);
					    u_xlat1.xyz = vec3(u_xlat28) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(g_flCornerAdjust, g_flCornerAdjust, g_flCornerAdjust)) + vs_TEXCOORD1[0].xyz;
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    gl_Position = gl_in[0].gl_Position;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[0];
					    gl_Layer = gl_Layer[0];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    u_xlati28 = int(bitfieldInsert(0,int(vs_SV_InstanceID0[2]),2,1) );
					    u_xlat3.xyz = unity_WorldToObject[1].xyz * unity_StereoMatrixInvV[u_xlati28 / 4][u_xlati28 % 4].yyy;
					    u_xlat3.xyz = unity_WorldToObject[0].xyz * unity_StereoMatrixInvV[u_xlati28 / 4][u_xlati28 % 4].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[2].xyz * unity_StereoMatrixInvV[u_xlati28 / 4][u_xlati28 % 4].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_WorldToObject[3].xyz * unity_StereoMatrixInvV[u_xlati28 / 4][u_xlati28 % 4].www + u_xlat3.xyz;
					    u_xlat29 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat4.xyz = unity_WorldToObject[1].xyz * unity_StereoMatrixInvV[(u_xlati28 + 1) / 4][(u_xlati28 + 1) % 4].yyy;
					    u_xlat4.xyz = unity_WorldToObject[0].xyz * unity_StereoMatrixInvV[(u_xlati28 + 1) / 4][(u_xlati28 + 1) % 4].xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_WorldToObject[2].xyz * unity_StereoMatrixInvV[(u_xlati28 + 1) / 4][(u_xlati28 + 1) % 4].zzz + u_xlat4.xyz;
					    u_xlat4.xyz = unity_WorldToObject[3].xyz * unity_StereoMatrixInvV[(u_xlati28 + 1) / 4][(u_xlati28 + 1) % 4].www + u_xlat4.xyz;
					    u_xlat28 = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlati30 = gl_Layer[2] << 2;
					    u_xlat5.xy = vec2(u_xlat28) * unity_StereoMatrixP[(u_xlati30 + 1) / 4][(u_xlati30 + 1) % 4].xy;
					    u_xlat5.xy = unity_StereoMatrixP[u_xlati30 / 4][u_xlati30 % 4].xy * vec2(u_xlat29) + u_xlat5.xy;
					    u_xlat28 = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat28 = inversesqrt(u_xlat28);
					    u_xlat5.xy = vec2(u_xlat28) * u_xlat5.xy;
					    u_xlat6 = unity_ObjectToWorld[1] * vs_TEXCOORD0[0].yyyy;
					    u_xlat6 = unity_ObjectToWorld[0] * vs_TEXCOORD0[0].xxxx + u_xlat6;
					    u_xlat6 = unity_ObjectToWorld[2] * vs_TEXCOORD0[0].zzzz + u_xlat6;
					    u_xlat6 = u_xlat6 + unity_ObjectToWorld[3];
					    u_xlat7 = u_xlat6.yyyy * unity_StereoMatrixVP[(u_xlati30 + 1) / 4][(u_xlati30 + 1) % 4];
					    u_xlat7 = unity_StereoMatrixVP[u_xlati30 / 4][u_xlati30 % 4] * u_xlat6.xxxx + u_xlat7;
					    u_xlat7 = unity_StereoMatrixVP[(u_xlati30 + 2) / 4][(u_xlati30 + 2) % 4] * u_xlat6.zzzz + u_xlat7;
					    u_xlat6 = unity_StereoMatrixVP[(u_xlati30 + 3) / 4][(u_xlati30 + 3) % 4] * u_xlat6.wwww + u_xlat7;
					    u_xlat5.xy = u_xlat5.xy * u_xlat6.ww;
					    u_xlat5.xy = u_xlat5.xy * vec2(g_flOutlineWidth) + u_xlat6.xy;
					    gl_Position.xy = u_xlat5.xy;
					    gl_Position.zw = u_xlat6.zw;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[0];
					    gl_Layer = gl_Layer[0];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    u_xlat7.xyz = (-vs_TEXCOORD0[2].xyz) + vs_TEXCOORD0[1].xyz;
					    u_xlat28 = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat28 = inversesqrt(u_xlat28);
					    u_xlat2.xyz = u_xlat7.xyz * vec3(u_xlat28) + (-u_xlat2.xyz);
					    u_xlat7.xyz = vec3(u_xlat28) * u_xlat7.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27) + (-u_xlat7.xyz);
					    u_xlat27 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(g_flCornerAdjust, g_flCornerAdjust, g_flCornerAdjust)) + vs_TEXCOORD1[1].xyz;
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    gl_Position = gl_in[1].gl_Position;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[1];
					    gl_Layer = gl_Layer[1];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    gl_Position.xy = u_xlat5.xy;
					    gl_Position.zw = u_xlat6.zw;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[0];
					    gl_Layer = gl_Layer[0];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat28 = dot(u_xlat4.xyz, u_xlat2.xyz);
					    u_xlat23.xy = vec2(u_xlat28) * unity_StereoMatrixP[(u_xlati30 + 1) / 4][(u_xlati30 + 1) % 4].xy;
					    u_xlat23.xy = unity_StereoMatrixP[u_xlati30 / 4][u_xlati30 % 4].xy * vec2(u_xlat27) + u_xlat23.xy;
					    u_xlat27 = dot(u_xlat23.xy, u_xlat23.xy);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat23.xy = vec2(u_xlat27) * u_xlat23.xy;
					    u_xlat7 = unity_ObjectToWorld[1] * vs_TEXCOORD0[1].yyyy;
					    u_xlat7 = unity_ObjectToWorld[0] * vs_TEXCOORD0[1].xxxx + u_xlat7;
					    u_xlat7 = unity_ObjectToWorld[2] * vs_TEXCOORD0[1].zzzz + u_xlat7;
					    u_xlat7 = u_xlat7 + unity_ObjectToWorld[3];
					    u_xlat8 = u_xlat7.yyyy * unity_StereoMatrixVP[(u_xlati30 + 1) / 4][(u_xlati30 + 1) % 4];
					    u_xlat8 = unity_StereoMatrixVP[u_xlati30 / 4][u_xlati30 % 4] * u_xlat7.xxxx + u_xlat8;
					    u_xlat8 = unity_StereoMatrixVP[(u_xlati30 + 2) / 4][(u_xlati30 + 2) % 4] * u_xlat7.zzzz + u_xlat8;
					    u_xlat7 = unity_StereoMatrixVP[(u_xlati30 + 3) / 4][(u_xlati30 + 3) % 4] * u_xlat7.wwww + u_xlat8;
					    u_xlat23.xy = u_xlat23.xy * u_xlat7.ww;
					    u_xlat23.xy = u_xlat23.xy * vec2(g_flOutlineWidth) + u_xlat7.xy;
					    gl_Position.xy = u_xlat23.xy;
					    gl_Position.zw = u_xlat7.zw;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[1];
					    gl_Layer = gl_Layer[1];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    gl_Position = gl_in[1].gl_Position;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[1];
					    gl_Layer = gl_Layer[1];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    gl_Position = gl_in[1].gl_Position;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[1];
					    gl_Layer = gl_Layer[1];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    gl_Position.xy = u_xlat23.xy;
					    gl_Position.zw = u_xlat7.zw;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[1];
					    gl_Layer = gl_Layer[1];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(g_flCornerAdjust, g_flCornerAdjust, g_flCornerAdjust)) + vs_TEXCOORD1[2].xyz;
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat28 = dot(u_xlat4.xyz, u_xlat0.xyz);
					    u_xlat3.xy = vec2(u_xlat28) * unity_StereoMatrixP[(u_xlati30 + 1) / 4][(u_xlati30 + 1) % 4].xy;
					    u_xlat3.xy = unity_StereoMatrixP[u_xlati30 / 4][u_xlati30 % 4].xy * vec2(u_xlat27) + u_xlat3.xy;
					    u_xlat27 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xy = vec2(u_xlat27) * u_xlat3.xy;
					    u_xlat4 = unity_ObjectToWorld[1] * vs_TEXCOORD0[2].yyyy;
					    u_xlat4 = unity_ObjectToWorld[0] * vs_TEXCOORD0[2].xxxx + u_xlat4;
					    u_xlat4 = unity_ObjectToWorld[2] * vs_TEXCOORD0[2].zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + unity_ObjectToWorld[3];
					    u_xlat7 = u_xlat4.yyyy * unity_StereoMatrixVP[(u_xlati30 + 1) / 4][(u_xlati30 + 1) % 4];
					    u_xlat7 = unity_StereoMatrixVP[u_xlati30 / 4][u_xlati30 % 4] * u_xlat4.xxxx + u_xlat7;
					    u_xlat7 = unity_StereoMatrixVP[(u_xlati30 + 2) / 4][(u_xlati30 + 2) % 4] * u_xlat4.zzzz + u_xlat7;
					    u_xlat4 = unity_StereoMatrixVP[(u_xlati30 + 3) / 4][(u_xlati30 + 3) % 4] * u_xlat4.wwww + u_xlat7;
					    u_xlat3.xy = u_xlat3.xy * u_xlat4.ww;
					    u_xlat3.xy = u_xlat3.xy * vec2(g_flOutlineWidth) + u_xlat4.xy;
					    gl_Position.xy = u_xlat3.xy;
					    gl_Position.zw = u_xlat4.zw;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[2];
					    gl_Layer = gl_Layer[2];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[1];
					    gs_TEXCOORD1.xyz = u_xlat2.xyz;
					    gl_Position = gl_in[1].gl_Position;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[1];
					    gl_Layer = gl_Layer[1];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    gl_Position.xy = u_xlat3.xy;
					    gl_Position.zw = u_xlat4.zw;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[2];
					    gl_Layer = gl_Layer[2];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    gl_Position = gl_in[2].gl_Position;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[2];
					    gl_Layer = gl_Layer[2];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    gl_Position = gl_in[2].gl_Position;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[2];
					    gl_Layer = gl_Layer[2];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    gl_Position.xy = u_xlat3.xy;
					    gl_Position.zw = u_xlat4.zw;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[2];
					    gl_Layer = gl_Layer[2];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    gl_Position = gl_in[0].gl_Position;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[0];
					    gl_Layer = gl_Layer[0];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[2];
					    gs_TEXCOORD1.xyz = u_xlat0.xyz;
					    gl_Position.xy = u_xlat3.xy;
					    gl_Position.zw = u_xlat4.zw;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[2];
					    gl_Layer = gl_Layer[2];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    gl_Position.xy = u_xlat5.xy;
					    gl_Position.zw = u_xlat6.zw;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[0];
					    gl_Layer = gl_Layer[0];
					    EmitVertex();
					    gs_TEXCOORD0 = vs_TEXCOORD0[0];
					    gs_TEXCOORD1.xyz = u_xlat1.xyz;
					    gl_Position = gl_in[0].gl_Position;
					    gs_SV_InstanceID0 = vs_SV_InstanceID0[0];
					    gl_Layer = gl_Layer[0];
					    EmitVertex();
					    return;
					}"
				}
			}
		}
	}
}