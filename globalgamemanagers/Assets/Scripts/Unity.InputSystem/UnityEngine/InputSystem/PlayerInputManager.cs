using UnityEngine;
using System;
using UnityEngine.Events;

namespace UnityEngine.InputSystem
{
	public class PlayerInputManager : MonoBehaviour
	{
		[Serializable]
		public class PlayerJoinedEvent : UnityEvent<PlayerInput>
		{
		}

		[Serializable]
		public class PlayerLeftEvent : UnityEvent<PlayerInput>
		{
		}

		[SerializeField]
		internal PlayerNotifications m_NotificationBehavior;
		[SerializeField]
		internal int m_MaxPlayerCount;
		[SerializeField]
		internal bool m_AllowJoining;
		[SerializeField]
		internal PlayerJoinBehavior m_JoinBehavior;
		[SerializeField]
		internal PlayerJoinedEvent m_PlayerJoinedEvent;
		[SerializeField]
		internal PlayerLeftEvent m_PlayerLeftEvent;
		[SerializeField]
		internal InputActionProperty m_JoinAction;
		[SerializeField]
		internal GameObject m_PlayerPrefab;
		[SerializeField]
		internal bool m_SplitScreen;
		[SerializeField]
		internal bool m_MaintainAspectRatioInSplitScreen;
		[SerializeField]
		internal int m_FixedNumberOfSplitScreens;
		[SerializeField]
		internal Rect m_SplitScreenRect;
	}
}
