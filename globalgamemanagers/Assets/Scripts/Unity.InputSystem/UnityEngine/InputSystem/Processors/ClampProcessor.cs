using UnityEngine.InputSystem;

namespace UnityEngine.InputSystem.Processors
{
	internal class ClampProcessor : InputProcessor<float>
	{
		public float min;
		public float max;
	}
}
