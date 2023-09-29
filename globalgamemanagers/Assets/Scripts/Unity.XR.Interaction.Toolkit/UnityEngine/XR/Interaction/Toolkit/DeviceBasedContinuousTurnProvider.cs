using UnityEngine;
using System.Collections.Generic;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class DeviceBasedContinuousTurnProvider : ContinuousTurnProviderBase
	{
		public enum InputAxes
		{
			Primary2DAxis = 0,
			Secondary2DAxis = 1,
		}

		[SerializeField]
		private InputAxes m_InputBinding;
		[SerializeField]
		private List<XRBaseController> m_Controllers;
		[SerializeField]
		private float m_DeadzoneMin;
		[SerializeField]
		private float m_DeadzoneMax;
	}
}
