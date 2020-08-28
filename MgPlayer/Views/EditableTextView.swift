//
//  EditableTextView2.swift
//  MgClicker
//
//  Created by Michel Garlandat on 25/08/2020.
//

import SwiftUI

struct EditableTextView: View {
    let title: String
    @Binding var editedText: String
    @State private var showingAlert = false
    
    var body: some View {
        TextField(title, text: $editedText).modifier(ClearButton(editedText: $editedText))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct ClearButton: ViewModifier {
    @Binding var editedText: String
    @State private var showingAlert = false
    
    public func body(content: Content) -> some View {
        // Zstack Pour faire apparaitre delete dans le textField
        ZStack(alignment: .trailing) {
            content
            if !editedText.isEmpty {
                Button(action: {
                    self.editedText = ""
                }, label: {
                    Image(systemName: "delete.left")
                        .foregroundColor(.secondary)
                        .padding(.trailing, 8)
                })
            }
        }
    }
}

struct EditableTextView2_Previews: PreviewProvider {
    static var previews: some View {
        EditableTextView(title: "Entrez votre spseudo", editedText: .constant(""))
    }
}
