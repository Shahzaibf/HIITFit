//
//  ContentView.swift
//  HIITFit
//
//  Created by Shahzaib Fareed on 9/23/24.
//

import SwiftUI


struct ContentView: View {
    @State private var selectedTab = 9
    var body: some View {
      TabView(selection: $selectedTab) {
        WelcomeView(selectedTab: $selectedTab)  // 1
          .tag(9)  // 2
        ForEach(Exercise.exercises.indices, id: \.self) { index in
          ExerciseView(selectedTab: $selectedTab, index: index)
            .tag(index)  // 3
        }
      }
      .environmentObject(HistoryStore())
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
