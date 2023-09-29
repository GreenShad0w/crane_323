namespace UnityEngine.XR.Interaction.Toolkit.Inputs.Interactions
{
	public class SectorInteraction
	{
		public enum Directions
		{
			None = 0,
			North = 1,
			South = 2,
			East = 4,
			West = 8,
		}

		public enum SweepBehavior
		{
			Locked = 0,
			AllowReentry = 1,
			DisallowReentry = 2,
			HistoryIndependent = 3,
		}

		public Directions directions;
		public SweepBehavior sweepBehavior;
		public float pressPoint;
	}
}
