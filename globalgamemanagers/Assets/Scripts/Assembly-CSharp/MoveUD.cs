using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO.Ports;

public class MoveUD : MonoBehaviour
{

	SerialPort spUD = new SerialPort("COM8", 9600); // set port of your arduino connected to computer

	void Start()
	{
		spUD.Open();
		spUD.ReadTimeout = 1;
	}
	void Update()
	{
		if (spUD.IsOpen)
		{
			try
			{
				int x = spUD.ReadByte();
				if (x == 1)
				{
					transform.Translate(Vector3.up * Time.deltaTime * 10);
				}
				if (x == 2)
				{
					transform.Translate(-Vector3.up * Time.deltaTime * 10);
				}
			}
			catch (System.Exception)
			{
			}
		}
	}

}