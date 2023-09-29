using System;
using UnityEngine;

namespace UnityEngine.InputSystem.LowLevel
{
	public struct TouchState
	{
		public int touchId;
		public Vector2 position;
		public Vector2 delta;
		public float pressure;
		public Vector2 radius;
		public byte phaseId;
		public byte tapCount;
		public byte flags;
		public double startTime;
		public Vector2 startPosition;
	}
}
