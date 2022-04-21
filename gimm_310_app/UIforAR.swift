//
//  UIforAR.swift
//  gimm_310_app
//
//  Created by Dylan Pope on 4/21/22.
//

import SwiftUI

struct UIforAR: View{
    var body: some View{
        VStack{
            ControlButtonBar()
        }
    }
}

struct ControlButtonBar: View{
    var body: some View{
        HStack{
            Button(action:{
                print("fist button pressed")
            }){
                Image(systemName:"square.grid.2x2")
            }
            Button(action:{
                print("second button pressed")
            }){
                Image(systemName:"square.grid.2x2")
            }
            Button(action:{
                print("third button pressed")
            }){
                Image(systemName:"square.grid.2x2")
            }
        }
    }
}
