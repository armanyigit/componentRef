import SwiftUI

struct ParticleEffectsView: View {
    @State private var isEmitting = false
    @State private var particles: [Particle] = []
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("Particle Effects")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                // Basic Particles
                VStack {
                    Text("Basic Particles")
                        .font(.headline)
                    
                    ZStack {
                        ForEach(particles) { particle in
                            Circle()
                                .fill(particle.color)
                                .frame(width: particle.size, height: particle.size)
                                .offset(x: particle.x, y: particle.y)
                                .opacity(particle.opacity)
                        }
                    }
                    .frame(width: 300, height: 300)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(20)
                }
                
                // Controls
                Button(isEmitting ? "Stop Particles" : "Start Particles") {
                    isEmitting.toggle()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .onReceive(timer) { _ in
                if isEmitting {
                    createParticle()
                }
                updateParticles()
            }
        }
    }
    
    func createParticle() {
        let particle = Particle(
            x: 0,
            y: 0,
            size: CGFloat.random(in: 5...15),
            color: [.red, .blue, .green, .yellow, .purple].randomElement()!,
            velocity: CGPoint(
                x: CGFloat.random(in: -5...5),
                y: CGFloat.random(in: -5...5)
            )
        )
        particles.append(particle)
    }
    
    func updateParticles() {
        for index in (0..<particles.count).reversed() {
            particles[index].update()
            if particles[index].opacity <= 0 {
                particles.remove(at: index)
            }
        }
    }
}

struct Particle: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    let size: CGFloat
    let color: Color
    var velocity: CGPoint
    var opacity: Double = 1.0
    
    mutating func update() {
        x += velocity.x
        y += velocity.y
        opacity -= 0.02
    }
}

#Preview {
    ParticleEffectsView()
} 