using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRBaseController : MonoBehaviour
	{
		public enum UpdateType
		{
			UpdateAndBeforeRender = 0,
			Update = 1,
			BeforeRender = 2,
		}

		[SerializeField]
		private UpdateType m_UpdateTrackingType;
		[SerializeField]
		private bool m_EnableInputTracking;
		[SerializeField]
		private bool m_EnableInputActions;
		[SerializeField]
		private Transform m_ModelPrefab;
		[SerializeField]
		private Transform m_ModelTransform;
		[SerializeField]
		private bool m_AnimateModel;
		[SerializeField]
		private string m_ModelSelectTransition;
		[SerializeField]
		private string m_ModelDeSelectTransition;
		[SerializeField]
		private float m_AnchorControlDeadzone;
		[SerializeField]
		private float m_AnchorControlOffAxisDeadzone;
	}
}
