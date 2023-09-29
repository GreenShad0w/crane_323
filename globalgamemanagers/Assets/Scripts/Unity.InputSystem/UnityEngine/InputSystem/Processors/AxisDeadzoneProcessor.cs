using UnityEngine.InputSystem;

namespace UnityEngine.InputSystem.Processors
{
	internal class AxisDeadzoneProcessor : InputProcessor<float>
	{
		public float min;
		public float max;
	}
}
