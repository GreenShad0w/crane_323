using System;
using UnityEngine;

namespace UnityEngine.InputSystem.LowLevel
{
	[Serializable]
	public class InputEventTrace
	{
		[Serializable]
		public struct DeviceInfo
		{
			[SerializeField]
			internal int m_DeviceId;
			[SerializeField]
			internal string m_Layout;
			[SerializeField]
			internal int m_StateSizeInBytes;
			[SerializeField]
			internal string m_FullLayoutJson;
		}

		public InputEventTrace(long bufferSizeInBytes, bool growBuffer, long maxBufferSizeInBytes, long growIncrementSizeInBytes)
		{
		}

		[SerializeField]
		private int m_DeviceId;
		[SerializeField]
		private long m_EventBufferSize;
		[SerializeField]
		private long m_MaxEventBufferSize;
		[SerializeField]
		private long m_GrowIncrementSize;
		[SerializeField]
		private long m_EventCount;
		[SerializeField]
		private long m_EventSizeInBytes;
		[SerializeField]
		private ulong m_EventBufferStorage;
		[SerializeField]
		private ulong m_EventBufferHeadStorage;
		[SerializeField]
		private ulong m_EventBufferTailStorage;
		[SerializeField]
		private bool m_HasWrapped;
		[SerializeField]
		private bool m_RecordFrameMarkers;
		[SerializeField]
		private DeviceInfo[] m_DeviceInfos;
	}
}
