using UnityEngine;
using System.Collections;
using System.Net;
using System.Net.Sockets;
using System.Linq;
using System;
using System.IO;
using System.Text;
public class readSocket : MonoBehaviour
{
    // Use this for initialization
    TcpListener listener;
    String msg;
    private Ingredients Ingredient;
    private Cuts Cut;
    void Start()
    {
        listener = new TcpListener(55002);
        listener.Start();
        print("is listening");
        Ingredient = gameObject.AddComponent<Ingredients>();
        Cut = gameObject.AddComponent<Cuts>();
    }
    // Update is called once per frame
    void Update()
    {
        if (!listener.Pending())
        {
        }
        else
        {
            print("socket comes");
            TcpClient client = listener.AcceptTcpClient();
            NetworkStream ns = client.GetStream();
            StreamReader reader = new StreamReader(ns);
            msg = reader.ReadToEnd();
            string[] orden = msg.Split(' ');
            switch (orden[0])
            {
                case "1":
                    int angulo1 = Int32.Parse(orden[1]);
                    int angulo2 = Int32.Parse(orden[2]);
                    StartCoroutine(Ingredient.Rotar(angulo1, angulo2));
                    break;
                case "2":
                    int numero = Int32.Parse(orden[1]);
                    StartCoroutine(Cut.Trocear(numero));
                    break;
                default:
                    print("Error al obtener la opción");
                    break;
            }
            print(msg);
        }
    }
}