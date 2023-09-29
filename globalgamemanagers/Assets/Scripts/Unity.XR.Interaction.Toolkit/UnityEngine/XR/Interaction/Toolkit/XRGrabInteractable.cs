using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRGrabInteractable : XRBaseInteractable
	{
		[SerializeField]
		private Transform m_AttachTransform;
		[SerializeField]
		private float m_AttachEaseInTime;
		[SerializeField]
		private XRBaseInteractable.MovementType m_MovementType;
		[SerializeField]
		private bool m_TrackPosition;
		[SerializeField]
		private bool m_SmoothPosition;
		[SerializeField]
		private float m_SmoothPositionAmount;
		[SerializeField]
		private float m_TightenPosition;
		[SerializeField]
		private bool m_TrackRotation;
		[SerializeField]
		private bool m_SmoothRotation;
		[SerializeField]
		private float m_SmoothRotationAmount;
		[SerializeField]
		private float m_TightenRotation;
		[SerializeField]
		private bool m_ThrowOnDetach;
		[SerializeField]
		private float m_ThrowSmoothingDuration;
		[SerializeField]
		private AnimationCurve m_ThrowSmoothingCurve;
		[SerializeField]
		private float m_ThrowVelocityScale;
		[SerializeField]
		private float m_ThrowAngularVelocityScale;
		[SerializeField]
		private bool m_GravityOnDetach;
		[SerializeField]
		private bool m_RetainTransformParent;
	}
}
