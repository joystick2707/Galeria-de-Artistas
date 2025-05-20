import SwiftUI

struct ContentView: View {
    @State private var obras: [ObraDeArte] = [
        ObraDeArte(id: UUID(), titulo: "O Grito", artista: "Edvard Munch", ano: 1893, estilo: "Expressionismo", imagemNome: "paintpalette", descricao: "Uma das obras mais icônicas do expressionismo."),
        ObraDeArte(id: UUID(), titulo: "A Noite Estrelada", artista: "Vincent van Gogh", ano: 1889, estilo: "Pós-impressionismo", imagemNome: "moon.stars", descricao: "Van Gogh retratou a vista da janela do asilo onde estava internado."),
        ObraDeArte(id: UUID(), titulo: "Mona Lisa", artista: "Leonardo da Vinci", ano: 1503, estilo: "Renascimento", imagemNome: "person.crop.square", descricao: "Talvez o retrato mais famoso do mundo."),
        ObraDeArte(id: UUID(), titulo: "Guernica", artista: "Pablo Picasso", ano: 1937, estilo: "Cubismo", imagemNome: "cube", descricao: "Denúncia contra os horrores da guerra civil espanhola.")
    ]

    let colunas = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: colunas, spacing: 16) {
                    ForEach(obras) { obra in
                        NavigationLink(destination: DetalhesObraView(obra: obra)) {
                            VStack {
                                Image(systemName: obra.imagemNome)
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                    .background(Color.blue.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                
                                Text(obra.titulo)
                                    .font(.headline)
                                    .lineLimit(1)
                                
                                Text(obra.artista)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Galeria de Arte")
        }
    }
}
