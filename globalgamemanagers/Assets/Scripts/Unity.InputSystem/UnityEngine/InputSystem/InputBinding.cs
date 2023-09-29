using System;
using UnityEngine;

namespace UnityEngine.InputSystem
{
	[Serializable]
	public struct InputBinding
	{
		internal enum Flags
		{
			None = 0,
			Composite = 4,
			PartOfComposite = 8,
		}

		public InputBinding(string path, string action, string groups, string processors, string interactions, string name) : this()
		{
		}

		[SerializeField]
		private string m_Name;
		[SerializeField]
		internal string m_Id;
		[SerializeField]
		private string m_Path;
		[SerializeField]
		private string m_Interactions;
		[SerializeField]
		private string m_Processors;
		[SerializeField]
		private string m_Groups;
		[SerializeField]
		private string m_Action;
		[SerializeField]
		internal Flags m_Flags;
	}
}
