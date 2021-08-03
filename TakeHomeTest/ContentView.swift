//
//  ContentView.swift
//  TakeHomeTest
//
//  Created by Nocero Beguhe on 8/2/21.
//

import SwiftUI

struct ViewControllerHolder {
    weak var value: UIViewController?
}

struct ViewControllerKey: EnvironmentKey {
    static var defaultValue: ViewControllerHolder {
        return ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)
        
    }
}

extension EnvironmentValues {
    var viewController: UIViewController? {
        get { return self[ViewControllerKey.self].value }
        set { self[ViewControllerKey.self].value = newValue }
    }
}

extension UIViewController {
    func present<Content: View>(style: UIModalPresentationStyle = .automatic, @ViewBuilder builder: () -> Content) {
        let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
        toPresent.modalPresentationStyle = style
        toPresent.rootView = AnyView(
            builder()
                .environment(\.viewController, toPresent)
        )
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "dismissModal"), object: nil, queue: nil) { [weak toPresent] _ in
            toPresent?.dismiss(animated: true, completion: nil)
        }
        self.present(toPresent, animated: true, completion: nil)
    }
}


struct ContentView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    let dataModel = DataModel()
    
    var body: some View {
        ZStack{
            NavigationView {
                Text("")
                    .navigationBarItems(trailing:
                                            Button("Log Out") {
                                                self.viewControllerHolder?.present(style: .fullScreen) {
                                                    LoginView()
                                                }
                                            }
                                            .frame(width: 70, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                    )
            }
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 100, content: {
                
                Text("Name: [" + dataModel.name + "]")
                    .font(.largeTitle)
                
                Button("Go To Tokens Page") {
                    self.viewControllerHolder?.present(style: .fullScreen) {
                        TokensView()
                    }
                }
                .frame(width: 160, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
