using UnityEngine.EventSystems;
using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit.UI
{
	public class UIInputModule : BaseInputModule
	{
		public override void Process()
		{
		}

		[SerializeField]
		private float m_ClickSpeed;
		[SerializeField]
		private float m_MoveDeadzone;
		[SerializeField]
		private float m_RepeatDelay;
		[SerializeField]
		private float m_RepeatRate;
		[SerializeField]
		private float m_TrackedDeviceDragThresholdMultiplier;
	}
}
