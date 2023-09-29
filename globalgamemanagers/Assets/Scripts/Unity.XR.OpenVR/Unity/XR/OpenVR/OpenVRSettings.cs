using System;
using UnityEngine;

namespace Unity.XR.OpenVR
{
	[Serializable]
	public class OpenVRSettings : ScriptableObject
	{
		public enum StereoRenderingModes
		{
			MultiPass = 0,
			SinglePassInstanced = 1,
		}

		public enum InitializationTypes
		{
			Scene = 1,
			Overlay = 2,
		}

		public enum MirrorViewModes
		{
			None = 0,
			Left = 1,
			Right = 2,
			OpenVR = 3,
		}

		[SerializeField]
		public bool PromptToUpgradePackage;
		[SerializeField]
		public bool PromptToUpgradePreviewPackages;
		[SerializeField]
		public string SkipPromptForVersion;
		[SerializeField]
		public StereoRenderingModes StereoRenderingMode;
		[SerializeField]
		public InitializationTypes InitializationType;
		[SerializeField]
		public string EditorAppKey;
		[SerializeField]
		public string ActionManifestFileRelativeFilePath;
		[SerializeField]
		public MirrorViewModes MirrorView;
		[SerializeField]
		public bool HasCopiedDefaults;
	}
}
