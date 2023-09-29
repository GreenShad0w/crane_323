using UnityEngine.InputSystem;
using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class ActionBasedContinuousTurnProvider : ContinuousTurnProviderBase
	{
		[SerializeField]
		private InputActionProperty m_LeftHandTurnAction;
		[SerializeField]
		private InputActionProperty m_RightHandTurnAction;
	}
}
