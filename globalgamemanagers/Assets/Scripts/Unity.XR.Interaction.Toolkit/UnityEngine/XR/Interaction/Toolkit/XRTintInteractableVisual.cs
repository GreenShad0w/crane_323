using UnityEngine;
using System.Collections.Generic;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRTintInteractableVisual : MonoBehaviour
	{
		[SerializeField]
		private Color m_TintColor;
		[SerializeField]
		private bool m_TintOnHover;
		[SerializeField]
		private bool m_TintOnSelection;
		[SerializeField]
		private List<Renderer> m_TintRenderers;
	}
}
