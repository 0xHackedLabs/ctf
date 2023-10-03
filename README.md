## 0xHacked x OtterSec CTF

We've prepared the test framework so that you can debug the challenge locally.

``` bash
forge test -vv / forge test -vv --match-test [name]
```

For more details, please visit [Exploit.t.sol](https://github.com/0xHackedLabs/ctf/blob/main/test/Exploit.t.sol).

### how to generate the proof via [0xHacked Online Tool](https://www.0xhacked.com/tool)

Take [Random](https://github.com/0xHackedLabs/ctf/tree/main/src/Demo) as an example.

<img width="620" alt="image" src="https://github.com/0xHackedLabs/ctf/assets/89996793/b7c721f2-4e0f-482e-ab44-9e7b595eaf1a">

After debugging the exploit.sol locally, open [0xHacked Online Tool](https://www.0xhacked.com/tool).
1. Switch Network to **CTF**
2. According to the [Random Challenge](https://ctf.0xhacked.com/challenges#Random-4), fill in the block number as 3，
3. Upload the exploit.sol
4. Click "Run", once you wait for a few minutes (usually it's up to 4 min), you will be able to download the proof below and submit it to [Random Challenge](https://ctf.0xhacked.com/challenges#Random-4).

<img width="1052" alt="image" src="https://github.com/0xHackedLabs/ctf/assets/89996793/1c37f79f-cc57-4cda-950d-42aff3213c52">

# Acknowledgement

Thanks for co-hosting with [OtterSec](https://osec.io). Also, thanks for [RISC Zero](https://www.risczero.com/)'s sponsorship and hardware support provided by Bonsai Network.
