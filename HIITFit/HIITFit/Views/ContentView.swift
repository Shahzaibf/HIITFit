//
//  ContentView.swift
//  HIITFit
//
//  Created by Shahzaib Fareed on 9/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
              WelcomeView()
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                  ExerciseView(index: index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
