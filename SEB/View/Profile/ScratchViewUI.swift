//
//  ScratchViewUI.swift
//  SEB
//
//  Created by Jia Chen Yee on 15/6/22.
//

import Foundation
import SwiftUI

struct ScratchViewUI: UIViewRepresentable {
    
    var onScratch: (() -> Void)
    
    func makeUIView(context: Context) -> UIView {
        let view = ScratchView()
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: ScratchDelegate {
        var parent: ScratchViewUI
        
        init(parent: ScratchViewUI) {
            self.parent = parent
        }
        
        func onScratch() {
            parent.onScratch()
        }
    }
}
