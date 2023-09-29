using UnityEngine.InputSystem;

namespace UnityEngine.InputSystem.Composites
{
	public class AxisComposite : InputBindingComposite<float>
	{
		public enum WhichSideWins
		{
			Neither = 0,
			Positive = 1,
			Negative = 2,
		}

		public int negative;
		public int positive;
		public float minValue;
		public float maxValue;
		public WhichSideWins whichSideWins;
	}
}
