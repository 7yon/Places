//
//  CoordinateTextFieldStyle.swift
//  Places
//
//  Created by Daria Simenkova on 28.11.25.
//

import SwiftUI

struct CoordinateTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .keyboardType(.decimalPad)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
}

#Preview {
    @Previewable @State var text: String = "0,0"

    TextField("Latitude", text: $text)
        .textFieldStyle(CoordinateTextFieldStyle())
}
