//
//  FieldWithEditor.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 12.07.2023.
//

import SwiftUI

struct FieldWithEditor: View{
    @Binding var editMode:Bool
    @Binding var text: String
    private var type: EditorFieldType
    @State private var textHeight = CGFloat.zero
    
    init(mode: Binding<Bool>, text: Binding<String>,type: EditorFieldType) {
        self._editMode = mode
        self._text = text
        self.type = type
    }
    
    var body: some View{
        switch type{
        case .name: if(!editMode){
            Text(text).boldLabelStyle
        }
            else{
                TextField("",text: $text).boldLabelStyle
                    .lineLimit(1)
                    .padding(5)
                    .border(Color.active,width: 4).clipShape(RoundedRectangle(cornerRadius: 7.5)).padding(5)
                    .onReceive(text.publisher.collect()) {
                        text = String($0.prefix(24))
                    }
            }
        case .bio:
            if(!editMode){
                Text(text).bioLabelStyle
            }
            else{
                TextEditor(text: $text)
                    .bioEditorStyle
                    .border(Color.active,width: 4).clipShape(RoundedRectangle(cornerRadius: 7.5)).padding(5)
                    .onReceive(text.publisher.collect()) {
                        text = String($0.prefix(150))}
            }
        }
    }
}

