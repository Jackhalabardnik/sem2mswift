//
//  CButton.swift
//  test1
//
//  Created by Jacek  on 10/10/2023.
//

import SwiftUI

struct CButton: View {
    @State var buttonText: String
    @State var buttonAction: () -> Void
    var body: some View {
        Button(buttonText, action: buttonAction)
            .font(.title)
            .padding(15)
            .frame(width: 100, height: 60)
            .border(.black, width: 2)
    }
}
