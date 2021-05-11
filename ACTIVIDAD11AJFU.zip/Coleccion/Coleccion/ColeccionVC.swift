//  ColeccionVC.swift
//  Coleccion
/* ANDRES JATCIN FLORES URIOSTEGUI
Desarrollo de aplicaciones en plataforma iOS - Miguel Pérez Maciel
Actividad 11 - Coleccion de numeros - 20/04/2021
Versión 1.0
*/

import UIKit


private let reuseIdentifier = "celda"

class ColeccionVC: UICollectionViewController {
    
    var imgNum:[String] = []

    let numeros:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        for valor in 0...19 {
            imgNum.append("\(valor+1)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func numberOfSections (in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgNum.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:Celda = collectionView.dequeueReusableCell(withReuseIdentifier:reuseIdentifier, for: indexPath) as! Celda
    
        // Configurar celda
        cell.imagenNum.image = UIImage(named: imgNum[indexPath.row])
        
        return cell
    }


}
		
