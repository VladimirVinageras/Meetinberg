//
//  SpeakerArc.swift
//  Meetingberg
//
//  Created by Vladimir Vinageras on 07.07.2022.
//

import SwiftUI

struct SpeakerArc: Shape{
    let speakerIndex: Int
    let totalSpeakers: Int
    
    private var degreesPerSpeaker : Double {
        360.0 / Double(totalSpeakers)
    }
    
    private var startAngle : Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
    
    
    func path(in rect: CGRect) -> Path {
        let diametr = min(rect.size.width, rect.size.height) - 24
        let radius = diametr / 2.0
        let center = CGPoint(x: rect.midX,y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}