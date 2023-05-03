<div align="center">

<img alt="gif-header" src="https://github.com/lpsm-dev/personal-resume/blob/main/assets/coding.gif" width="225"/>

<h2>✨ Docker Crypto Miner ✨</h2>

[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)]()
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)]()
[![GitHub repo size](https://img.shields.io/github/repo-size/lpsm-dev/personal-resume)]()

---

<img alt="gif-about" src="https://github.com/lpsm-dev/personal-resume/blob/main/assets/hey.gif" width="300"/>

<h4>A containerized solution for mining cryptocurrencies using <a href=https://github.com/xmrig/xmrig>XMRig</a> miner</h4>

</div>

---

## ➤ Important Note

**This tool is only for educational and ethical practices. The developers are not responsible if the tool is misused by an individual. Use at your own risk. If you plan to mine on a cloud check the terms and conditions before you start. The same applies if you are using private equipment or an on-site datacenter.**

## ➤ Description

This repository contains a Docker setup that lets you go from zero to mining in about 5 minutes on any Linux host.

CPU mining can be profitable using algorithmns like: `RandomX`, `Cryptonight` or `Equihash`. Find out more about profitability [here](https://www.nicehash.com/profitability-calculator).

## ➤ Setup

The preferred way to configure XMRig is using a configuration file in JSON format because it is more flexible and user-friendly. CLI does not cover all features available and can be a limiting factor depending on the scenario.

| Name       	        | Description                 	|
|-------------------	|-----------------------------	|
| MINING_POOL       	| URL of mining server        	|
| MINING_COIN       	| Coin to mining              	|
| REFERRAL_CODE     	| Param to educe mining rater 	|
| WALLET_ADDRESS    	| Wallet address              	|
| WORKER_NAME       	| Worker name                 	|
| XMRIG_CONFIG_FILE 	| XMRig config file reference 	|

**Docker**

<details>
<summary>Container</summary>
<p>

Just a simple example that you can use to run this container:

```bash
docker container run \
  --restart unless-stopped --name crypto-miner -d \
  -e MINING_POOL="rx.unmineable.com:3333" \
  -e MINING_COIN="SHIB" \
  -e REFERRAL_CODE="7lkr-kmhq" \
  -e WALLET_ADDRESS="<your-wallet-address>" \
  -e WORKER_NAME="docker-mining" \
  ghcr.io/lpsm-dev/docker-crypto-miner:main
```

Click [here](https://github.com/lpsm-dev/docker-crypto-miner/pkgs/container/docker-crypto-miner/versions) to see available image tags.
</p>
</details>

<details>
<summary>Logs</summary>
<p>

Shows information logged of the running container:

```bash
docker logs -f crypto-miner
```

or

```bash
docker logs --tail 1000 crypto-miner
```
</p>
</details>


**Kubernetes**

<details>
<summary>Pods</summary>
<p>

<div align="center">

<img alt="gif-about" src=".github/assets/k9s.png" width="900"/>

</div>

For more information [here](./infra/README.md).
</p>
</details>

## ➤ Concepts

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

### Security

<div align="center">

<img alt="gif-about" src=".github/assets/security.jpg" width="375"/>

</div>

Pay attention to the images that you use for these purposes and protect yourself from cryptojacking. Containers have become frequent targets of threat actors who conduct malicious cryptocurrency mining and other attacks. Last year, Trend Micro came across activities of cryptocurrency miners that were deployed as rogue containers using a community-distributed image published on Docker Hub. In May, researchers found an open directory containing a malicious cryptocurrency miner and Distributed Denial of Service (DDoS) bot that targeted open Docker daemon ports. In the attack, an Alpine Linux container was created to host the cryptocurrency miner and DDoS bot.

## ➤ Links

- [XMRig configuration wizard](https://xmrig.com/wizard)
- [Unmineable](https://unmineable.com)
- [Profit Calculator](https://www.coincalculators.io)
- [Optimize CPU minning performance](https://www.nicehash.com/blog/post/how-to-optimize-cpu-mining-performance-for-monero-random-x)
- [Mining Reward Estimates](https://www.coinwarz.com)
- [Explain RandomX algorithm](https://academy.bit2me.com/en/which-mining-algorithm-randomx-monero)
- [What is ASIC?](https://academy.bit2me.com/pt/quem-s%C3%A3o-mineiros-asic)
- [Cloud Vultr](https://www.vultr.com)

## ➤ Author

👤 Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

>
> * Linktree: https://linktr.ee/lpmatos
>

## ➤ Versioning

To check the change history, please access the [**CHANGELOG.md**](CHANGELOG.md) file.

## ➤ Donations

Please consider [donating to the xmrig team](https://github.com/xmrig/xmrig#donations).

## ➤ Show your support

<div align="center">

Give me a ⭐️ if this project helped you!

<img alt="gif-header" src="https://www.icegif.com/wp-content/uploads/baby-yoda-bye-bye-icegif.gif" width="225"/>

Made with 💜 by [me](https://github.com/lpsm-dev) 👋 inspired on [readme-md-generator](https://github.com/kefranabg/readme-md-generator)

</div>
