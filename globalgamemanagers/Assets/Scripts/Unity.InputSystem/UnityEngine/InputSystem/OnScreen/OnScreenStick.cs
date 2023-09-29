using UnityEngine;

namespace UnityEngine.InputSystem.OnScreen
{
	public class OnScreenStick : OnScreenControl
	{
		[SerializeField]
		private float m_MovementRange;
		[SerializeField]
		private string m_ControlPath;
	}
}
