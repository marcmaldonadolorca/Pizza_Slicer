using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cuts : MonoBehaviour
{
    private GameObject Plato;
    private GameObject Pizza;
    private Blade blade;
    float time;
    void Start()
    {
        Plato = GameObject.Find("plato");
        Pizza = GameObject.Find("pizza");
        blade = gameObject.AddComponent<Blade>();
        time = 0;
    }


    public IEnumerator Trocear(int numero)
    {
        switch(numero)
        {
            case 4:
                time = 90 * 0.05f + 0.5f;
                StartCoroutine(blade.Cortar());
                yield return new WaitForSeconds(5.0f);
                for (int i = 0; i < 90; i++)
                {
                    Plato.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
                    Pizza.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
                    yield return new WaitForSeconds(0.05f);
                }
                yield return new WaitForSeconds(time);
                StartCoroutine(blade.Cortar());
                yield return new WaitForSeconds(5.0f);
                for (int i = 90; i > 0; i--)
                {
                    Plato.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
                    Pizza.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
                    yield return new WaitForSeconds(0.05f);
                }
                break;
            case 6:
                time = 60 * 0.05f + 0.5f;
                StartCoroutine(blade.Cortar());
                yield return new WaitForSeconds(5.0f);
                for (int i = 0; i < 60; i++)
                {
                    Plato.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
                    Pizza.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
                    yield return new WaitForSeconds(0.05f);
                }
                yield return new WaitForSeconds(time);
                StartCoroutine(blade.Cortar());
                yield return new WaitForSeconds(5.0f);
                for (int i = 0; i < 60; i++)
                {
                    Plato.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
                    Pizza.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
                    yield return new WaitForSeconds(0.05f);
                }
                yield return new WaitForSeconds(time);
                StartCoroutine(blade.Cortar());
                yield return new WaitForSeconds(5.0f);
                for (int i = 120; i > 0; i--)
                {
                    Plato.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
                    Pizza.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
                    yield return new WaitForSeconds(0.05f);
                }
                break;
            case 8:
                time = 45 * 0.05f + 0.5f;
                StartCoroutine(blade.Cortar());
                yield return new WaitForSeconds(5.0f);
                for (int i = 0; i < 45; i++)
                {
                    Plato.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
                    Pizza.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
                    yield return new WaitForSeconds(0.05f);
                }
                yield return new WaitForSeconds(time);
                StartCoroutine(blade.Cortar());
                yield return new WaitForSeconds(5.0f);
                for (int i = 0; i < 45; i++)
                {
                    Plato.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
                    Pizza.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
                    yield return new WaitForSeconds(0.05f);
                }
                yield return new WaitForSeconds(time);
                StartCoroutine(blade.Cortar());
                yield return new WaitForSeconds(5.0f);
                for (int i = 0; i < 45; i++)
                {
                    Plato.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
                    Pizza.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
                    yield return new WaitForSeconds(0.05f);
                }
                yield return new WaitForSeconds(time);
                StartCoroutine(blade.Cortar());
                yield return new WaitForSeconds(5.0f);
                for (int i = 135; i > 0; i--)
                {
                    Plato.transform.Rotate(0.0f, 0.0f, -1.0f, Space.Self);
                    Pizza.transform.Rotate(0.0f, 0.0f, 1.0f, Space.Self);
                    yield return new WaitForSeconds(0.05f);
                }
                break;
            default:
                print("Error, numero de trozos incorrecto");
                break;
        }
 
    }

}
