using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class SnapTurnProviderBase : LocomotionProvider
	{
		[SerializeField]
		private float m_TurnAmount;
		[SerializeField]
		private float m_DebounceTime;
		[SerializeField]
		private bool m_EnableTurnLeftRight;
		[SerializeField]
		private bool m_EnableTurnAround;
	}
}
