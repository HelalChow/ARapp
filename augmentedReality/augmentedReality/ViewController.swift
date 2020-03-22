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
    }
        
        

    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
          
        }
        
       
        
    }
