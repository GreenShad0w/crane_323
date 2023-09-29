using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class CharacterControllerDriver : MonoBehaviour
	{
		[SerializeField]
		private LocomotionProvider m_LocomotionProvider;
		[SerializeField]
		private float m_MinHeight;
		[SerializeField]
		private float m_MaxHeight;
	}
}
