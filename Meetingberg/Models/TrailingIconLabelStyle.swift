//
//  TrailingIconLabelStyle.swift
//  Meetingberg
//
//  Created by Vladimir Vinageras on 26.06.2022.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
        }
    }
}


extension LabelStyle where Self == TrailingIconLabelStyle{
    static var trailingIcon: Self {Self()}
}
