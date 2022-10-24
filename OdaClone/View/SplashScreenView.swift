//
//  SplashScreenView.swift
//  OdaClone
//
//  Created by Thomas Korsnes on 18/10/2022.
//

import SwiftUI


struct SplashScreenView: View {
    @State var isActive: Bool = false
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            VStack {
                Image(systemName: "trash")
                    .font(.system(size: 100))
                    .foregroundColor(.green)
                Text("Thomas sin app")
                    .bold()
                    .foregroundColor(.teal)
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation() {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
