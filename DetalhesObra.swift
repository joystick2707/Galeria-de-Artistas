import SwiftUI

/// View que exibe os detalhes completos de uma obra de arte selecionada.
struct DetalhesObraView: View {
    
    /// Obra de arte que será exibida nesta tela.
    let obra: ObraDeArte

    var body: some View {
        ScrollView {
            // Empilha os elementos verticalmente com espaçamento entre eles
            VStack(alignment: .leading, spacing: 16) {
                
                // Exibe a imagem principal da obra
                Image(obra.imagemNome)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity) // Ocupa toda a largura disponível
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20)) // Arredonda os cantos
                
                // Título da obra em destaque
                Text(obra.titulo)
                    .font(.title)
                    .bold()
                
                // Nome do artista
                Text("Artista: \(obra.artista)")
                    .font(.headline)
                
                // Ano de criação da obra
                Text("Ano: \(obra.ano)")
                    .font(.subheadline)
                
                // Estilo artístico
                Text("Estilo: \(obra.estilo)")
                    .font(.subheadline)
                
                Divider() // Linha divisória
                
                // Título da seção de descrição
                Text("Descrição")
                    .font(.headline)
                
                // Texto com a descrição completa da obra
                Text(obra.descricao)
                    .font(.body)
            }
            .padding() // Margem interna em toda a pilha
        }
        // Título da navigation bar com o nome da obra
        .navigationTitle(obra.titulo)
        //.navigationBarTitleDisplayMode(.inline) // (opcional) exibe o título de forma compacta
    }
}
