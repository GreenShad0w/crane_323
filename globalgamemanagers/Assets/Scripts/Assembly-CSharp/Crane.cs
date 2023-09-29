using System;
using UnityEngine;


public class Crane : MonoBehaviour
{

    public void Left()
    {
        if (this.obj_LR.transform.position.z > -25)
        {
            this.OnTriggerEnter(this.left);
            this.obj_LR.transform.Translate(Vector3.forward * speed);
        }
    }

    public void Right()
    {
        if (this.obj_LR.transform.position.z < 44)
        {
            this.OnTriggerEnter(this.right);
            this.obj_LR.transform.Translate(-Vector3.forward * speed);
        }
    }

    public void Front()
    {
        if (this.obj_FB.transform.position.x > -34)
        {
            this.OnTriggerEnter(this.front);
            this.obj_FB.transform.Translate(-Vector3.forward * speed);
            //Debug.Log(this.obj_FB.transform.position.x);
        }
    }

    public void Back()
    {
        if (this.obj_FB.transform.position.x < 3)
        {
            this.OnTriggerEnter(this.back);
            this.obj_FB.transform.Translate(Vector3.forward * speed);
        }
    }

    public void Up()
    {
        if (this.obj_UD.transform.position.y < 0)
        {
            this.OnTriggerEnter(this.up);
            this.obj_UD.transform.Translate(-Vector3.up * speed);
            //Debug.Log(this.obj_UD.transform.position.y);
        }
    }

    public void Down()
    {
        if (this.obj_UD.transform.position.y > -7.5)
        {
            this.OnTriggerEnter(this.down);
            this.obj_UD.transform.Translate(Vector3.up * speed);
            //Debug.Log(this.obj_UD.transform.position.y);
        }
    }

    public void OnTriggerEnter(Collider col)
    {
        string name = col.gameObject.name;
        if (name == "Left")
        {
            this.Left();
            return;
        }
        if (name == "Right")
        {
            this.Right();
            return;
        }
        if (name == "Front")
        {
            this.Front();
            return;
        }
        if (name == "Back")
        {
            this.Back();
            return;
        }
        if (name == "Down")
        {
            this.Down();
            return;
        }
        if (name == "Up")
        {
            this.Up();
            return;
        }
    }

    public GameObject obj_LR;

    public GameObject obj_FB;

    public GameObject obj_UD;

    public float speed;

    public BoxCollider left;

    public BoxCollider right;

    public BoxCollider up;

    public BoxCollider down;

    public BoxCollider front;

    public BoxCollider back;
}