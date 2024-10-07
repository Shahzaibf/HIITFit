//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Shahzaib Fareed on 9/23/24.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @EnvironmentObject var history: HistoryStore
    var lastExercise : Bool {
        index + 1 == Exercise.exercises.count
    }
    @Binding var selectedTab: Int
    var exercise: Exercise {
      Exercise.exercises[index]
    }
    let index: Int
    let interval: TimeInterval = 30
    
    var startButton: some View {
      Button("Start Exercise") {
          showTimer.toggle()
      }
    }

    var doneButton: some View {
      Button("Done") {
          history.addDoneExercise(Exercise.exercises[index].exerciseName)
          timerDone = false
          showTimer.toggle()
          if lastExercise {
              showSuccess.toggle()
          } else {
              selectedTab += 1
          }
      }
    }
    @State private var timerDone = false
    @State private var showTimer = false
    @State private var showHistory = false
    @State private var rating = 0
    @State private var showSuccess = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab,titleText: Exercise.exercises[index].exerciseName)
                    .padding(.bottom)
                if let url = Bundle.main.url(
                    forResource: exercise.videoName,
                    withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(exercise.videoName).mp4")
                        .foregroundColor(.red)
                }
                HStack(spacing: 150) {
                    startButton
                    doneButton
                        .disabled(!timerDone)
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium,.large])
                        }
                }
                .font(.title3)
                .padding()
                if showTimer {
                    TimerView(timerDone: $timerDone, size: geometry.size.height * 0.07)
                }
                Spacer()
                RatingView(rating: $rating)
                    .padding()
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(0), index: 0)
        .environmentObject(HistoryStore())
}
