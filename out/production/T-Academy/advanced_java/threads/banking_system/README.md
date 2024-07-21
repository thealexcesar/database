Programação Concorrente e Paralela

# Sistema Bancário

Você deve implementar um sistema bancário simples que simula transações bancárias concorrentes (depósitos e retiradas) em várias contas. Utilizando threads, você deverá simular vários clientes acessando e modificando contas ao mesmo tempo. Use sincronização para evitar condições de corrida e garantir a integridade dos dados.

**Requisitos:**

1. Crie uma classe **Account** que represente uma conta bancária com métodos para depositar e retirar dinheiro.
2. Crie uma classe **Bank** que contenha um conjunto de contas e métodos para acessar e modificar essas contas.
3. Crie múltiplas threads que simulem clientes realizando depósitos e retiradas nas contas.
4. Use sincronização para garantir que as operações nas contas sejam atômicas e que os saldos das contas estejam corretos após todas as operações.
5. Cada transação (depósito ou retirada) deve ser registrada com data e hora.
6. Implemente um mecanismo para exibir o histórico de transações de cada conta, incluindo a data, hora, tipo de transação e valor.

**Instruções:**

- A classe **Account** deve ter um campo **balance** e métodos **deposit** e **withdraw**, ambos sincronizados.
- A classe **Bank** deve manter um **Map<Integer, Account>** para armazenar as contas e métodos para realizar transações.
- Implemente a classe **CustomerThread** que estenda **Thread** e simule a execução de transações em uma conta específica.
- Crie um método **main** que inicialize várias contas e inicie múltiplas **CustomerThread** para simular transações concorrentes.

# Processamento de Arquivos de Log

Você foi encarregado de desenvolver uma aplicação que processa grandes volumes de arquivos de log. Cada arquivo de log deve ser lido e processado para contar o número de ocorrências de uma palavra específica. Utilize a programação paralela para dividir a tarefa entre múltiplos núcleos de CPU, aumentando a eficiência do processamento.

**Requisitos:**

1. Crie uma classe **LogProcessor** que implemente a interface **Callable<Integer>** e processe um arquivo de log para contar as ocorrências de uma palavra específica.
2. Crie uma classe **ParallelLogProcessor** que gerencie a execução paralela do processamento de múltiplos arquivos de log.
3. Utilize um **ExecutorService** com um pool de threads para processar os arquivos em paralelo.
4. Agregue os resultados de todas as threads para obter o total de ocorrências da palavra nos arquivos de log.

**Instruções:**

- A classe **LogProcessor** deve ter um construtor que aceite o caminho do arquivo de log e a palavra a ser contada.
- Implemente o método **call** da interface **Callable<Integer>** para ler o arquivo e contar as ocorrências da palavra.
- A classe **ParallelLogProcessor** deve inicializar um **ExecutorService** com um pool de threads fixo e submeter múltiplas instâncias de **LogProcessor** para processamento.
- Implemente um método **main** que inicialize a **ParallelLogProcessor**, passe uma lista de arquivos de log e a palavra a ser contada, e exiba o total de ocorrências após o processamento.