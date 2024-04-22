//
//  ButtonWrapper.swift
//  SwiftUIDataFlow
//
//  Created by 조유진 on 4/22/24.
//

import SwiftUI

private struct ButtonWrapper: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(action: action, label: { content })
    }
}

extension View {
    func wrapToButton(action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapper(action: action))
    }
}
