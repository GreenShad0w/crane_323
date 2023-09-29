using UnityEngine;
using UnityEngine.XR;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRRig : MonoBehaviour
	{
		[SerializeField]
		private GameObject m_RigBaseGameObject;
		[SerializeField]
		private GameObject m_CameraFloorOffsetObject;
		[SerializeField]
		private GameObject m_CameraGameObject;
		[SerializeField]
		private TrackingOriginModeFlags m_TrackingOriginMode;
		[SerializeField]
		private TrackingSpaceType m_TrackingSpace;
		[SerializeField]
		private float m_CameraYOffset;
	}
}
