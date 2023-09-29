using UnityEngine;
using System;
using UnityEngine.Events;
using UnityEngine.InputSystem.UI;

namespace UnityEngine.InputSystem
{
	public class PlayerInput : MonoBehaviour
	{
		[Serializable]
		public class DeviceLostEvent : UnityEvent<PlayerInput>
		{
		}

		[Serializable]
		public class DeviceRegainedEvent : UnityEvent<PlayerInput>
		{
		}

		[Serializable]
		public class ControlsChangedEvent : UnityEvent<PlayerInput>
		{
		}

		[Serializable]
		public class ActionEvent : UnityEvent<InputAction.CallbackContext>
		{
			[SerializeField]
			private string m_ActionId;
			[SerializeField]
			private string m_ActionName;
		}

		[SerializeField]
		internal InputActionAsset m_Actions;
		[SerializeField]
		internal PlayerNotifications m_NotificationBehavior;
		[SerializeField]
		internal InputSystemUIInputModule m_UIInputModule;
		[SerializeField]
		internal DeviceLostEvent m_DeviceLostEvent;
		[SerializeField]
		internal DeviceRegainedEvent m_DeviceRegainedEvent;
		[SerializeField]
		internal ControlsChangedEvent m_ControlsChangedEvent;
		[SerializeField]
		internal ActionEvent[] m_ActionEvents;
		[SerializeField]
		internal bool m_NeverAutoSwitchControlSchemes;
		[SerializeField]
		internal string m_DefaultControlScheme;
		[SerializeField]
		internal string m_DefaultActionMap;
		[SerializeField]
		internal int m_SplitScreenIndex;
		[SerializeField]
		internal Camera m_Camera;
	}
}
