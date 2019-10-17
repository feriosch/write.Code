//
//  ListaDesafiosViewController.swift
//  write.Code
//
//  Created by cdt307 on 10/16/19.
//  Copyright © 2019 FernandoRios. All rights reserved.
//

import UIKit

class ListaDesafiosViewController: UIViewController {

    @IBAction func regresarButton(_ sender: UIButton) {
        removeViewControllerStack()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func removeViewControllerStack(){
        let navigationController = self.navigationController
        var navigationArray = navigationController?.viewControllers
        navigationArray?.removeAll()
        self.navigationController?.viewControllers = navigationArray!
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
