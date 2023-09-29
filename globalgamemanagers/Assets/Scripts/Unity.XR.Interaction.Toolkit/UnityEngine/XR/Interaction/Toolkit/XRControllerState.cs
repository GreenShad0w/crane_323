using System;
using UnityEngine.SpatialTracking;
using UnityEngine;

namespace UnityEngine.XR.Interaction.Toolkit
{
	[Serializable]
	public class XRControllerState
	{
		public double time;
		public PoseDataFlags poseDataFlags;
		public Vector3 position;
		public Quaternion rotation;
		public InteractionState selectInteractionState;
		public InteractionState activateInteractionState;
		public InteractionState uiPressInteractionState;
	}
}
