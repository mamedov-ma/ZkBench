

### Test case description

Iterated hashing is an essential building block for Merkle tree structures and whenever one needs to succinctly commit larger amounts of data.

To benchmark iterative hashing we compute a _hash chain_ as `H(H(H(...H(x))))`, where `H()` is a cryptographic hash function, for some input `x`. As input `x`, we chose a 32-bytes input `[0_u8; 32]` and the number of invocations of `H()` defines the length of the hash chain.

#### Prover performance

The table below shows the time it takes to generate a proof for a hash chain of a given length using a given hash function. This time includes the time needed to generate the witness for the computation. The time shown is in **seconds**.

<table>
    <thead>
        <tr>
            <th rowspan=2 colspan=2>Prover time (sec)</th>
            <th colspan=2>SHA256</th>
            <th colspan=2>BLAKE3</th>
            <th colspan=2>RP64_256</th>
        </tr>
        <tr>
            <th>10</th>
            <th>100</th>
            <th>10</th>
            <th>100</th>
            <th>100</th>
            <th>1000</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan=8>Lenovo ThinkPad(10th Gen Intel® Core™ i5-1135G7 @ 2.40GHz × 8), 32 GB
RAM</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">Miden VM</td>
            <td>3.14</td>
            <td>32.33</td>
            <td>1.72</td>
            <td>18.01</td>
            <td>0.09</td>
            <td>0.69</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">RISC Zero</td>
            <td>1.76</td>
            <td>7.05</td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
        </tr>
    </tbody>
</table>

A few notes:

- For RISC Zero the native hash function is SHA256, while for Miden VM it is Rescue Prime.

#### Verifier performance

The table below shows the time it takes to verify a proof of correctly computing a hash chain of a given length and a given hash function. The time shown is in **milliseconds**.

<table>
    <thead>
        <tr>
            <th rowspan=2 colspan=2>Verifier time (ms)</th>
            <th colspan=2>SHA256</th>
            <th colspan=2>BLAKE3</th>
            <th colspan=2>RP64_256</th>
        </tr>
        <tr>
            <th>10</th>
            <th>100</th>
            <th>10</th>
            <th>100</th>
            <th>100</th>
            <th>1000</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan=8>Lenovo ThinkPad(10th Gen Intel® Core™ i5-1135G7 @ 2.40GHz × 8), 32 GB
RAM</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">Miden VM</td>
            <td> 3.35</td>
            <td> 3.21</td>
            <td> 2.35</td>
            <td> 3.11</td>
            <td> 2.66</td>
            <td> 3.02</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">RISC Zero</td>
            <td> 3.67</td>
            <td> 6.43</td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
        </tr>
    </tbody>
</table>

#### Proof size

The table below shows the size of a generated proof in **kilobytes**. Proof sizes do not depend on the platform used to generate proofs.

<table>
    <thead>
        <tr>
            <th rowspan=2>Proof size (KB)</th>
            <th colspan=2>SHA256</th>
            <th colspan=2>BLAKE3</th>
            <th colspan=2>RP64_256</th>
        </tr>
        <tr>
            <th>10</th>
            <th>100</th>
            <th>10</th>
            <th>100</th>
            <th>100</th>
            <th>1000</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="text-align:left">Miden VM</td>
            <td>87.1</td>
            <td>104.9</td>
            <td>80.0</td>
            <td>98.6</td>
            <td>56.6</td>
            <td>70.8</td>
        </tr>
        <tr>
            <td style="text-align:left">RISC Zero</td>
            <td>182.9</td>
            <td>204.9</td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
        </tr>
</table>

---


