using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRRayInteractor : XRBaseControllerInteractor
	{
		public enum LineType
		{
			StraightLine = 0,
			ProjectileCurve = 1,
			BezierCurve = 2,
		}

		public enum HitDetectionType
		{
			Raycast = 0,
			SphereCast = 1,
		}

		[SerializeField]
		private LineType m_LineType;
		[SerializeField]
		private float m_MaxRaycastDistance;
		[SerializeField]
		private Transform m_ReferenceFrame;
		[SerializeField]
		private float m_Velocity;
		[SerializeField]
		private float m_Acceleration;
		[SerializeField]
		private float m_AdditionalFlightTime;
		[SerializeField]
		private float m_EndPointDistance;
		[SerializeField]
		private float m_EndPointHeight;
		[SerializeField]
		private float m_ControlPointDistance;
		[SerializeField]
		private float m_ControlPointHeight;
		[SerializeField]
		private int m_SampleFrequency;
		[SerializeField]
		private HitDetectionType m_HitDetectionType;
		[SerializeField]
		private float m_SphereCastRadius;
		[SerializeField]
		private LayerMask m_RaycastMask;
		[SerializeField]
		private QueryTriggerInteraction m_RaycastTriggerInteraction;
		[SerializeField]
		private bool m_KeepSelectedTargetValid;
		[SerializeField]
		private bool m_HoverToSelect;
		[SerializeField]
		private float m_HoverTimeToSelect;
		[SerializeField]
		private bool m_EnableUIInteraction;
		[SerializeField]
		private bool m_AllowAnchorControl;
		[SerializeField]
		private bool m_UseForceGrab;
		[SerializeField]
		private float m_RotateSpeed;
		[SerializeField]
		private float m_TranslateSpeed;
	}
}
