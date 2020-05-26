using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Blade : MonoBehaviour
{
    private GameObject Cuchilla;


    void Start()
    {
        Cuchilla = GameObject.Find("cuchilla");

    }

    public IEnumerator Cortar()
    {
        for (int i = 0; i < 30; i++)
        {
            Cuchilla.transform.Translate(0.1f, 0.0f, 0.0f, Space.Self);
            yield return new WaitForSeconds(0.05f);
        }

        yield return new WaitForSeconds(1.0f);
        for (int i = 0; i < 30; i++)
        {
            Cuchilla.transform.Translate(-0.1f, 0.0f, 0.0f, Space.Self);
            yield return new WaitForSeconds(0.05f);
        }
    }
}
