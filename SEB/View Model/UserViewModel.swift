//
//  UserViewModel.swift
//  SEB
//
//  Created by Jia Chen Yee on 12/6/22.
//

import Foundation

class UserViewModel: ObservableObject {
    var userCourses: [Course] = [.sample]
    
    var suggestedCourses: [Course] {
        return Array(Set(allCourses).subtracting(userCourses))
    }
    
    var allCourses: [Course] = Course.dummy
}
