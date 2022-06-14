//
//  Course+DummyCourse.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import Foundation

extension Course {
    // 1 unit with full information (that can be the swift one and i can settle the info inside)
    // 1 unit that's just chapters
    // 3 units that are just names
    static let dummy: [Course] = [
        Course(title: "Intro to Swift",
               description: "Potato",
               categories: [.skill, .nationalService],
               courseBannerURL: .sampleImage,
               lesson: [
                CourseLesson(title: "Producing a Namecard Application", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Intro to Swift 1", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Clicker: Interactivity and Labels", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Intro to Swift 2", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Arrays & Jokes App", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Intro to Swift 3: Classes and Structs", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "ListView and Your Friends", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Capstone Quiz", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample])
               ],
               badgeQuiz: [
                QuizQuestion(title: "Test Question", correctOptionIndex: 1, options: [
                    UnitRichText(text: "Test", type: .code)
                ])
               ],
               badgeQuizImage: URL(string: "https://user-images.githubusercontent.com/36725840/173285564-e8f87735-616a-4b42-8cd3-f6fe6ac9a435.png")!),
        Course(title: "Intro to Rifle Handling",
               description: "Learn how to handle a SAR 21",
               categories: [.skill, .nationalService],
               courseBannerURL: .sampleImage,
               lesson: [
                CourseLesson(title: "A History of Singapore's Arsenal ", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "The SAR-21: Your Best Friend", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Disassembly of a SAR-21", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Re-assembly of a SAR-21", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "How to Handle Ammunition", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Handling the SAR-21", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Steadying Your Aim", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Your First Gunshot", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Target Practice", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Maneuvering With The SAR-21", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Capstone Quiz", description: "a", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample])
               ],
               badgeQuiz: [
                QuizQuestion(title: "Test Question", correctOptionIndex: 1, options: [
                    UnitRichText(text: "Test", type: .code)
                ])
               ], badgeQuizImage: URL(string: "https://user-images.githubusercontent.com/36725840/173580871-05b2ad8e-d0ea-41c1-9fff-2d0299344c98.png")!),
        Course(title: "Building a Culture of Respect and Consent ❤️",
               description: """
The course aims to raise awareness and educate the NUS community on an inclusive and respectful campus, workplace culture — as well as to sustain a conversation on issues related to these topics.
""",
               categories: [.nationalService], courseBannerURL: .sampleImage, lesson: [
            CourseLesson(title: "Consent is important", description: "Do you agree?", lessonUnit: [.sample], quiz: [.sample])
        ], badgeQuiz: [
            QuizQuestion(title: "Test Question", correctOptionIndex: 1, options: [
                UnitRichText(text: "Test", type: .code)
            ])
        ], badgeQuizImage: URL(string: "https://user-images.githubusercontent.com/36725840/173588128-6ef744f0-154e-4fc3-9b6c-1cae700fa71d.gif")!),
        Course(title: "How to win CODE_EXP", description: "Don't have skill issue lmao", categories: [.nationalService], courseBannerURL: .sampleImage, lesson: [
            CourseLesson(title: "Getting good", description: "'nuf said'", lessonUnit: [.sample], quiz: [.sample])
        ], badgeQuiz: [
            QuizQuestion(title: "Did you get good?", correctOptionIndex: 1, options: [
                UnitRichText(text: "Test", type: .code)
            ])
        ], badgeQuizImage: URL(string: "https://user-images.githubusercontent.com/36725840/173588128-6ef744f0-154e-4fc3-9b6c-1cae700fa71d.gif")!),
        Course(title: "Bunk Layout", description: "Learn more about how to arrange your bunk", categories: [.nationalService], courseBannerURL: .sampleImage, lesson: [
            CourseLesson(title: "About your bunk", description: "Learn more about the arrangement of your bunk", lessonUnit: [.sample], quiz: [.sample])
        ], badgeQuiz: [
            QuizQuestion(title: "What's the best way to arrange your bunk?", correctOptionIndex: 1, options: [
                UnitRichText(text: "Test", type: .code)
            ])
        ], badgeQuizImage: URL(string: "https://user-images.githubusercontent.com/36725840/173588128-6ef744f0-154e-4fc3-9b6c-1cae700fa71d.gif")!)
        
    ]
}
