namespace UnityEngine.InputSystem.LowLevel
{
	public enum InputUpdateType
	{
		None = 0,
		Dynamic = 1,
		Fixed = 2,
		BeforeRender = 4,
		Editor = 8,
		Manual = 16,
		Default = 11,
	}
}
