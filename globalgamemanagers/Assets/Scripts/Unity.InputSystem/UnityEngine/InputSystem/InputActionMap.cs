using System;
using UnityEngine;

namespace UnityEngine.InputSystem
{
	[Serializable]
	public class InputActionMap
	{
		[SerializeField]
		internal string m_Name;
		[SerializeField]
		internal string m_Id;
		[SerializeField]
		internal InputActionAsset m_Asset;
		[SerializeField]
		internal InputAction[] m_Actions;
		[SerializeField]
		internal InputBinding[] m_Bindings;
	}
}
