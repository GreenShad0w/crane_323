using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO.Ports;

public class Move : MonoBehaviour {

	SerialPort sp = new SerialPort("COM8", 9600); // set port of your arduino connected to computer

	void Start () {
		sp.Open();
		sp.ReadTimeout = 1;
	}
	void Update () {
		if (sp.IsOpen) {
			try {
				if (sp.ReadByte() == 1) {
					this.obj_UD.transform.Translate(Vector3.up * Time.deltaTime * 5);
				}
				if (sp.ReadByte() == 2) {
					this.obj_UD.transform.Translate(-Vector3.up * Time.deltaTime * 5);
				}
				if (sp.ReadByte() == 3)
				{
					this.obj_LR.transform.Translate(Vector3.forward * Time.deltaTime * 5);
				}
				if (sp.ReadByte() == 4)
				{
					this.obj_LR.transform.Translate(-Vector3.forward * Time.deltaTime * 5);
				}
				if (sp.ReadByte() == 5)
				{
					this.obj_FB.transform.Translate(Vector3.forward * Time.deltaTime * 5);
				}
				if (sp.ReadByte() == 6)
				{
					this.obj_FB.transform.Translate(-Vector3.forward * Time.deltaTime * 5);
				}
			} catch (System.Exception) {
			}
		}
	}
	private float movespeed_LR = 0.1f;

	private float movespeed_FB = 0.1f;

	private float movespeed_UD = 0.11f;

	public GameObject obj_LR;

	public GameObject obj_FB;

	public GameObject obj_UD;
}
