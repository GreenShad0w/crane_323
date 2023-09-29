using System;
using UnityEngine;
using System.Collections.Generic;

namespace UnityEngine.InputSystem
{
	[Serializable]
	public struct InputControlScheme
	{
		[Serializable]
		public struct DeviceRequirement
		{
			internal enum Flags
			{
				None = 0,
				Optional = 1,
				Or = 2,
			}

			[SerializeField]
			internal string m_ControlPath;
			[SerializeField]
			internal Flags m_Flags;
		}

		public InputControlScheme(string name, IEnumerable<InputControlScheme.DeviceRequirement> devices, string bindingGroup) : this()
		{
		}

		[SerializeField]
		internal string m_Name;
		[SerializeField]
		internal string m_BindingGroup;
		[SerializeField]
		internal DeviceRequirement[] m_DeviceRequirements;
	}
}
