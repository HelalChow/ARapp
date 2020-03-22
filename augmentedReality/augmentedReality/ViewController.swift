//
//  ViewController.swift
//  augmentedReality
//
//  Created by Helal Chowdhury on 3/21/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Shows world origin and feature points
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.automaticallyUpdatesLighting = true
        configuration.planeDetection = .horizontal
        self.sceneView.session.run(configuration)
   
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    struct myCameraCoordinates {
        var x = Float()
        var y = Float()
        var z = Float()
    }
    
    func getCameraCoordinates(sceneView: ARSCNView) -> myCameraCoordinates {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates = MDLTransform(matrix: cameraTransform!)
        
        var cc = myCameraCoordinates()
        cc.x = cameraCoordinates.translation.x
        cc.y = cameraCoordinates.translation.y
        cc.z = cameraCoordinates.translation.z
        
        return cc
        
    }
        
    @IBAction func add(_ sender: Any) {
        let node = SCNNode()
        // Make the node a box
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        // Give the node a color
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
      
        // Places object in random positions
        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = randomNumbers(firstNum: -0.6, secondNum: -1)
        // Gives the node a position from the world origin
        node.position = SCNVector3(x,y,z)
        

        self.sceneView.scene.rootNode.addChildNode(node)
    
    }
    
    @IBAction func addCup(_ sender: Any) {
//        let cupNode = SCNNode()
//        
//        let cc = getCameraCoordinates(sceneView: sceneView)
//        cupNode.position = SCNVector3(cc.x, cc.y, cc.z)
//        
//        guard let virtualObjectScene = SCNScene(named: "cup.scn", inDirectory: "art.scnassets/cup")
//            else{
//                return
//        }
//        
//        let wrapperNode = SCNNode()
//        for child in virtualObjectScene.rootNode.childNodes{
//            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
//            wrapperNode.addChildNode(child)
//        }
//        cupNode.addChildNode(wrapperNode)
//        
//        sceneView.scene.rootNode.addChildNode(cupNode)
    }
    
    
    // Reset all nodes
    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    
    // Pause session to stop keeping track of position
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    //Gives random number between to numbers
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    
    
    

//    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
//
//        }
//
       
        
    }
