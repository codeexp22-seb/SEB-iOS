//
//  QuizResultsView.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import SwiftUI

struct QuizResultsView: View {
    
    var onDismiss: (() -> Void)
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        Text("\(userViewModel.rings.fitness)")
    }
}

struct QuizResultsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultsView {
        }
    }
}
