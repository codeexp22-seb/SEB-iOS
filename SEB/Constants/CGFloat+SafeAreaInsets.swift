//
//  CGFloat+SafeAreaInsets.swift
//  SEB
//
//  Created by Jia Chen Yee on 13/6/22.
//

import Foundation
import UIKit

extension CGFloat {
    static var topSafeAreaInset: CGFloat {
        guard let currentScene = UIApplication.shared.connectedScenes.first,
              let windowScene = currentScene as? UIWindowScene,
              let safeAreaInsets = windowScene.keyWindow?.safeAreaInsets else { return 0 }
        
        return safeAreaInsets.top
    }
}
