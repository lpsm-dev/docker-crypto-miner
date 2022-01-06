<div align="center">

<p>
  <img alt="gif-header" src="https://cdn.hackernoon.com/hn-images/0*KyeIBTwEiX6_sE06" width="350px" float="center"/>
</p>

<h2 align="center">✨ Docker crypto miner ✨</h2>

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
  ✨ An opensource project to create a dockerfile of <a href=https://github.com/xmrig/xmrig>XMRig</a> miner and mining using containers ✨
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
> 1. git clone --depth 1 <https://github.com/lpmatos/docker-crypto-miner.git> -b main
>

This will give you access to the code on your **local machine**.

## ➤ Important Note

**This tool is for educational and ethical practices only. The developers are not responsible if the tool is misused by an individual.**

## ➤ Installation

```bash
docker pull ghcr.io/lpmatos/docker-crypto-miner:main
```

## ➤ Setup <a name = "setup"></a>

The preferred way to configure XMRig is using a configuration file in JSON format because it is more flexible and user-friendly. CLI does not cover all features available and can be a limiting factor depending on the scenario.

| Environment       	| Description                 	|
|-------------------	|-----------------------------	|
| MINING_POOL       	| URL of mining server        	|
| MINING_COIN       	| Coin to mining              	|
| REFERRAL_CODE     	| Param to educe mining rater 	|
| WALLET_ADDRESS    	| Wallet address              	|
| WORKER_NAME       	| Worker name                 	|
| XMRIG_CONFIG_FILE 	| XMRig config file reference 	|

## ➤ Docker <a name = "docker"></a>

To run the docker container:

```bash
docker container run --restart unless-stopped \
  --name crpto-miner -d --read-only --rm \
  -e MINING_POOL="rx.unmineable.com:3333" \
  -e MINING_COIN="SHIB" \
  -e REFERRAL_CODE="7lkr-kmhq" \
  -e WALLET_ADDRESS="<your-wallet-address>" \
  -e WORKER_NAME="docker-mining" \
  ghcr.io/lpmatos/docker-crypto-miner:main
```

Click [here](https://github.com/lpmatos/docker-crypto-miner/pkgs/container/docker-crypto-miner/versions) to see available image tags.

## ➤ Concepts <a name = "concepts"></a>

This section aims to describe at a high level what the tools we use are and how we use them, without reproducing documentation that is better written (and more up to date) in the repositories and websites of these tools themselves. It's recommended to familiarize yourself with these tools as early as possible.

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

## ➤ Author <a name = "author"></a>

👤 Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

>
> * Linktree: https://linktr.ee/lpmatos
>

## ➤ Versioning <a name = "versioning"></a>

To check the change history, please access the [**CHANGELOG.md**](CHANGELOG.md) file.

## ➤ Project status <a name = "project-status"></a>

Currently the project is being maintained and constantly changing with new features. 👾

## ➤ Donations <a name = "donations"></a>

If you find this docker image useful, donations for work on dockerizing the build and mining app are appreciated at any of the folllowing addresses:

<p align="center">
  <a href="https://www.blockchain.com/pt/btc/address/bc1qn50elv826qs2qd6xhfh6n79649epqyaqmtwky5">
    <img alt="BTC Address" src="https://img.shields.io/badge/BTC%20Address-black?style=for-the-badge&logo=bitcoin&logoColor=white">
  </a>

  <a href="https://live.blockcypher.com/ltc/address/ltc1qwzrxmlmzzx68k2dnrcrplc4thadm75khzrznjw/">
    <img alt="Litecoin Address" src="https://img.shields.io/badge/Litecoin%20Address-black?style=for-the-badge&logo=litecoin&logoColor=white">
  </a>
</p>

Please consider [donating to the xmrig team](https://github.com/xmrig/xmrig#donations).

## ➤ Show your support <a name = "show-your-support"></a>

<div align="center">

Give me a ⭐️ if this project helped you!

<p>
  <img alt="gif-header" src="https://www.icegif.com/wp-content/uploads/baby-yoda-bye-bye-icegif.gif" width="350px" float="center"/>
</p>

Made with 💜 by [me](https://github.com/lpmatos) 👋 inspired on [readme-md-generator](https://github.com/kefranabg/readme-md-generator)

</div>
