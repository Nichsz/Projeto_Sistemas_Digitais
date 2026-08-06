# Projeto_Sistemas_Digitais

Este repositório contém a implementação prática e os dados experimentais desenvolvidos para o projeto final da disciplina de Sistemas Digitais ministrada pelo professor José Artur Quilici Gonzalez.

## Ferramentas utilizadas

*   GHDL - Compilação e execução do código
*   GTKWave - Visualização dos casos de teste
*   Quartus Prime Lite - Integração do código à placa FPGA

---

## Resumo do Projeto
Este relatório descreve o desenvolvimento, simulação e implementação de um somador sinal-magnitude de 4 bits descrito em VHDL, simulado no GTKWave, sintetizado no Quartus Prime Lite e implementado em uma placa FPGA DE10-Lite. O projeto teve como principal objetivo validar o comportamento do circuito, especialmente nos casos de _overflow_. A metodologia adotada envolveu a modelagem do código em VHDL e validação dos resultados utilizando o software de simulação GTKWave. As simulações confirmaram o truncamento nos casos onde houve _overflow_. Após a verificação em _software_, o sistema foi sintetizado no Quartus Prime Lite e implementado na placa, usando chaves deslizantes e _displays_ de sete segmentos. Os testes práticos confirmaram o comportamento simulado, apresentando plena equivalência e demonstrando o êxito do projeto.

---

## Como reproduzir o experimento

Segue um sucinto tutorial tal qual uma pessoa com conhecimentos básicos acerca do assunto
consiga reproduzir o experimento:
Observação. Os arquivos mencionados abaixo podem ser encontrados no presente repositório

1. Criar um novo projeto no Quartus Prime Lite, selecionando a família MAX 10 FPGA e o dispositivo 10M50DAF484C7G, vhd correspondente à placa DE10-Lite.
2. Adicionar ao projeto o arquivo somador.vhd, contendo a entity somador (portas SW_A, SW_B, HEX0 a HEX5), e defini-lo como Top-Level Entity.
3. Importar o arquivo de restrições somador_DE10LITE.qsf, que já atribui os pinos físicos da placa a cada entrada e saída: SW_A[3..0] nas chaves SW3–SW0 (pinos C12, D12, C11, C10) e SW_B[3..0] nas chaves SW7–SW4 (pinos A14, A13, B12, A12), além dos seis grupos de pinos HEX0 a HEX5 correspondentes aos displays de 7 segmentos da placa.
4. Compilar o projeto (Start Compilation)
5. Em seguida, na seção Task, dê dois cliques na opção Program Device (Open Programmer), com a DE10-Lite conectada via USB-Blaster e Mode: JTAG.
6. Ajustar as chaves SW0–SW3 (operando A) e SW4–SW7 (operando B) em sinal-magnitude, sendo a chave mais significativa de cada grupo (SW3 para A e SW7 para B) responsável por definir o sinal (1 = negativo, 0 = positivo).
7. Observar diretamente, sem necessidade de nenhum botão, os seis displays de 7 segmentos: HEX5/HEX4 exibem o sinal e a magnitude de A; HEX3/HEX2, o sinal e a magnitude de B; e HEX1/HEX0, o sinal e a magnitude do resultado da soma, atualizados em tempo real a cada mudança nas chaves.
   
Para a simulação funcional prévia, recomenda-se compilar os arquivos com o GHDL (ghdl -a seguido de ghdl -r com geração de arquivo .ghw ou .vcd) e visualizar as formas de onda no GTKWave, aplicando diferentes combinações de sinais e magnitudes nos operandos de teste.

---

## Integrantes do Grupo
Trabalho acadêmico desenvolvido em colaboração pelos integrantes:

*   **Integrante 1** - Guilherme Pedro da Silva Lima RA: `11202420314` 
*   **Integrante 2** - Luís Emílio Gonçalves Mendes RA: `11202421308` 
*   **Integrante 3** - Nicholas Fernandez Garcia RA: `11202421369`
*   **Integrante 4** - Pietro Kuszlewicz Perez RA: `11202420430` 

---


## Artigo e Vídeo
Se deseja saber mais sobre o nosso projeto, acesse os documentos abaixo:

*   [📘 Artigo Científico - (PDF)](resultados/Artigo_SD.pdf)
*   [📊 Vídeo Resultado - (MP4)](resultados/resultado_FPGA.mp4)
