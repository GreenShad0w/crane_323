using UnityEngine.InputSystem;

namespace UnityEngine.InputSystem.Composites
{
	public class ButtonWithOneModifier : InputBindingComposite<float>
	{
		public int modifier;
		public int button;
	}
}
