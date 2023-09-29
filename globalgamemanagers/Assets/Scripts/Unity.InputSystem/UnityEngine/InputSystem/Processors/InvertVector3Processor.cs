using UnityEngine.InputSystem;
using UnityEngine;

namespace UnityEngine.InputSystem.Processors
{
	internal class InvertVector3Processor : InputProcessor<Vector3>
	{
		public bool invertX;
		public bool invertY;
		public bool invertZ;
	}
}
