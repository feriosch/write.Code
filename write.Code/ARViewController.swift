//
//  ARViewController.swift
//  write.Code
//
//  Created by cdt307 on 11/28/19.
//  Copyright © 2019 FernandoRios. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {
    
    var codigo:String = ""

    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var winSubview: UIView!
    
    @IBAction func playButton(_ sender: UIButton) {
        winSubview.isHidden = false
    }
    
    @IBAction func regresarButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func menuButton(_ sender: UIButton) {
        removeViewControllerStack()
    }
    
    @IBAction func otraVezButton(_ sender: UIButton) {
        winSubview.isHidden = true
    }
    
    @IBAction func masDesafiosButton(_ sender: UIButton) {
        removeViewControllerStack()
    }
    
    func removeViewControllerStack(){
       let navigationController = self.navigationController
       var navigationArray = navigationController?.viewControllers
       navigationArray?.removeAll()
       self.navigationController?.viewControllers = navigationArray!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        //Ocultar view de la victoria
        winSubview.isHidden = true
        
        //Create a new scene
        let scene = SCNScene()
        
        //CUBO
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        let cubeMaterial = SCNMaterial()
        cubeMaterial.diffuse.contents = UIColor.brown
        
        //CAJA
        let box = SCNBox(width: 0.2, height: 0.1, length: 0.1, chamferRadius: 0)
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIColor.systemPink
        
        //PIRAMIDE
        let pyramid = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        let pyramidMaterial = SCNMaterial()
        pyramidMaterial.diffuse.contents = UIColor.green
        
        //PROGLOBO (jugador)
        let proglobo = SCNSphere(radius: 0.05)
        let progloboMaterial = SCNMaterial()
        progloboMaterial.diffuse.contents = UIImage(named: "Smiley.jpg")
        
        
        
        //Nodos HARCODEADOS
        let cubeNode = SCNNode()
        cubeNode.geometry = cube
        cubeNode.geometry?.materials = [cubeMaterial]
        cubeNode.position = SCNVector3Make(0, 0, 0)
        scene.rootNode.addChildNode(cubeNode)
        
        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.geometry?.materials = [boxMaterial]
        boxNode.position = SCNVector3Make(0.2, 0, 0)
        scene.rootNode.addChildNode(boxNode)
        
        let pyramidNode = SCNNode()
        pyramidNode.geometry = pyramid
        pyramidNode.geometry?.materials = [pyramidMaterial]
        pyramidNode.position = SCNVector3Make(0.4, 0, 0)
        scene.rootNode.addChildNode(pyramidNode)
        
        let progloboNode = SCNNode()
        progloboNode.geometry = proglobo
        progloboNode.geometry?.materials = [progloboMaterial]
        progloboNode.position = SCNVector3Make(0, 0.1, 0)
        scene.rootNode.addChildNode(progloboNode)
        
        //Set the scene to the view
        sceneView.scene = scene
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        //Run the view's session
        sceneView.session.run(configuration)
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
