<div align="center">

<p>
  <img alt="gif-header" src="https://cdn.hackernoon.com/hn-images/0*KyeIBTwEiX6_sE06" width="350px" float="center"/>
</p>

<h2 align="center">✨ XMRig Miner ✨</h2>

<div align="center">

[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://gitlab.com/dry-group/cluster-management)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](https://gitlab.com/dry-group/cluster-management)
[![CI Status](https://github.com/lpmatos/docker-xmrig-miner/actions/workflows/ci.yml/badge.svg)](https://github.com/lpmatos/docker-xmrig-miner/actions/workflows/ci.yml)

</div>

---

<p align="center">
  <img alt="gif-about" src="https://thumbs.gfycat.com/GrizzledRemoteHornet-small.gif" width="450px" float="center"/>
</p>

<p align="center">
  ✨ An opensource project to mine using containers ✨
</p>

<p align="center">
  <a href="#getting-started">Getting Started</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#contributing">Contributing</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#versioning">Versioning</a>
</p>

</div>

---

## ➤ Getting Started <a name = "getting-started"></a>

If you want contribute on this project, first you need to make a **git clone**:

>
> 1. git clone --depth 1 <https://github.com/lpmatos/docker-xmrig-miner.git> -b main
>

This will give you access to the code on your **local machine**.

## ➤ Usage <a name = "usage"></a>

A forma preferida de configurar o XMRig é utilizando um arquivo de configuração no formato JSON, pois é mais flexível e amigável. O CLI não cobre todos os recursos disponíveis, podendo ser um fator de limitação dependendo do cenário.

| Environment       	| Description                 	|
|-------------------	|-----------------------------	|
| MINING_POOL       	| URL of mining server        	|
| MINING_COIN       	| Coin to mining              	|
| REFERRAL_CODE     	| Param to educe mining rater 	|
| WALLET_ADDRESS    	| Wallet Address              	|
| WORKER_NAME       	| Worker name                 	|
| XMRIG_CONFIG_FILE 	| XMRig config file reference 	|

## ➤ Concepts <a name = "concepts"></a>

### XMRig

Basicamente o XMRig é um programa de mineração gratuito e com código-fonte aberto. Ele pode ser instalado no Windows, Linux e macOS, e permite que você minere o algoritmo RandomX. Aqui está um breve exemplo do comando de execução:

```bash
xmrig.exe -o rx.unmineable.com:3333 -a rx -k -u COIN:YOUR_ADDRESS.WORKER_NAME#REFERRAL_CODE -p x pause
```

- **COIN**: é a moeda que você está extraindo, por exemplo: ADA, TRX, WIN ou mais. Além disso, mantenha o símbolo ":" entre a moeda e o seu endereço.
- **YOUR_ADDRESS**: deve ser um endereço válido para a moeda que você escolher, caso contrário, o pool retornará um erro, também certifique-se de verificar a rede suportada para algumas moedas, como TRC20 para mineração USDT (endereço TRON).
- **WORKER_NAME**: é simplesmente qualquer nome que você gostaria de definir para seu trabalhador, para identificá-lo no site.
- **REFERRAL_CODE**: é um parâmetro usado para reduzir a taxa de mineração.

### Unmineable

O Unmineable.com é um pool de mineração que possibilita que qualquer um se torne um minerador utilizando um computador pessoal.

### RandbonX

RandomX é o nome do novo algoritmo de mineração para Monero, a moeda de privacidade cujo objetivo é manter a rede protegida contra mineração ASIC, permitindo apenas mineração por CPU, e ao mesmo tempo proporcionando enorme segurança ao seu protocolo e blockchain.

A operação aproximada de RandomX está escrita em seu nome: a aleatoriedade é sua premissa principal . Mas o que isso significa? Bem, isso significa que RandomX é projetado para criar uma "zona de trabalho" ou bloco de notas completamente aleatório, com alto consumo de memória, e que usa técnicas de virtualização avançadas para seu funcionamento. Esses três pilares permitem que o RandomX seja resistente ao ASIC.

Na verdade, RandomX não é apenas resistente a ASIC, mas também resistente a GPU, já que esses chips não têm as instruções necessárias para executar as operações RandomX complicadas em primeiro lugar. Como resultado, o RandomX busca ser um algoritmo de mineração apenas de CPU, oferecendo a maior resistência possível a outros tipos de mineração. Por outro lado, também visa evitar os chamados botnets muito famosos do Monero, pois o RandomX os tornará quase impossíveis de implementar. Especialmente em dispositivos de baixo consumo de energia, como Smart TV ou dispositivos IoT (Internet of Things ou Internet of Things).

### ASIC

O acrônimo ASIC descreve uma série de equipamentos de computador projetados do início ao fim para oferecer o máximo desempenho em tarefas de mineração de criptomoeda.

Atualmente, o poder computacional da rede Bitcoin é tão alto que torna impossível a mineração de qualquer outra maneira. ASICs nada mais são do que equipamentos de computador baseados em circuitos ou chips integrados e desenvolvidos para executar funções muito específicas.

Os ASICs se tornaram populares no Bitcoin, tornando-se o conjunto otimizado de processadores específicos por excelência para mineração de blocos.

### Mining Rig

Uma mining rig é uma plataforma de mineração. A plataforma pode ser um minerador dedicado onde foi adquirida, construída e operada especificamente para mineração ou pode ser um computador que atende a outras necessidades, como um sistema de jogo, e é usado para minerar apenas em regime de meio período.

### CPU Limit

O cpulimit é um utilitário que nos permite limitar o uso da CPU por processo. Ele nos fornece algumas formas de identificar o processo desejado, seja por nome do processo, PID ou caminho do executável.

É útil para controlar trabalhos em lote, quando você não quer que eles comam muitos ciclos de CPU. O objetivo é impedir que um processo seja executado por mais de uma proporção de tempo especificada. Isso não altera o valor agradável ou outras configurações de prioridade de agendamento, mas o uso real da CPU. Além disso, é capaz de se adaptar à carga geral do sistema de forma dinâmica e rápida. O controle da quantidade de CPU utilizada é feito enviando sinais SIGSTOP e SIGCONT POSIX aos processos. Todos os processos filhos e threads do processo especificado compartilharão a mesma porcentagem de CPU.

## ➤ Links <a name = "links"></a>

- [XMRig](https://xmrig.com)
- [XMRig configuration wizard](https://xmrig.com/wizard)
- [Unmineable](https://unmineable.com)
- [Profit Calculator](https://www.coincalculators.io)
- [Optimize CPU minning performance](https://www.nicehash.com/blog/post/how-to-optimize-cpu-mining-performance-for-monero-random-x)
- [Mining Reward Estimates](https://www.coinwarz.com)
- [Explain RandomX algorithm](https://academy.bit2me.com/en/which-mining-algorithm-randomx-monero)
- [What is ASIC?](https://academy.bit2me.com/pt/quem-s%C3%A3o-mineiros-asic)
- [Cloud Vultr](https://www.vultr.com)

## ➤ Author <a name = "author"></a>

👤 Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

>
> * Email: lpsm-dev@protonmail.com
> * Linktree: https://linktr.ee/lpmatos
>

## ➤ Versioning <a name = "versioning"></a>

To check the change history, please access the [**CHANGELOG.md**](CHANGELOG.md) file.

## ➤ Project status <a name = "project-status"></a>

Currently the project is being maintained and constantly changing with new features.

## ➤ Show your support <a name = "show-your-support"></a>

<div align="center">

Give me a ⭐️ if this project helped you!

<p>
  <img alt="gif-header" src="https://www.icegif.com/wp-content/uploads/baby-yoda-bye-bye-icegif.gif" width="350px" float="center"/>
</p>

Made with 💜 by [me](https://github.com/lpmatos) :wave: inspired on [readme-md-generator](https://github.com/kefranabg/readme-md-generator)

</div>
