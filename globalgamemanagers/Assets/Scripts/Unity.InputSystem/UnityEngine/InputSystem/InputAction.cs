using System;
using UnityEngine;

namespace UnityEngine.InputSystem
{
	[Serializable]
	public class InputAction
	{
		public struct CallbackContext
		{
		}

		[SerializeField]
		internal string m_Name;
		[SerializeField]
		internal InputActionType m_Type;
		[SerializeField]
		internal string m_ExpectedControlType;
		[SerializeField]
		internal string m_Id;
		[SerializeField]
		internal string m_Processors;
		[SerializeField]
		internal string m_Interactions;
		[SerializeField]
		internal InputBinding[] m_SingletonActionBindings;
	}
}
