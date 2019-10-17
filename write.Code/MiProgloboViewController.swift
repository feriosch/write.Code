//
//  MiProgloboViewController.swift
//  write.Code
//
//  Created by cdt307 on 10/16/19.
//  Copyright © 2019 FernandoRios. All rights reserved.
//

import UIKit

class MiProgloboViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    

    @IBOutlet weak var progloboTable: UITableView!
    
    var datosFiltrados = [Any]()
    let searchController = UISearchController(searchResultsController: nil)
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == ""{
            datosFiltrados = nuevoArray!
        }else{
            datosFiltrados = nuevoArray!.filter{
                let objetoProglobo=$0 as! [String:Any]
                let s:String = objetoProglobo["nombre"] as! String;
                return(s.lowercased().contains(searchController.searchBar.text!.lowercased()))
            }
        }
        progloboTable.reloadData()
    }
    
    
    @IBAction func regresarButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    let direccion = "http://martinmolina.com.mx/201913/Kims/proglobos.json"
    var nuevoArray:[Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progloboTable.delegate = self
        progloboTable.dataSource = self
        
        let url = URL(string: direccion)
        let datos = try? Data(contentsOf: url!)
        nuevoArray = try! JSONSerialization.jsonObject(with: datos!) as? [Any]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        datosFiltrados = nuevoArray!
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        progloboTable.tableHeaderView = searchController.searchBar
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (datosFiltrados.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath)
        
        // Configure the cell...
        // cell.textLabel?.text = datos[indexPath.row]
        
        //let objetoRaza = nuevoArray![indexPath.row] as! [String: Any]
        let objetoRaza = datosFiltrados[indexPath.row] as! [String: Any]
        let s:String = objetoRaza["nombre"] as! String
        cell.textLabel?.text=s
        cell.imageView!.image = UIImage(named: s)!
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destino = segue.destination as! InfoProgloboViewController
         var objetoProglobo = [String:Any]()
        let indice = progloboTable.indexPathForSelectedRow?.row //Int?
         if (self.searchController.isActive){
             objetoProglobo = datosFiltrados[indice!] as! [String: Any]
         }else{
             objetoProglobo = nuevoArray![indice!] as! [String: Any]
         }
        
        
        //let objetoProglobo = nuevoArray![indice!] as! [String: Any]
        let s:String = objetoProglobo["nombre"] as! String
        let descripcion:String = objetoProglobo["descripcion"] as! String
        let condicion:String = objetoProglobo["condicionDesbloqueo"] as! String
        destino.nombreImagen = s
        destino.descripcionProglobo = descripcion
        destino.condicionProglobo = condicion
    }


}
