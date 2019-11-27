//
//  ListaDesafiosViewController.swift
//  write.Code
//
//  Created by cdt307 on 10/16/19.
//  Copyright © 2019 FernandoRios. All rights reserved.
//

import UIKit

class ListaDesafiosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Hardcodeado
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda3", for: indexPath)
        
        cell.textLabel?.text = "Desafio harcodeado"
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    @IBOutlet weak var desafiosTable: UITableView!
    
    
    @IBAction func regresarButton(_ sender: UIButton) {
        removeViewControllerStack()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        desafiosTable.delegate = self
        desafiosTable.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    func removeViewControllerStack(){
        let navigationController = self.navigationController
        var navigationArray = navigationController?.viewControllers
        navigationArray?.removeAll()
        self.navigationController?.viewControllers = navigationArray!
    }

    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destino = segue.destination as! InfoDesafioLocalViewController
        
        destino.tituloMisionText = "Titulo harcodeado"
        destino.descripcionMisionText = "Descripcion muy harcodeada"
        
    }
    

}
