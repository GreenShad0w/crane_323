using UnityEngine.InputSystem;
using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class ActionBasedSnapTurnProvider : SnapTurnProviderBase
	{
		[SerializeField]
		private InputActionProperty m_LeftHandSnapTurnAction;
		[SerializeField]
		private InputActionProperty m_RightHandSnapTurnAction;
	}
}
