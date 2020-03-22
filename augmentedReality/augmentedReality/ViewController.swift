//
//  ViewController.swift
//  augmentedReality
//
//  Created by Helal Chowdhury on 3/21/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Shows world origin and feature points
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.automaticallyUpdatesLighting = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    @IBAction func add(_ sender: Any) {
        let node = SCNNode()
        // Make the node a box
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        // Add reflection to the node
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        // Give the node a color
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        // Places object in random positions
        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = randomNumbers(firstNum: -0.3, secondNum: -0.6)
        // Gives the node a position from the world origin
        node.position = SCNVector3(x,y,z)
        self.sceneView.scene.rootNode.addChildNode(node)
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
