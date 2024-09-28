//
//  SuccessView.swift
//  HIITFit
//
//  Created by Shahzaib Fareed on 9/25/24.
//

import SwiftUI

struct SuccessView: View {
    let message = """
      Good job completing all four exercises!
      Remember tomorrow's another day.
      So eat well and get some rest.
      """
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "hand.raised.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.bottom)
                .frame(width: 75, height: 75)
            Text("High Five!")
                .font(.title)
                .fontWeight(.bold)
            Text(message)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
            Spacer()
            Button("Continue") {
                selectedTab = 9
                dismiss()
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    SuccessView(selectedTab: .constant(3))
}
