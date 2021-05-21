/* 
Desarrollo de aplicaciones en plataforma iOS - Miguel Pérez Maciel
Actividad 13 - Reproductor de video y noticias - 04/05/2021
Versión 1.0
*/

import UIKit

class NoticiasVC: UITableViewController {

    var noticias:[String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let inset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0);
        self.tableView.contentInset = inset
        self.tableView.scrollIndicatorInsets = inset
        
        LeerNoticias().getNoticias
            {
                (datos) in
                self.noticias = datos
                self.tableView.reloadData()
            }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.noticias.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "celda") as UITableViewCell?)!
        
        cell.textLabel?.text = self.noticias[indexPath.row]
        
        return cell
    }
}
