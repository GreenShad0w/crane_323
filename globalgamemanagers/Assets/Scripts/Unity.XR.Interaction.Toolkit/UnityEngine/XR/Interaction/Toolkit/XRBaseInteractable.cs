using UnityEngine;
using System.Collections.Generic;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRBaseInteractable : MonoBehaviour
	{
		public enum MovementType
		{
			VelocityTracking = 0,
			Kinematic = 1,
			Instantaneous = 2,
		}

		[SerializeField]
		private XRInteractionManager m_InteractionManager;
		[SerializeField]
		private List<Collider> m_Colliders;
		[SerializeField]
		private LayerMask m_InteractionLayerMask;
		[SerializeField]
		private XRInteractableEvent m_OnFirstHoverEntered;
		[SerializeField]
		private XRInteractableEvent m_OnHoverEntered;
		[SerializeField]
		private XRInteractableEvent m_OnHoverExited;
		[SerializeField]
		private XRInteractableEvent m_OnLastHoverExited;
		[SerializeField]
		private XRInteractableEvent m_OnSelectEntered;
		[SerializeField]
		private XRInteractableEvent m_OnSelectExited;
		[SerializeField]
		private XRInteractableEvent m_OnSelectCanceled;
		[SerializeField]
		private XRInteractableEvent m_OnActivate;
		[SerializeField]
		private XRInteractableEvent m_OnDeactivate;
		[SerializeField]
		private GameObject m_CustomReticle;
	}
}
