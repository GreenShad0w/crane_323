using UnityEngine;

namespace UnityEngine.InputSystem
{
	public class InputActionReference : ScriptableObject
	{
		[SerializeField]
		internal InputActionAsset m_Asset;
		[SerializeField]
		internal string m_ActionId;
	}
}
