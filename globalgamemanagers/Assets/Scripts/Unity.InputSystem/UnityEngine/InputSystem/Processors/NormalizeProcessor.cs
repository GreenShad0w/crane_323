using UnityEngine.InputSystem;

namespace UnityEngine.InputSystem.Processors
{
	internal class NormalizeProcessor : InputProcessor<float>
	{
		public float min;
		public float max;
		public float zero;
	}
}
