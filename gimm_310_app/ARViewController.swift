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
    
    var currMdl :Entity? = nil
    let anchor = AnchorEntity()
    let thumbsUpMdl = try? Entity.load(named: "Like_Button.usdz")
    let thumbsDownMdl = try? Entity.load(named: "Dislike_Button.usdz")
    let laughingMdl = try? Entity.load(named: "LaughingEmojiModel.usdz")
    let freePoop = try? Entity.load(named: "3d_Poop_Emoji.usdz")
    
    var deleted: Bool = true
    
    let scalar = simd_make_float3(0.01, 0.01, 0.01)
    
    let defPos = simd_make_float3(0, 1, 0)
    

    
    
    @IBOutlet weak var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
    @IBAction func LikeButton(_ sender: Any) {
        print("Like button pressed")
        LoadModel(mdl: thumbsUpMdl!)
        deleted = false
    
    }
    
    @IBAction func DislikeButton(_ sender: Any) {
        print("Dislike button pressed")
        LoadModel(mdl: thumbsDownMdl!)
        deleted = false
        
    }
    
    @IBAction func HandButton(_ sender: Any) {
        print("Hand button pressed")
    }
    
    
    @IBAction func LaughingButton(_ sender: Any) {
        print("Laughing button pressed")
        LoadModel(mdl: laughingMdl!)
        deleted = false
    }
    
    @IBAction func AngryButton(_ sender: Any) {
        print("Angry button pressed")
    }
    
    @IBAction func QuestionButton(_ sender: Any) {
        print("Question button pressed")
    }
    
    @IBAction func ClearButton(_ sender: Any) {
        if (deleted == true) {
            print("No Object to delete!")
        }
        else if (deleted == false) {
            anchor.removeChild(currMdl!)
            deleted = true
        }
        
    }
    
    func LoadModel (mdl : Entity) {
        anchor.position = defPos
        anchor.scale = scalar
        currMdl = mdl
        anchor.addChild(currMdl!)
        arView.scene.anchors.append(anchor)

    }
}
