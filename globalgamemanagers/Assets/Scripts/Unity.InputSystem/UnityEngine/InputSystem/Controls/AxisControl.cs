using UnityEngine.InputSystem;

namespace UnityEngine.InputSystem.Controls
{
	public class AxisControl : InputControl<float>
	{
		public enum Clamp
		{
			None = 0,
			BeforeNormalize = 1,
			AfterNormalize = 2,
			ToConstantBeforeNormalize = 3,
		}

		public Clamp clamp;
		public float clampMin;
		public float clampMax;
		public float clampConstant;
		public bool invert;
		public bool normalize;
		public float normalizeMin;
		public float normalizeMax;
		public float normalizeZero;
		public bool scale;
		public float scaleFactor;
	}
}
