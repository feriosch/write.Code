//
//  InfoDesafioLocalViewController.swift
//  write.Code
//
//  Created by cdt307 on 10/16/19.
//  Copyright © 2019 FernandoRios. All rights reserved.
//

import UIKit

class InfoDesafioLocalViewController: UIViewController {
    
    var tituloMisionText:String = ""
    var descripcionMisionText:String = ""
    
    @IBOutlet weak var tituloMision: UILabel!
    @IBOutlet weak var estrellasDificultadImage: UIImageView!
    @IBOutlet weak var descripcionMision: UILabel!
    
    @IBAction func regresarButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloMision.text = tituloMisionText
        descripcionMision.text = descripcionMisionText
        

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
