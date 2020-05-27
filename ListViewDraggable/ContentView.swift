//
//  ContentView.swift
//  ListViewDraggable
//
//  Created by rkedlor on 5/27/20.
//  Copyright © 2020 rkedlor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    cust()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct cust: View {
  @State var data = ["1","2","3","4","5","6"]
  var body : some View {
    NavigationView {
      List{
        ForEach(data,id: \.self){ i in
          Text(i)
        }
        .onDelete(perform: { (index) in
          self.data.remove(atOffsets: index)
        })
        .onMove(perform: { (index,destination) in
          self.data.move(fromOffsets: index, toOffset: destination)
        })
      }/**ListEnd**/
      .navigationBarTitle("ListView")
      .navigationBarItems(trailing: EditButton())
    }
  }
}
