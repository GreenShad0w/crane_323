using UnityEngine;

namespace UnityEngine.InputSystem
{
	public class InputSettings : ScriptableObject
	{
		public enum UpdateMode
		{
			ProcessEventsInDynamicUpdate = 1,
			ProcessEventsInFixedUpdate = 2,
			ProcessEventsManually = 3,
		}

		[SerializeField]
		private string[] m_SupportedDevices;
		[SerializeField]
		private UpdateMode m_UpdateMode;
		[SerializeField]
		private bool m_CompensateForScreenOrientation;
		[SerializeField]
		private bool m_FilterNoiseOnCurrent;
		[SerializeField]
		private float m_DefaultDeadzoneMin;
		[SerializeField]
		private float m_DefaultDeadzoneMax;
		[SerializeField]
		private float m_DefaultButtonPressPoint;
		[SerializeField]
		private float m_DefaultTapTime;
		[SerializeField]
		private float m_DefaultSlowTapTime;
		[SerializeField]
		private float m_DefaultHoldTime;
		[SerializeField]
		private float m_TapRadius;
		[SerializeField]
		private float m_MultiTapDelayTime;
	}
}
