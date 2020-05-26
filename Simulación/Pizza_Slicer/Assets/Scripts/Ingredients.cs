using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ingredients : MonoBehaviour
{
    private GameObject Plato;
    private GameObject Pizza;
    private Blade blade;
    float time1;
    float time2; 
    void Start()
    {
        Plato = GameObject.Find("plato");
        Pizza = GameObject.Find("pizza");
        blade = gameObject.AddComponent<Blade>();
        time1 = 0;
        time2 = 0;
    }
           
    public void Imprimir()
    {
        print("Ingredientes");
    }

    public IEnumerator Rotar(int angulo1, int angulo2)
    {
	    if(angulo1 < 0)
        {
            angulo1 = angulo1 + 180;
        }
        if(angulo2 < 0)
        {
            angulo2 = angulo2 + 180;
        }
        if(angulo1 > angulo2)
        {
            int x = angulo1;
            angulo1 = angulo2;
            angulo2 = x;
        }
        time1 = angulo1 * 0.05f + 0.5f;
        time2 = (angulo2 - angulo1) * 0.05f + 0.5f;
        for (int i = 0; i < angulo1; i++)
        {
            Plato.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
            Pizza.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
            yield return new WaitForSeconds(0.05f);
        }
        yield return new WaitForSeconds(time1);
        StartCoroutine(blade.Cortar());
        yield return new WaitForSeconds(5.0f);
        for (int i = 0; i < angulo2 - angulo1; i++)
        {
            Plato.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
            Pizza.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
            yield return new WaitForSeconds(0.05f);
        }
        yield return new WaitForSeconds(time2);
        StartCoroutine(blade.Cortar());
        yield return new WaitForSeconds(5.0f);
        for (int i = angulo1+(angulo2 - angulo1); i > 0; i--)
        {
            Plato.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
            Pizza.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
            yield return new WaitForSeconds(0.05f);
        }
    }


}
