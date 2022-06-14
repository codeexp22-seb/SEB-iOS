//
//  QuizResultsView.swift
//  SEB
//
//  Created by Jia Chen Yee on 14/6/22.
//

import SwiftUI

struct QuizResultsView: View {
    
    @ObservedObject var quizViewModel: QuizViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    var course: Course
    var lesson: CourseLesson
    var onDismiss: (() -> Void)
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var skillAdded = false
    @State var fitnessAdded = false
    @State var nsAdded = false
    
    var body: some View {
        let passed = quizViewModel.score >= 0.5
        ZStack {
            Group {
                passed ? .accentColor : Color("Red")
            }
            .opacity(0.1)
            .edgesIgnoringSafeArea(.all)
            VStack {
                TabView {
                    VStack {
                        Text(lesson.title)
                            .font(.system(size: 24, weight: .bold))
                        
                        Text(passed ? "You passed!" : "You failed.")
                            .font(.system(size: 20, weight: .bold))
                        
                        ZStack {
                            CircularProgressView(lineWidth: 30,
                                                 accentColor: passed ? .accentColor : Color("Red"),
                                                 progress: quizViewModel.score)
                            .frame(width: 200)
                            
                            Text("\(Int(round(quizViewModel.score * 100)))%")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(passed ? Color.accentColor : Color("Red"))
                        }
                        
                        Text(passed ?
                             "Congratulations on passing *\(lesson.title)*! You can now move onto the next unit." :
                                "You failed to pass *\(lesson.title)*. Look through the lesson and try again later.")
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.system(size: 16))
                        
                        Spacer()
                    }
                    
                    if passed {
                        VStack {
                            Text("Your Rings")
                                .font(.system(size: 24, weight: .bold))
                            HStack(spacing: 32) {
                                ForEach(course.categories, id: \.self) { category in
                                    switch category {
                                    case .skill:
                                        ProgressRingView(title: "Skill",
                                                         systemName: "text.book.closed",
                                                         progress: userViewModel.rings.skill)
                                        .onAppear {
                                            if !skillAdded {
                                                withAnimation {
                                                    userViewModel.rings.skill += quizViewModel.score / 4
                                                }
                                                skillAdded = true
                                            }
                                        }
                                    case .fitness:
                                        ProgressRingView(title: "Fitness",
                                                         systemName: "figure.walk",
                                                         progress: userViewModel.rings.fitness)
                                        .onAppear {
                                            if !fitnessAdded {
                                                withAnimation {
                                                    userViewModel.rings.fitness += quizViewModel.score / 4
                                                }
                                                fitnessAdded = true
                                            }
                                        }
                                    case .nationalService:
                                        ProgressRingView(title: "NS",
                                                         systemName: "shield",
                                                         progress: userViewModel.rings.nationalService)
                                        .onAppear {
                                            if !nsAdded {
                                                withAnimation {
                                                    userViewModel.rings.nationalService += quizViewModel.score / 4
                                                }
                                                nsAdded = true
                                            }
                                        }
                                    }
                                }
                            }
                            
                            Spacer()

                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "AccentColor")
                    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
                }
                Button {
                    presentationMode.wrappedValue.dismiss()
                    onDismiss()
                } label: {
                    Text("Done")
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(passed ? .accentColor : Color("Red"))
                        .cornerRadius(8)
                }
                .disabled(!course.categories.allSatisfy { cat in
                    switch cat {
                    case .nationalService: return nsAdded
                    case .skill: return skillAdded
                    case .fitness: return fitnessAdded
                    }
                } && passed)
                .padding()
            }
        }
    }
}

struct QuizResultsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultsView(quizViewModel: .init(), course: .sample, lesson: Course.sample.lesson[0]) {
        }
    }
}
