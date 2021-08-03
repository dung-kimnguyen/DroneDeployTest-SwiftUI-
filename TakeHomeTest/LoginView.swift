//
//  LoginView.swift
//  TakeHomeTest
//
//  Created by Nocero Beguhe on 8/2/21.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some View {
        VStack(alignment: .center, spacing: 200, content: {
            Text("Login Screen")
                .padding()
                .font(.largeTitle)
            
            Button("Login") {
                self.viewControllerHolder?.present(style: .fullScreen) {
                    ContentView()
                }
            }
            .frame(width: 70, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
    })
}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
