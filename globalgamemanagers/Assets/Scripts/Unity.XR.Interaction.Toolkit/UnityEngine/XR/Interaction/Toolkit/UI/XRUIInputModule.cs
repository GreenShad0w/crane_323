using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit.UI
{
	public class XRUIInputModule : UIInputModule
	{
		[SerializeField]
		private float m_MaxTrackedDeviceRaycastDistance;
		[SerializeField]
		private bool m_EnableXRInput;
		[SerializeField]
		private bool m_EnableMouseInput;
		[SerializeField]
		private bool m_EnableTouchInput;
	}
}
