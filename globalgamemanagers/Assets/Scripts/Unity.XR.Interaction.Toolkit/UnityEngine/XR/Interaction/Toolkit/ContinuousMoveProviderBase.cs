using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class ContinuousMoveProviderBase : LocomotionProvider
	{
		public enum GravityApplicationMode
		{
			AttemptingMove = 0,
			Immediately = 1,
		}

		[SerializeField]
		private float m_MoveSpeed;
		[SerializeField]
		private bool m_EnableStrafe;
		[SerializeField]
		private bool m_UseGravity;
		[SerializeField]
		private GravityApplicationMode m_GravityApplicationMode;
		[SerializeField]
		private Transform m_ForwardSource;
	}
}
