using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRInteractorLineVisual : MonoBehaviour
	{
		[SerializeField]
		private float m_LineWidth;
		[SerializeField]
		private bool m_OverrideInteractorLineLength;
		[SerializeField]
		private float m_LineLength;
		[SerializeField]
		private AnimationCurve m_WidthCurve;
		[SerializeField]
		private Gradient m_ValidColorGradient;
		[SerializeField]
		private Gradient m_InvalidColorGradient;
		[SerializeField]
		private bool m_SmoothMovement;
		[SerializeField]
		private float m_FollowTightness;
		[SerializeField]
		private float m_SnapThresholdDistance;
		[SerializeField]
		private GameObject m_Reticle;
		[SerializeField]
		private bool m_StopLineAtFirstRaycastHit;
	}
}
