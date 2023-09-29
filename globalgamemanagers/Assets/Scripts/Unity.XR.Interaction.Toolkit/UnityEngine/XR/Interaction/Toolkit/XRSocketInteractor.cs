using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRSocketInteractor : XRBaseInteractor
	{
		[SerializeField]
		private bool m_ShowInteractableHoverMeshes;
		[SerializeField]
		private Material m_InteractableHoverMeshMaterial;
		[SerializeField]
		private Material m_InteractableCantHoverMeshMaterial;
		[SerializeField]
		private bool m_SocketActive;
		[SerializeField]
		private float m_InteractableHoverScale;
		[SerializeField]
		private float m_RecycleDelayTime;
	}
}
