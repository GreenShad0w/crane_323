using UnityEngine.XR;
using UnityEngine;
using UnityEngine.Experimental.XR.Interaction;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRController : XRBaseController
	{
		[SerializeField]
		private XRNode m_ControllerNode;
		[SerializeField]
		private InputHelpers.Button m_SelectUsage;
		[SerializeField]
		private InputHelpers.Button m_ActivateUsage;
		[SerializeField]
		private InputHelpers.Button m_UIPressUsage;
		[SerializeField]
		private float m_AxisToPressThreshold;
		[SerializeField]
		private InputHelpers.Button m_RotateAnchorLeft;
		[SerializeField]
		private InputHelpers.Button m_RotateAnchorRight;
		[SerializeField]
		private InputHelpers.Button m_MoveObjectIn;
		[SerializeField]
		private InputHelpers.Button m_MoveObjectOut;
		[SerializeField]
		private BasePoseProvider m_PoseProvider;
	}
}
