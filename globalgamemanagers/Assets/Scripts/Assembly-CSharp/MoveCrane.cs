using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO.Ports;

public class MoveCrane : MonoBehaviour
{

	SerialPort spCrane = new SerialPort("COM8", 9600); // set port of your arduino connected to computer
	public float speed;


	void Start()
	{ 

		spCrane.Open();
		spCrane.ReadTimeout = 1;
	}
	void FixedUpdate()
	{
		if (spCrane.IsOpen)
		{
			try
			{
				int x = spCrane.ReadByte();
				if (x == 2)
				{
					if (this.obj_UD.transform.position.y < 0)
					{
						this.obj_UD.transform.Translate(-Vector3.up * speed); //Крюк вверх
						//Debug.Log(this.obj_UD.transform.position.y);
					}
					this.Btn6.transform.position = Vector3.Lerp(StartPositionBtn6, EndPositionBtn6, step);
				}
				if (x == 6)
				{
					if (this.obj_UD.transform.position.y > -7.5)
					{
						this.obj_UD.transform.Translate(Vector3.up * speed); //Крюк вниз
						//Debug.Log(this.obj_UD.transform.position.y);
					}
					this.Btn5.transform.position = Vector3.Lerp(StartPositionBtn5, EndPositionBtn5, step);
				}
				if (x == 3)
				{
					if (transform.position.z > -25)
					{
						transform.Translate(Vector3.forward * speed); //Кран влево
						//Debug.Log(transform.position.z);
					}
					this.Btn4.transform.position = Vector3.Lerp(StartPositionBtn4, EndPositionBtn4, step);
				}
				if (x == 5)
				{
					if (transform.position.z < 44)
					{
						transform.Translate(-Vector3.forward * speed); //Кран вправо
						//Debug.Log(transform.position.z);
					}
					this.Btn3.transform.position = Vector3.Lerp(StartPositionBtn3, EndPositionBtn3, step);
				}
				if (x == 4)
				{
					if (this.obj_FB.transform.position.x < 3)
					{
						this.obj_FB.transform.Translate(Vector3.forward * speed); //Кабина назад
					}
					this.Btn2.transform.position = Vector3.Lerp(StartPositionBtn2, EndPositionBtn2, step);
				}
				if (x == 1)
				{
					if (this.obj_FB.transform.position.x > -34)
					{
						this.obj_FB.transform.Translate(-Vector3.forward * speed); //Кабина вперед
						Debug.Log(this.obj_FB.transform.position.x);
					}
					this.Btn1.transform.position = Vector3.Lerp(StartPositionBtn1, EndPositionBtn1, step);
				}
			}
			catch (System.Exception)
			{
			}
		}
	}
	public GameObject obj_UD;

	public GameObject obj_FB;

	public GameObject Btn1;
	public Vector3 StartPositionBtn1;
	public Vector3 EndPositionBtn1;

	public GameObject Btn2;
	public Vector3 StartPositionBtn2;
	public Vector3 EndPositionBtn2;

	public GameObject Btn3;
	public Vector3 StartPositionBtn3;
	public Vector3 EndPositionBtn3;

	public GameObject Btn4;
	public Vector3 StartPositionBtn4;
	public Vector3 EndPositionBtn4;

	public GameObject Btn5;
	public Vector3 StartPositionBtn5;
	public Vector3 EndPositionBtn5;

	public GameObject Btn6;
	public Vector3 StartPositionBtn6;
	public Vector3 EndPositionBtn6;


	public float step;
}