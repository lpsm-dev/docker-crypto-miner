<div align="center">

<img alt="gif-header" src="https://github.com/ci-monk/personal-resume/blob/main/assets/flow.gif" width="225"/>

<h2 align="center">✨ Docker crypto miner ✨</h2>

[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://gitlab.com/dry-group/cluster-management)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](https://gitlab.com/dry-group/cluster-management)
[![CI Status](https://github.com/lpmatos/docker-xmrig-miner/actions/workflows/ci.yml/badge.svg)](https://github.com/lpmatos/docker-xmrig-miner/actions/workflows/ci.yml)

---

<img alt="gif-about" src="https://github.com/ci-monk/personal-resume/blob/main/assets/coding.gif" width="275"/>


<p>✨ An opensource project to create a docker image of <a href=https://github.com/xmrig/xmrig>XMRig</a> miner and mining cryptocurrencies using containers ✨</p>

<p>
  <a href="#usage">Usage</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#concepts">Concepts</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#security">Security</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#versioning">Versioning</a>
</p>

</div>

---

## ➤ Important Note

**This tool is for educational and ethical practices only. The developers are not responsible if the tool is misused by an individual. Use at your own risk. If you plan to mine on a cloud check the terms and conditions before you start. The same applies if you are using private equipment or an on-site datacenter for mining.**

## ➤ Description <a name = "description"></a>

This repository contains a setup with Docker that let you get from zero to mining in around 5 minutes on any Linux host anywhere. CPU mining can be profitable using algorithmns like: RandomX, Cryptonight, or Equihash. Find out more about [profitability here](https://www.nicehash.com/profitability-calculator).

## ➤ Installation <a name = "installation"></a>

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
docker container run \
  --restart unless-stopped --name crypto-miner -d \
  -e MINING_POOL="rx.unmineable.com:3333" \
  -e MINING_COIN="SHIB" \
  -e REFERRAL_CODE="7lkr-kmhq" \
  -e WALLET_ADDRESS="<your-wallet-address>" \
  -e WORKER_NAME="docker-mining" \
  ghcr.io/lpmatos/docker-crypto-miner:main
```

Shows information logged of the running container:

```bash
docker logs -f crypto-miner
```

or

```bash
docker logs --tail 1000 crypto-miner
```

Click [here](https://github.com/lpmatos/docker-crypto-miner/pkgs/container/docker-crypto-miner/versions) to see available image tags.

## ➤ Concepts <a name = "concepts"></a>

This section aims to describe at a high level what the tools we use are and how we use them, without reproducing documentation that is better written (and more up to date) in the repositories and websites of these tools themselves. It's recommended to familiarize yourself with these tools as early as possible.

### XMRig

Basically XMRig is a free and open source mining program. It can be installed on Windows, Linux and macOS, and allows you to mine the RandomX algorithm. Here is a brief example of the run command:

```bash
xmrig.exe -o rx.unmineable.com:3333 -a rx -k -u COIN:YOUR_ADDRESS.WORKER_NAME#REFERRAL_CODE -p x pause
```

- **COIN**: it's the coin that you're extracting, for example: **ADA**, **TRX**, **WIN** or more. Also, keep the `:` symbol between the currency and your address.
- **YOUR_ADDRESS**: must be a valid address for the currency you choose, otherwise the pool will return an error, also be sure to check the supported network for some currencies like TRC20 for USDT mining (TRON address).
- **WORKER_NAME**: it's any name that you would like to define for your worker.
- **REFERRAL_CODE**: it's the parameter used to reduce the mining rate.

### Unmineable

The unmineable is a mining pool that enables anyone to become a miner using a personal computer.

### ASIC

The acronym ASIC describes a series of computer equipment designed from start to finish to deliver maximum performance in cryptocurrency mining tasks.

### RandomX

RandomX is a proof-of-work (PoW) algorithm that is optimized for general-purpose CPUs. RandomX uses random code execution (hence the name) together with several memory-hard techniques to minimize the efficiency advantage of specialized hardware.

### Mining Rig

A mining rig is a mining platform. The platform could be a dedicated miner where it was purchased, built and operated specifically for mining, or it could be a computer that meets other needs, such as a gaming system, and is used to mine only on a part-time.

### CPU Limit

The cpulimit is a tool that allow us to limit CPU usage per process. It gives us some ways to identify the desired process, either by process name, PID or executable path. It's useful for controlling batch jobs when you don't want them eat too many CPU cycles. The purpose is to prevent a process from running for more than a specified proportion of time. In addition, it's also able to adapt to the overall system load dynamically and quickly.

## ➤ Security <a name = "security"></a>

<div align="center">

<img alt="gif-about" src="https://documents.trendmicro.com/images/TEx/articles/Docker%20Infection%20Chain-01.jpg" width="450"/>

</div>

Pay attention to the images that you use for these purposes and protect yourself from cryptojacking. Containers have become frequent targets of threat actors who conduct malicious cryptocurrency mining and other attacks. Last year, Trend Micro came across activities of cryptocurrency miners that were deployed as rogue containers using a community-distributed image published on Docker Hub. In May, researchers found an open directory containing a malicious cryptocurrency miner and Distributed Denial of Service (DDoS) bot that targeted open Docker daemon ports. In the attack, an Alpine Linux container was created to host the cryptocurrency miner and DDoS bot.

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

## ➤ Inspirations <a name = "inspirations"></a>

- Thanks [@rundqvist](https://github.com/rundqvist/docker-unmineable) for sharing your project.

## ➤ Versioning <a name = "versioning"></a>

To check the change history, please access the [**CHANGELOG.md**](CHANGELOG.md) file.

## ➤ Project status <a name = "project-status"></a>

Currently the project is being maintained and constantly changing with new features. 👾

## ➤ Donations <a name = "donations"></a>

Please consider [donating to the xmrig team](https://github.com/xmrig/xmrig#donations), and if you find this docker image useful, donations for work on dockerizing the build and mining app are appreciated at any of the folllowing addresses:

<p align="center">
  <a href="https://www.blockchain.com/pt/btc/address/bc1qn50elv826qs2qd6xhfh6n79649epqyaqmtwky5">
    <img alt="BTC Address" src="https://img.shields.io/badge/BTC%20Address-black?style=for-the-badge&logo=bitcoin&logoColor=white">
  </a>

  <a href="https://live.blockcypher.com/ltc/address/ltc1qwzrxmlmzzx68k2dnrcrplc4thadm75khzrznjw/">
    <img alt="Litecoin Address" src="https://img.shields.io/badge/Litecoin%20Address-black?style=for-the-badge&logo=litecoin&logoColor=white">
  </a>
</p>

## ➤ Show your support <a name = "show-your-support"></a>

<div align="center">

Give me a ⭐️ if this project helped you!

<img alt="gif-header" src="https://www.icegif.com/wp-content/uploads/baby-yoda-bye-bye-icegif.gif" width="225"/>

Made with 💜 by [me](https://github.com/lpmatos) 👋 inspired on [readme-md-generator](https://github.com/kefranabg/readme-md-generator)

</div>
