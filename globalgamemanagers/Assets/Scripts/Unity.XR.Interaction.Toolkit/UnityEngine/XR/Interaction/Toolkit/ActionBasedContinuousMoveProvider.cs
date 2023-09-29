using UnityEngine.InputSystem;
using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class ActionBasedContinuousMoveProvider : ContinuousMoveProviderBase
	{
		[SerializeField]
		private InputActionProperty m_LeftHandMoveAction;
		[SerializeField]
		private InputActionProperty m_RightHandMoveAction;
	}
}
