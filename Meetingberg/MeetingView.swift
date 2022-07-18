//
//  ContentView.swift
//  Meetingberg
//
//  Created by Vladimir Vinageras on 25.06.2022.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum : DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    private var palyer: AVPlayer {AVPlayer.sharedDingPlayer}
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                MeetingTimerView(speakers: scrumTimer.speakers, isRecording: isRecording,theme: scrum.theme)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
             
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear{
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            speechRecognizer.reset()
            speechRecognizer.transcribe()
            isRecording = true
            scrumTimer.startScrum()
        }
        .onDisappear{
            scrumTimer.stopScrum()
            speechRecognizer.stopTranscribing()
            isRecording = false
            let newHistory = History(attendees: scrum.attendees, lengthInMinutes: scrum.timer.secondsElapsed/60, transcript: speechRecognizer.transcript)
            scrum.history.insert(newHistory, at: 0)
            }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MeeintgView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
