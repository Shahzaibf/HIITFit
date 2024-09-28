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

struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
}



