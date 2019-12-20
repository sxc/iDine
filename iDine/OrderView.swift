//
//  OrderView.swift
//  iDine
//
//  Created by Xiaochun Shen on 2019/12/19.
//  Copyright © 2019 SXC. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            Section {
                List {
                ForEach(order.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price)")
                    }
                }.onDelete(perform: deleteItems)
                }
            }
            
            
            
            Section {
                NavigationLink(destination: CheckoutView()) {
                    Text("Place Order")
                }
            }.disabled(order.items.isEmpty)
        }
        .navigationBarTitle("Order")
        .listStyle(GroupedListStyle())
        .navigationBarItems(trailing: EditButton())
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
        OrderView().environmentObject(order)
        }
    }
}
