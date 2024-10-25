//
//  ThemePicker.swift
//  Meetingberg
//
//  Created by Vladimir Vinageras on 29.06.2022.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases){theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
            
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
