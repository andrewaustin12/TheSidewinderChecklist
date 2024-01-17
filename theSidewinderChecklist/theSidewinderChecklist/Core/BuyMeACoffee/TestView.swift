//
//  TestView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 1/15/24.
//

import SwiftUI
import StoreKit

struct TestView: View {
    @State private var myProduct: Product?
    
    var body: some View {
        VStack {
            Text("buy coffee")
            Text(myProduct?.displayName ?? "")
            Text(myProduct?.description ?? "")
            Text(myProduct?.displayPrice ?? "")
            Text(myProduct?.price.description ?? "")
        }
        .task {
            myProduct = try? await Product.products(for: ["com.andy.theSidewinderChecklist.tinyTip"]).first
        }
    }
}

#Preview {
    TestView()
}
