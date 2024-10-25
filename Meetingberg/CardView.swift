//
//  CardView.swift
//  Meetingberg
//
//  Created by Vladimir Vinageras on 26.06.2022.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading){
            VStack {
                Text(scrum.title)
                    .font(.headline)
                .accessibilityAddTraits(.isHeader)
            }
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                HStack {
                    Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                        .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
                }
            }
            .font(.caption)
            
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
        }
}
