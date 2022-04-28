//
//  ARView.swift
//  gimm_310_app
//
//  Created by Dylan Pope on 4/21/22.
//
import SwiftUI
import ARKit
import RealityKit
import MultipeerConnectivity

class ARViewController: UIViewController{
    
    var multipeerSession: MultipeerSession!
    var currMdl :Entity? = nil
    let anchor = AnchorEntity()
    let thumbsUpMdl = try? Entity.load(named: "Like_Button.usdz")
    let thumbsDownMdl = try? Entity.load(named: "Dislike_Button.usdz")
    let laughingMdl = try? Entity.load(named: "LaughingEmojiModel.usdz")
    let angryMdl = try? Entity.load(named: "AngryEmojiModel.usdz")
    let freePoop = try? Entity.load(named: "3d_Poop_Emoji.usdz")
    
    var deleted: Bool = true
    
    
    let defPos = simd_make_float3(0, 1, 0)
    

    
    
    @IBOutlet weak var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        multipeerSession = multipeerSession(receivedDataHandler: receivedData)
        
    }
   
    @IBAction func LikeButton(_ sender: Any) {
        print("Like button pressed")
        LoadModel(mdl: thumbsUpMdl!)
        
    
    }
    
    @IBAction func DislikeButton(_ sender: Any) {
        print("Dislike button pressed")
        LoadModel(mdl: thumbsDownMdl!)
        
        
    }
    

    @IBAction func HandRaise(_ sender: Any) {
        print("I have raised my hand")
    }
    
    @IBAction func LaughingerButton(_ sender: Any) {
        LoadModel(mdl: laughingMdl!)
        
    }
    
    @IBAction func AngierButton(_ sender: Any) {
        LoadModel(mdl: angryMdl!)
        
    }
    
    
    @IBAction func QuestionButton(_ sender: Any) {
        print("I have a question")
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
        if(deleted == false){
            anchor.removeChild(currMdl!)
        }
        anchor.position = defPos
        currMdl = mdl
        anchor.addChild(currMdl!)
        arView.scene.anchors.append(anchor)
        deleted = false

    }
}
