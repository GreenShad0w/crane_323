using UnityEngine;
using System.Collections.Generic;

namespace UnityEngine.XR.Management
{
	public class XRManagerSettings : ScriptableObject
	{
		[SerializeField]
		private bool m_RequiresSettingsUpdate;
		[SerializeField]
		private bool m_AutomaticLoading;
		[SerializeField]
		private bool m_AutomaticRunning;
		[SerializeField]
		private List<XRLoader> m_Loaders;
	}
}
