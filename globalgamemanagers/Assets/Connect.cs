using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Connect : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private const string V = "Connected Gruz";
    Renderer ren;

    public void OnTriggerEnter(Collider collision)
    {
        Destroy(this.gameObject.GetComponent<FixedJoint>());
        Destroy(collision.gameObject.GetComponent<FixedJoint>());
        if (collision.gameObject.tag == "Zone")
        {
            FixedJoint component = collision.gameObject.AddComponent<FixedJoint>();
            component.connectedBody = this.Block;
            gameObject.tag = V;
            ren = collision.GetComponent<Renderer>();
            ren.enabled = false;
        }
    }

    public Rigidbody Block;
}
