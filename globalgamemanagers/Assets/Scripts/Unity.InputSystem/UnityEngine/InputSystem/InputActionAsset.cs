using UnityEngine;

namespace UnityEngine.InputSystem
{
	public class InputActionAsset : ScriptableObject
	{
		[SerializeField]
		internal InputActionMap[] m_ActionMaps;
		[SerializeField]
		internal InputControlScheme[] m_ControlSchemes;
	}
}
