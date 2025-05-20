import SwiftUI

/// View principal da aplicação que exibe uma galeria de obras de arte.
struct ContentView: View {
    
    /// Lista de obras de arte exibidas na galeria.
    private let obras: [ObraDeArte] = [
        ObraDeArte(
            id: UUID(),
            titulo: "Painel da Roda de Ferro",
            artista: "Poty Lazzarotto",
            ano: 1972,
            estilo: "Gravura em concreto",
            imagemNome: "poty_roda_ferro",
            descricao: "Painel localizado na Praça 19 de Dezembro, em Curitiba, representando cenas do cotidiano paranaense."
        ),
        ObraDeArte(
            id: UUID(),
            titulo: "Tigre Esmagando a Cobra",
            artista: "Ida Hannemann de Campos",
            ano: 1944,
            estilo: "Escultura em bronze",
            imagemNome: "oao_turin_tigre",
            descricao: "Escultura premiada no Salão Nacional de Belas Artes, localizada na Avenida Manoel Ribas, em Curitiba"
        ),
        ObraDeArte(
            id: UUID(),
            titulo: "Natureza Morta",
            artista: "Alfredo Andersen",
            ano: 1972,
            estilo: "Pintura",
            imagemNome: "ida_natureza_morta",
            descricao: "Obra pertencente ao acervo do Museu de Arte Contemporânea do Paraná, destacando a experimentação artística da autora"
        ),
        ObraDeArte(
            id: UUID(),
            titulo: "Paisagem com Canoa na Margem",
            artista: "Pablo Picasso",
            ano: 1922,
            estilo: "Pintura",
            imagemNome: "andersen_paisagem_canoa",
            descricao: "Obra representativa do 'Pai da Pintura Paranaense', retratando cenas litorâneas do Paraná"
        )
    ]
    
    /// Layout da grade adaptável para exibir as obras.
    let colunas = [GridItem(.adaptive(minimum: 150))]
    
    /// Estado para controlar qual obra foi selecionada.
    @State private var obraSelecionada: ObraDeArte? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                // Exibe as obras em uma grade adaptável
                LazyVGrid(columns: colunas, spacing: 16) {
                    ForEach(obras) { obra in
                        VStack {
                            // Miniatura da imagem da obra
                            Image(obra.imagemNome)
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            // Título da obra
                            Text(obra.titulo)
                                .font(.headline)
                                .lineLimit(1)
                            
                            // Nome do artista
                            Text(obra.artista)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .onTapGesture {
                            // Define a obra selecionada quando o usuário toca
                            obraSelecionada = obra
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Galeria de Arte")
            .background(
                // Navegação para a tela de detalhes da obra
                NavigationLink(
                    destination: DetalhesObraView(obra: obraSelecionada ?? obras[0]),
                    isActive: Binding(
                        get: { obraSelecionada != nil },
                        set: { ativo in
                            if !ativo { obraSelecionada = nil }
                        }
                    ),
                    label: { EmptyView() }
                )
                .hidden() // Esconde o link visualmente, ele é ativado via código
            )
        }
    }
}
