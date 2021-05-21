//  LeerNoticias.swift
//  VideoNoticia
/* Octavio Cuellar Almazan 2874558 ICA
Desarrollo de aplicaciones en plataforma iOS - Miguel Pérez Maciel
Actividad 13 - Reproductor de video y noticias - 04/05/2021
Versión 1.0
*/

import Foundation

class LeerNoticias{
    
    func getNoticias(termino: @escaping (_ datos:[String])->())
    {
      let liga = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=Sx9RL5EGWchG54cYRuwpTXR79p7lioTw" // Cambie la API Key porque la del documento no funcionaba
        
      let url = URL(string: liga)!
        URLSession.shared.dataTask(with: url)
        { NSData, URLResponse, NSError in
            var titulos:[String] = []
            
            do
            {
                let resultado = try JSONSerialization.jsonObject(with: NSData!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                for valor in resultado["results"] as! [NSDictionary]
                {
                  titulos.append(valor["title"] as! String)
                }
                
                DispatchQueue.main.async(
                    execute:
                    {() -> Void in
                    termino(titulos)
                    })
            }
                catch
                {
                    print("Error en lectura")
                }
        }.resume()
        }
    }
