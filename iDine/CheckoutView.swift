//
//  CheckoutView.swift
//  iDine
//
//  Created by Xiaochun Shen on 2019/12/19.
//  Copyright © 2019 SXC. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
            }
            
            Toggle(isOn: $addLoyaltyDetails.animation()) {
                Text("Add iDine loyalty card")
            }
            
            TextField("Enter your iDine ID", text: $loyaltyNumber)
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            CheckoutView().environmentObject(order)
        }
    }
}
