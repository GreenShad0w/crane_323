using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRBaseInteractor : MonoBehaviour
	{
		[SerializeField]
		private XRInteractionManager m_InteractionManager;
		[SerializeField]
		private LayerMask m_InteractionLayerMask;
		[SerializeField]
		private Transform m_AttachTransform;
		[SerializeField]
		private XRBaseInteractable m_StartingSelectedInteractable;
		[SerializeField]
		private XRInteractorEvent m_OnHoverEntered;
		[SerializeField]
		private XRInteractorEvent m_OnHoverExited;
		[SerializeField]
		private XRInteractorEvent m_OnSelectEntered;
		[SerializeField]
		private XRInteractorEvent m_OnSelectExited;
	}
}
