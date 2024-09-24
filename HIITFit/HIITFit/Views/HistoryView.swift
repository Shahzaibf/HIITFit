//
//  HistoryView.swift
//  HIITFit
//
//  Created by Shahzaib Fareed on 9/23/24.
//

import SwiftUI

struct HistoryView: View {
    let today = Date()
    let yesterday = Date().addingTimeInterval(-86400)
    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let exercises2 = ["Squat", "Step Up", "Burpee"]
    var body: some View {
        VStack {
          Text("History")
            .font(.title)
        .padding()
            Form {
                Section(
                    header:
                        Text(today.formatted(.dateTime.year().month().day()))
                        .font(.headline)) {
                            ForEach(exercises1, id: \.self) { exercise in
                              Text(exercise)
                            }
                        }
                        Section(
                            header:
                                Text(yesterday.formatted(.dateTime.year().month().day()))
                                .font(.headline)) {
                                    ForEach(exercises2, id: \.self) { exercise in
                                      Text(exercise)
                                    }
                }
            }
        }
    }
}

#Preview {
    HistoryView()
}
