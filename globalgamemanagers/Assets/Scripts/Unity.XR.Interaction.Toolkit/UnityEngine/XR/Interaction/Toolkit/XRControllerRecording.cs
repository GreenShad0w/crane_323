using System;
using UnityEngine;
using System.Collections.Generic;

namespace UnityEngine.XR.Interaction.Toolkit
{
	[Serializable]
	public class XRControllerRecording : ScriptableObject
	{
		[SerializeField]
		private List<XRControllerState> m_Frames;
	}
}
