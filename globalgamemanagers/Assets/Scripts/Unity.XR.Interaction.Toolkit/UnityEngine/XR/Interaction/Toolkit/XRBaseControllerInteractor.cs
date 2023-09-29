using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	public class XRBaseControllerInteractor : XRBaseInteractor
	{
		public enum InputTriggerType
		{
			State = 0,
			StateChange = 1,
			Toggle = 2,
			Sticky = 3,
		}

		[SerializeField]
		private InputTriggerType m_SelectActionTrigger;
		[SerializeField]
		private bool m_HideControllerOnSelect;
		[SerializeField]
		private bool m_PlayAudioClipOnSelectEntered;
		[SerializeField]
		private AudioClip m_AudioClipForOnSelectEntered;
		[SerializeField]
		private bool m_PlayAudioClipOnSelectExited;
		[SerializeField]
		private AudioClip m_AudioClipForOnSelectExited;
		[SerializeField]
		private bool m_PlayAudioClipOnHoverEntered;
		[SerializeField]
		private AudioClip m_AudioClipForOnHoverEntered;
		[SerializeField]
		private bool m_PlayAudioClipOnHoverExited;
		[SerializeField]
		private AudioClip m_AudioClipForOnHoverExited;
		[SerializeField]
		private bool m_PlayHapticsOnSelectEntered;
		[SerializeField]
		private float m_HapticSelectEnterIntensity;
		[SerializeField]
		private float m_HapticSelectEnterDuration;
		[SerializeField]
		private bool m_PlayHapticsOnSelectExited;
		[SerializeField]
		private float m_HapticSelectExitIntensity;
		[SerializeField]
		private float m_HapticSelectExitDuration;
		[SerializeField]
		private bool m_PlayHapticsOnHoverEntered;
		[SerializeField]
		private float m_HapticHoverEnterIntensity;
		[SerializeField]
		private float m_HapticHoverEnterDuration;
		[SerializeField]
		private bool m_PlayHapticsOnHoverExited;
		[SerializeField]
		private float m_HapticHoverExitIntensity;
		[SerializeField]
		private float m_HapticHoverExitDuration;
	}
}
