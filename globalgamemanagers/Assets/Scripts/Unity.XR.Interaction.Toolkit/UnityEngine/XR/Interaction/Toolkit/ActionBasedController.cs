using UnityEngine.InputSystem;
using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class ActionBasedController : XRBaseController
	{
		[SerializeField]
		private InputActionProperty m_PositionAction;
		[SerializeField]
		private InputActionProperty m_RotationAction;
		[SerializeField]
		private InputActionProperty m_SelectAction;
		[SerializeField]
		private InputActionProperty m_ActivateAction;
		[SerializeField]
		private InputActionProperty m_UIPressAction;
		[SerializeField]
		private InputActionProperty m_HapticDeviceAction;
		[SerializeField]
		private InputActionProperty m_RotateAnchorAction;
		[SerializeField]
		private InputActionProperty m_TranslateAnchorAction;
		[SerializeField]
		private float m_ButtonPressPoint;
	}
}
