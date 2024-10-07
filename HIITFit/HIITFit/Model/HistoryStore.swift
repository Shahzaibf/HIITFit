//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Shahzaib Fareed on 9/24/24.
//

import Foundation

struct ExerciseDay : Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
    let calendar = Calendar.current
    return calendar.isDate(date1, inSameDayAs: date2)
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    init() {
#if DEBUG
        createDevData()
#endif
    }
    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if  isSameDay(today, exerciseDays[0].date) {
            print("Adding \(exerciseName)")
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            let newExerciseDay = ExerciseDay(date: today, exercises: [exerciseName])
            exerciseDays.insert(newExerciseDay, at: 0)
        }
    }
}



