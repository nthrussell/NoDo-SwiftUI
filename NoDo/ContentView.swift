//
//  ContentView.swift
//  NoDo
//
//  Created by Minhajul Russell on 11/13/19.
//  Copyright © 2019 russell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var nodo: String = ""
    @State var nodoList = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 5) {
                    Image(systemName: "plus.circle")
                        .padding(.leading)
                    Group {
                        TextField("What will you not try today", text: self.$nodo, onEditingChanged: { (changed) in
                            print("changed:\(changed)")
                        }) {
                            print("on commit")
                            self.nodoList.insert(self.nodo, at: 0)
                            print("nodoList:\(self.nodoList)")
                        }.padding(.all, 12)
                    }.background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 5)
                        .padding(.trailing, 8)
                }
                //Text(nodo)
                List(self.nodoList, id: \.self ) { item in
                    //Text(item)
                    noDoRow(noDoItem: item)
                }
                
            }.navigationBarTitle(Text("NoDo"))
            
        }
    }
}

struct noDoRow: View {
    @State var noDoItem: String = ""
    @State var isDone: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Group {
                HStack {
                    Text(noDoItem)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    Image(systemName: (self.isDone) ? "checkmark" : "square")
                    .padding()
                }
                HStack(alignment: .center, spacing: 3) {
                    Spacer()
                    Text("Time added...")
                        .foregroundColor(.white)
                        .italic()
                        .padding(.all, 4)
                }
            }.padding(.all, 4)
        }.opacity((self.isDone) ? 0.3 : 1.0)
        .background((self.isDone) ? Color.gray : Color.pink)
         .clipShape(RoundedRectangle(cornerRadius: 5))
            .onTapGesture {
                self.isDone.toggle()
                print("tapped:\(self.isDone)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
