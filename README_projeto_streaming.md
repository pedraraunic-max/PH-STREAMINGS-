# Projeto Streaming

Arquivo SQL base com esquema completo e exemplos de população.

Relacionamentos:
- Plano 1:N Assinatura
- Usuario 1:1 Assinatura
- Usuario 1:N Dispositivo
- Usuario N:N Conteudo via Historico_Reproducao
- Usuario N:N Conteudo via Avaliacao
- Conteudo N:N Categoria via Conteudo_Categoria

Normalização: atributos atômicos (1FN), sem dependências parciais (2FN) e sem dependências transitivas (3FN).
