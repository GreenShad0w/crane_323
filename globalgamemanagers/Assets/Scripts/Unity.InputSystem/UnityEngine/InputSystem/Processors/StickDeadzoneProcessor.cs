using UnityEngine.InputSystem;
using UnityEngine;

namespace UnityEngine.InputSystem.Processors
{
	public class StickDeadzoneProcessor : InputProcessor<Vector2>
	{
		public float min;
		public float max;
	}
}
