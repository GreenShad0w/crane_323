using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class BaseTeleportationInteractable : XRBaseInteractable
	{
		public enum TeleportTrigger
		{
			OnSelectExited = 0,
			OnSelectEntered = 1,
			OnActivate = 2,
			OnDeactivate = 3,
			OnSelectExit = 0,
			OnSelectEnter = 1,
		}

		[SerializeField]
		private TeleportationProvider m_TeleportationProvider;
		[SerializeField]
		private MatchOrientation m_MatchOrientation;
		[SerializeField]
		private TeleportTrigger m_TeleportTrigger;
	}
}
