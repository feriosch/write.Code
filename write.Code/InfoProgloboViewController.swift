//
//  InfoProgloboViewController.swift
//  write.Code
//
//  Created by cdt307 on 10/16/19.
//  Copyright © 2019 FernandoRios. All rights reserved.
//

import UIKit

class InfoProgloboViewController: UIViewController {
    var nombreImagen:String = ""
    var descripcionProglobo: String = ""
    var condicionProglobo: String = ""
    
    @IBAction func regresarButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var descripcion: UILabel!
    @IBOutlet weak var condicion: UILabel!
    @IBOutlet weak var imageProglobo: UIImageView!
    
    override func viewDidLoad() {
        print("Ya cargue")
        super.viewDidLoad()
        imageProglobo.image = UIImage(named: nombreImagen)!
        nombre.text = nombreImagen
        descripcion.text = descripcionProglobo
        condicion.text = condicionProglobo
        // Do any additional setup after loading the view.
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
