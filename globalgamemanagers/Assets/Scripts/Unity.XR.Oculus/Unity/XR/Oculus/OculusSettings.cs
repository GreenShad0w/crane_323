using System;
using UnityEngine;

namespace Unity.XR.Oculus
{
	[Serializable]
	public class OculusSettings : ScriptableObject
	{
		public enum StereoRenderingModeDesktop
		{
			MultiPass = 0,
			SinglePassInstanced = 1,
		}

		public enum StereoRenderingModeAndroid
		{
			MultiPass = 0,
			Multiview = 2,
		}

		[SerializeField]
		public StereoRenderingModeDesktop m_StereoRenderingModeDesktop;
		[SerializeField]
		public StereoRenderingModeAndroid m_StereoRenderingModeAndroid;
		[SerializeField]
		public bool SharedDepthBuffer;
		[SerializeField]
		public bool DashSupport;
		[SerializeField]
		public bool V2Signing;
	}
}
