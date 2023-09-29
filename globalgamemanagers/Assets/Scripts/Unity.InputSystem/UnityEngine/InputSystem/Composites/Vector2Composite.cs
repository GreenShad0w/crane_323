using UnityEngine.InputSystem;
using UnityEngine;

namespace UnityEngine.InputSystem.Composites
{
	public class Vector2Composite : InputBindingComposite<Vector2>
	{
		public enum Mode
		{
			Analog = 2,
			DigitalNormalized = 0,
			Digital = 1,
		}

		public int up;
		public int down;
		public int left;
		public int right;
		public bool normalize;
		public Mode mode;
	}
}
