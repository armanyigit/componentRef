import SwiftUI

struct ProgressExampleView: View {
    @State private var progress = 0.0
    @State private var isLoading = true
    @State private var downloadProgress = 0.0
    @State private var isDownloading = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // Indeterminate Progress
                VStack {
                    Text("Activity Indicator")
                        .font(.headline)
                    
                    ProgressView()
                        .controlSize(.large)
                }
                
                // Circular Progress
                VStack {
                    Text("Circular Progress")
                        .font(.headline)
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 20)
                            .opacity(0.1)
                            .foregroundColor(.blue)
                        
                        Circle()
                            .trim(from: 0.0, to: progress)
                            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                            .foregroundColor(.blue)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeInOut, value: progress)
                        
                        Text("\(Int(progress * 100))%")
                            .font(.title)
                            .bold()
                    }
                    .frame(width: 200, height: 200)
                }
                
                // Linear Progress
                VStack {
                    Text("Linear Progress")
                        .font(.headline)
                    
                    ProgressView(value: downloadProgress)
                        .progressViewStyle(.linear)
                        .frame(width: 200)
                    
                    Button(isDownloading ? "Cancel" : "Start Download") {
                        isDownloading.toggle()
                        if !isDownloading {
                            downloadProgress = 0
                        }
                    }
                    .buttonStyle(.bordered)
                }
                
                // Custom Progress Ring
                VStack {
                    Text("Custom Progress Ring")
                        .font(.headline)
                    
                    ProgressRing(progress: progress)
                        .frame(width: 100, height: 100)
                }
            }
            .padding()
            .onReceive(timer) { _ in
                if progress < 1.0 {
                    progress += 0.01
                }
                if isDownloading && downloadProgress < 1.0 {
                    downloadProgress += 0.02
                }
            }
        }
        .navigationTitle("Progress & Activity")
    }
}

struct ProgressRing: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.blue.opacity(0.5),
                    lineWidth: 10
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.blue,
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
    }
}

#Preview {
    NavigationView {
        ProgressExampleView()
    }
} 