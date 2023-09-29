using UnityEngine;
using System.Collections.Generic;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class DeviceBasedSnapTurnProvider : SnapTurnProviderBase
	{
		public enum InputAxes
		{
			Primary2DAxis = 0,
			Secondary2DAxis = 1,
		}

		[SerializeField]
		private InputAxes m_TurnUsage;
		[SerializeField]
		private List<XRBaseController> m_Controllers;
		[SerializeField]
		private float m_DeadZone;
	}
}
