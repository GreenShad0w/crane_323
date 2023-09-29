using UnityEngine.InputSystem;

namespace UnityEngine.InputSystem.Composites
{
	public class ButtonWithTwoModifiers : InputBindingComposite<float>
	{
		public int modifier1;
		public int modifier2;
		public int button;
	}
}
