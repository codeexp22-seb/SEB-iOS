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
               description: "Learn the basics of iOS development with Apple’s  programming language, Swift!",
               categories: [.skill, .nationalService],
               courseBannerURL: .sampleImage,
               lesson: [
                CourseLesson(title: "Producing a Namecard Application", description: "Learn the basics of SwiftUI by building a namecard", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Intro to Swift 1", description: "Learn about variables, types and more!", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Clicker: Interactivity and Labels", description: "Create your very first app! A clicker", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Intro to Swift 2", description: "Learn about arrays, structs and closures", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Arrays & Jokes App", description: "Create an app based on what you've learnt", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "Intro to Swift 3: Classes and Optionals", description: "Learn about optional unwrapping and how to use optionals.", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample]),
                CourseLesson(title: "ListView and Your Friends", description: "Use (Create-Read-Update-Delete) CRUD to build a simple app", lessonUnit: [.sample, .sample, .sample], quiz: [.sample, .sample, .sample])
               ],
               badgeQuiz: [
                QuizQuestion(title: "What is a HStack", correctOptionIndex: 1, options: [
                    UnitRichText(text: "Horizontal Stack View", type: .plainText),
                    UnitRichText(text: "Vertical Stack View", type: .plainText),
                    UnitRichText(text: "Align items automatically", type: .plainText),
                    UnitRichText(text: "This view does not exist", type: .plainText)
                ]),
                QuizQuestion(title: "What is the difference between a class and struct?", correctOptionIndex: 1, options: [
                    UnitRichText(text: "A `struct` is pass by reference while a `class` is pass by copy", type: .markdown),
                    UnitRichText(text: "Classes are lighter weight than structs", type: .plainText),
                    UnitRichText(text: "A `struct` is pass by copy while a `class` is pass by reference", type: .markdown),
                    UnitRichText(text: "*Spelling*?", type: .markdown)
                ]),
                QuizQuestion(title: "How do you declare a @State variable", correctOptionIndex: 3, options: [
                    UnitRichText(text: "var x = 1", type: .code),
                    UnitRichText(text: "stateVar x = 1", type: .code),
                    UnitRichText(text: "x = 1", type: .code),
                    UnitRichText(text: "@State var x = 1", type: .code),
                    UnitRichText(text: "@state var x = 1", type: .code)
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
