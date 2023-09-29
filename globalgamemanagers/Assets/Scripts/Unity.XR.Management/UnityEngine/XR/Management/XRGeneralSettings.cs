using UnityEngine;

namespace UnityEngine.XR.Management
{
	public class XRGeneralSettings : ScriptableObject
	{
		[SerializeField]
		internal XRManagerSettings m_LoaderManagerInstance;
		[SerializeField]
		internal bool m_InitManagerOnStart;
	}
}
