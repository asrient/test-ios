//
//  ContentView.swift
//  Clock
//
//  Created by aritra sen on 12/04/20.
//  Copyright © 2020 aritra sen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert: Bool = false
    var body: some View {
            VStack() {
                Text("This is your iPhone")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 50)
                    Button(action: {
                        self.showAlert=true
                    }) {
                        Text("Cute")
                            .font(.headline)
                        .fontWeight(.regular)
                            .foregroundColor(Color.orange)
                    }
                
            }
            .sheet(isPresented: $showAlert) {
                VStack() {
                Text("Cuteness")
                .font(.title)
                    .padding(.bottom,30)
                  Button(action: {
                 self.showAlert=false
                  }) {
                   Text("Close")
                       .font(.headline)
                       .fontWeight(.regular)
                      .foregroundColor(Color.red)
                    }
                    
                }
                }
    }
}

struct preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
