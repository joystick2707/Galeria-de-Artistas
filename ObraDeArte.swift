import Foundation

struct ObraDeArte: Identifiable {
    
    /// Identificador único da obra.
    let id: UUID

    let titulo: String
    
    let artista: String
    
    let ano: Int
    let estilo: String
    
    /// Nome do arquivo da imagem associada à obra no Assets.
    let imagemNome: String
    
    let descricao: String
}
