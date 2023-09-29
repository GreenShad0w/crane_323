using UnityEngine;
using UnityEngine.InputSystem;

namespace UnityEngine.XR.Interaction.Toolkit.Inputs.Simulation
{
	public class XRDeviceSimulator : MonoBehaviour
	{
		public enum Space
		{
			Local = 0,
			Parent = 1,
			Screen = 2,
		}

		[SerializeField]
		private InputActionReference m_KeyboardXTranslateAction;
		[SerializeField]
		private InputActionReference m_KeyboardYTranslateAction;
		[SerializeField]
		private InputActionReference m_KeyboardZTranslateAction;
		[SerializeField]
		private InputActionReference m_ManipulateLeftAction;
		[SerializeField]
		private InputActionReference m_ManipulateRightAction;
		[SerializeField]
		private InputActionReference m_ToggleManipulateLeftAction;
		[SerializeField]
		private InputActionReference m_ToggleManipulateRightAction;
		[SerializeField]
		private InputActionReference m_ManipulateHeadAction;
		[SerializeField]
		private InputActionReference m_MouseDeltaAction;
		[SerializeField]
		private InputActionReference m_MouseScrollAction;
		[SerializeField]
		private InputActionReference m_RotateModeOverrideAction;
		[SerializeField]
		private InputActionReference m_ToggleMouseTransformationModeAction;
		[SerializeField]
		private InputActionReference m_NegateModeAction;
		[SerializeField]
		private InputActionReference m_XConstraintAction;
		[SerializeField]
		private InputActionReference m_YConstraintAction;
		[SerializeField]
		private InputActionReference m_ZConstraintAction;
		[SerializeField]
		private InputActionReference m_ResetAction;
		[SerializeField]
		private InputActionReference m_ToggleCursorLockAction;
		[SerializeField]
		private InputActionReference m_ToggleDevicePositionTargetAction;
		[SerializeField]
		private InputActionReference m_TogglePrimary2DAxisTargetAction;
		[SerializeField]
		private InputActionReference m_ToggleSecondary2DAxisTargetAction;
		[SerializeField]
		private InputActionReference m_Axis2DAction;
		[SerializeField]
		private InputActionReference m_RestingHandAxis2DAction;
		[SerializeField]
		private InputActionReference m_GripAction;
		[SerializeField]
		private InputActionReference m_TriggerAction;
		[SerializeField]
		private InputActionReference m_PrimaryButtonAction;
		[SerializeField]
		private InputActionReference m_SecondaryButtonAction;
		[SerializeField]
		private InputActionReference m_MenuAction;
		[SerializeField]
		private InputActionReference m_Primary2DAxisClickAction;
		[SerializeField]
		private InputActionReference m_Secondary2DAxisClickAction;
		[SerializeField]
		private InputActionReference m_Primary2DAxisTouchAction;
		[SerializeField]
		private InputActionReference m_Secondary2DAxisTouchAction;
		[SerializeField]
		private InputActionReference m_PrimaryTouchAction;
		[SerializeField]
		private InputActionReference m_SecondaryTouchAction;
		[SerializeField]
		private Transform m_CameraTransform;
		[SerializeField]
		private Space m_KeyboardTranslateSpace;
		[SerializeField]
		private Space m_MouseTranslateSpace;
		[SerializeField]
		private float m_KeyboardXTranslateSpeed;
		[SerializeField]
		private float m_KeyboardYTranslateSpeed;
		[SerializeField]
		private float m_KeyboardZTranslateSpeed;
		[SerializeField]
		private float m_MouseXTranslateSensitivity;
		[SerializeField]
		private float m_MouseYTranslateSensitivity;
		[SerializeField]
		private float m_MouseScrollTranslateSensitivity;
		[SerializeField]
		private float m_MouseXRotateSensitivity;
		[SerializeField]
		private float m_MouseYRotateSensitivity;
		[SerializeField]
		private float m_MouseScrollRotateSensitivity;
		[SerializeField]
		private bool m_MouseYRotateInvert;
		[SerializeField]
		private CursorLockMode m_DesiredCursorLockMode;
	}
}
