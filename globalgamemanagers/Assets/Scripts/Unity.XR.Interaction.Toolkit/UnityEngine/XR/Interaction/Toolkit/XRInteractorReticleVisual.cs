using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRInteractorReticleVisual : MonoBehaviour
	{
		[SerializeField]
		private float m_MaxRaycastDistance;
		[SerializeField]
		private GameObject m_ReticlePrefab;
		[SerializeField]
		private float m_PrefabScalingFactor;
		[SerializeField]
		private bool m_UndoDistanceScaling;
		[SerializeField]
		private bool m_AlignPrefabWithSurfaceNormal;
		[SerializeField]
		private float m_EndpointSmoothingTime;
		[SerializeField]
		private bool m_DrawWhileSelecting;
		[SerializeField]
		private LayerMask m_RaycastMask;
	}
}
