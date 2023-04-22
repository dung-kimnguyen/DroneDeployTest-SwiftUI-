//
//  TokensView.swift
//  TakeHomeTest
//
//  Created by Dung Kim Nguyen on 8/2/21.
//

import SwiftUI

struct TokensView: View {
    
    let dataModel = DataModel()
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some View {
        ZStack{
            NavigationView {
                Text("")
                    .navigationBarItems(leading:
                                            Button("<Back") {
                                                self.viewControllerHolder?.present(style: .fullScreen) {
                                                    ContentView()
                                                }
                                            }
                                            .frame(width: 70, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                        , trailing:
                                            Button("Log Out") {
                                                self.viewControllerHolder?.present(style: .fullScreen) {
                                                    LoginView()
                                                }
                                            }
                                            .frame(width: 70, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.blue)
                                            .cornerRadius(10))
                
            }
            Text("Tokens: [" + dataModel.randToken() + "]")
                .font(.largeTitle)
        }
    }
}
struct TokensView_Previews: PreviewProvider {
    static var previews: some View {
        TokensView()
    }
}
