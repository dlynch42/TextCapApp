//
//  ContentView.swift
//  TextCapApp
//
//  Created by Devin Lynch on 8/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var userText = ""
    @State var capMode =  1 // represents which values are capitalized
    
    var body: some View {
        VStack{
            Spacer()
            
            if capMode == 1 {
                Text(userText.uppercased())
                    .font(.largeTitle)
            } else if capMode == 2 {
                Text(userText.capitalized) // only does first letter
                    .font(.largeTitle)
            } else { // general else since we know it is equal to 3
                Text(userText.lowercased())
                    .font(.largeTitle)
            }
            
            Spacer()
            
            Button(action: {
                if capMode == 1 {
                    UIPasteboard.general.string = userText
                        .uppercased()
                } else if capMode == 2 {
                    UIPasteboard.general.string = userText
                        .capitalized
                } else {
                    UIPasteboard.general.string = userText
                        .lowercased()
                }
            }){
                RoundedButton(title: "Copy", color: .orange)
            }
  
            HStack{
                Button(action: {
                    capMode = 1
                }){
                    RoundedButton(title: "CAPS", color: .blue)
                }
                
                Button(action: {
                    capMode = 2
                }){
                    RoundedButton(title: "First Letter", color: .green)
                }
                
                Button(action: {
                    capMode = 3
                }){
                    RoundedButton(title: "Lowercase", color: .red)
                }
            }
            .padding()
            
            TextField("Enter Text Here: ",
                              text: $userText) // $ = binding varible; update what the variable userText is now holding; only need it where we change the variable
                .padding()
        }
        .padding()
        
        Spacer()
    }
}

struct RoundedButton: View {
    var title: String
    var color: Color    // color is a type
    
    
    var body: some View {
        Text(title)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .font(.body)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
