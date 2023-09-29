using UnityEngine.EventSystems;
using UnityEngine;
using UnityEngine.InputSystem;

namespace UnityEngine.InputSystem.UI
{
	public class InputSystemUIInputModule : BaseInputModule
	{
		public override void Process()
		{
		}

		[SerializeField]
		private float m_MoveRepeatDelay;
		[SerializeField]
		private float m_MoveRepeatRate;
		[SerializeField]
		private InputActionAsset m_ActionsAsset;
		[SerializeField]
		private InputActionReference m_PointAction;
		[SerializeField]
		private InputActionReference m_MoveAction;
		[SerializeField]
		private InputActionReference m_SubmitAction;
		[SerializeField]
		private InputActionReference m_CancelAction;
		[SerializeField]
		private InputActionReference m_LeftClickAction;
		[SerializeField]
		private InputActionReference m_MiddleClickAction;
		[SerializeField]
		private InputActionReference m_RightClickAction;
		[SerializeField]
		private InputActionReference m_ScrollWheelAction;
		[SerializeField]
		private InputActionReference m_TrackedDevicePositionAction;
		[SerializeField]
		private InputActionReference m_TrackedDeviceOrientationAction;
		[SerializeField]
		private bool m_DeselectOnBackgroundClick;
		[SerializeField]
		private UIPointerBehavior m_PointerBehavior;
	}
}
