//
//  ARView.swift
//  gimm_310_app
//
//  Created by Dylan Pope on 4/21/22.
//
import SwiftUI
import ARKit
import RealityKit

class ARViewController: UIViewController{
    
    let anchor = AnchorEntity()
    let thumbsUpMdl = try? Entity.load(named: "Toon_Thumbs_Up")
    let freePoop = try? Entity.load(named: "3d_Poop_Emoji")
    
    let defPos = simd_make_float3(0, 1, 0)
    
    var currMdl :Entity? = nil
    
    
    @IBOutlet weak var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
    @IBAction func LikeButton(_ sender: Any) {
        LoadModel(mdl: thumbsUpMdl!)
    
    }
    
    @IBAction func DislikeButton(_ sender: Any) {
          LoadModel(mdl: freePoop!)
        
    }
    
    @IBAction func QuestionButton(_ sender: Any) {
        print("Question button pressed")
        anchor.removeChild(currMdl!)
    }
    
    func LoadModel (mdl : Entity) {
        anchor.position = defPos
        currMdl = mdl
        anchor.addChild(currMdl!)
        arView.scene.anchors.append(anchor)

    }
}
