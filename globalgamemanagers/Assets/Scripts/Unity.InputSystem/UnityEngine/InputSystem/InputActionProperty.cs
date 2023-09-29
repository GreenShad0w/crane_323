using System;
using UnityEngine;

namespace UnityEngine.InputSystem
{
	[Serializable]
	public struct InputActionProperty
	{
		public InputActionProperty(InputAction action) : this()
		{
		}

		[SerializeField]
		private bool m_UseReference;
		[SerializeField]
		private InputAction m_Action;
		[SerializeField]
		private InputActionReference m_Reference;
	}
}
