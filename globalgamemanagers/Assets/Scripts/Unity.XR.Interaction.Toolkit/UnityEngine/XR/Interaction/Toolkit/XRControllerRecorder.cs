using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRControllerRecorder : MonoBehaviour
	{
		[SerializeField]
		private bool m_PlayOnStart;
		[SerializeField]
		private XRControllerRecording m_Recording;
		[SerializeField]
		private XRBaseController m_XRController;
	}
}
