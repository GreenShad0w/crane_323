using UnityEngine.InputSystem;
using UnityEngine;

namespace UnityEngine.InputSystem.Processors
{
	internal class InvertVector2Processor : InputProcessor<Vector2>
	{
		public bool invertX;
		public bool invertY;
	}
}
