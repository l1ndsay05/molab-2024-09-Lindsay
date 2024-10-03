//
//  ContentView.swift
//  week04
//
//  Created by linds on 2024-10-03.
// audio files from freesound.org

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?


struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                    NavigationLink(destination: DogView()) {
                        Text("Dog Barking 🐶")
                    }
                    //new view
                    NavigationLink(destination: CatView()) {
                        Text("Cat Meowing 🐱")
                    }
                    NavigationLink(destination:
                        BirdView()) {
                        Text("Bird Chirping 🐦")
                    }
                    NavigationLink(destination: PigView()) {
                        Text("Pig Oinking 🐷")
                    }
                    NavigationLink(destination: RandomView()) {
                        Text("Generate Random Sound 🙉")
                }
            }
            .navigationTitle("Animal Noises")
        }
    }
}

struct DogView: View {
    var body: some View {
        Text("This is the Dog View")
        //play sound
        Button("Play Sound"){
            playSound(sound: "612857__weakwero__dog-bark", type: "wav")
        }
        Button("Stop Sound"){
            stopSound()
        }
    }
}

struct CatView: View {
    var body: some View {
        Text("This is the Cat View")
        // play sound
        Button("Play Sound"){
            playSound(sound: "110010__tuberatanka__cat-meow-ii", type: "wav")
        }
        Button("Stop Sound"){
            stopSound()
        }
    }
}

struct BirdView: View {
    var body: some View {
        Text("This is the Bird View")
        Button("Play Sound"){
            playSound(sound: "96195__ifartinurgeneraldirection__carolina-wren-chirping", type: "wav")
        }
        Button("Stop Sound"){
            stopSound()
        }
    }
}

struct PigView: View {
    var body: some View {
        Text("This is Pig View")
        Button("Play Sound"){
            playSound(sound: "442906__qubodup__pig-oink", type: "wav")
        }
        Button("Stop Sound"){
            stopSound()
        }
    }
}

struct RandomView: View {
    var body: some View {
        Text("This is Random View")
        Button("Play Random Sound") {
                        let sounds = ["612857__weakwero__dog-bark", "110010__tuberatanka__cat-meow-ii", "96195__ifartinurgeneraldirection__carolina-wren-chirping", "442906__qubodup__pig-oink"]
                        let randomSound = sounds.randomElement() ?? "612857__weakwero__dog-bark"
                        playSound(sound: randomSound, type: "wav")
        }
        Button("Stop Sound"){
            stopSound()
        }
    }
}

#Preview {
    ContentView()
}


func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find or play the sound file.")
        }
    }
}

func stopSound() {
    audioPlayer?.stop()
}
