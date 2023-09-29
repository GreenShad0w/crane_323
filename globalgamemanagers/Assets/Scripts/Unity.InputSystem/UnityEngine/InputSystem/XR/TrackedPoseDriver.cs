using System;
using UnityEngine;
using UnityEngine.InputSystem;

namespace UnityEngine.InputSystem.XR
{
	[Serializable]
	public class TrackedPoseDriver : MonoBehaviour
	{
		public enum TrackingType
		{
			RotationAndPosition = 0,
			RotationOnly = 1,
			PositionOnly = 2,
		}

		public enum UpdateType
		{
			UpdateAndBeforeRender = 0,
			Update = 1,
			BeforeRender = 2,
		}

		[SerializeField]
		private TrackingType m_TrackingType;
		[SerializeField]
		private UpdateType m_UpdateType;
		[SerializeField]
		private InputAction m_PositionAction;
		[SerializeField]
		private InputAction m_RotationAction;
	}
}
