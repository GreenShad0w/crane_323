using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorkWithGruz : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        this.Zone_1.SetActive(false);
    }
    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Gruz")
        {
            Destroy(collision.gameObject.GetComponent<FixedJoint>());
            FixedJoint component = collision.gameObject.AddComponent<FixedJoint>();
            component.connectedBody = this.Cran;
            this.Zone_1.SetActive(true);
         }
    }


    public Rigidbody Cran;

    public GameObject Zone_1;

   // public GameObject Zone_ykaz_1;
}
