using UnityEngine;
using System.Collections.Generic;

namespace UnityEngine.Formats.Fbx.Exporter
{
	internal class FbxPrefab : MonoBehaviour
	{
		[SerializeField]
		private string m_fbxHistory;
		[SerializeField]
		private List<StringPair> m_nameMapping;
		[SerializeField]
		private GameObject m_fbxModel;
		[SerializeField]
		private bool m_autoUpdate;
	}
}
