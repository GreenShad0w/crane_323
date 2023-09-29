using System;
using UnityEngine;

namespace UnityEngine.InputSystem
{
	[Serializable]
	internal class RemoteInputPlayerConnection : ScriptableObject
	{
		[SerializeField]
		private int[] m_ConnectedIds;
	}
}
