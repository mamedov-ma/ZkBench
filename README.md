

### Iterated hashing

(Scenario type: building block)

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
            <td colspan=8>Apple M2 (4P + 4E cores), 24GB RAM </td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">Miden VM</td>
            <td>1.86</td>
            <td>17.14</td>
            <td>0.92</td>
            <td>8.26</td>
            <td>0.05</td>
            <td>0.25</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">RISC Zero</td>
            <td>1.29</td>
            <td>5.30</td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
        </tr>
        <tr>
            <td colspan=8>AWS Graviton 3 (64 cores), 128 GB RAM</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">Miden VM</td>
            <td>0.49</td>
            <td>3.99</td>
            <td>0.33</td>
            <td>2.06</td>
            <td>0.05</td>
            <td>0.13</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">RISC Zero</td>
            <td>0.40</td>
            <td>1.59</td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
        </tr>
        <tr>
            <td colspan=8>Dell XPS 15 9500 (i7-10875H CPU @ 2.30GHz × 16), 32 GB RAM</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">Miden VM</td>
            <td>3.85</td>
            <td>37.79</td>
            <td>1.59</td>
            <td>17.37</td>
            <td>0.07</td>
            <td>0.53</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">RISC Zero</td>
            <td>1.83</td>
            <td>7.26</td>
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
            <td colspan=8>Apple M2 (4P + 4E cores), 24GB RAM </td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">Miden VM</td>
            <td>2.42</td>
            <td>3.73</td>
            <td>2.56</td>
            <td>2.52</td>
            <td>2.28</td>
            <td>2.42</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">RISC Zero</td>
            <td>1.92</td>
            <td>2.44</td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
        </tr>
        <tr>
            <td colspan=8>AWS Graviton 3 (64 cores), 128 GB RAM</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">Miden VM</td>
            <td>3.26</td>
            <td>3.54</td>
            <td>3.24</td>
            <td>3.47</td>
            <td>2.81</td>
            <td>3.04</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">RISC Zero</td>
            <td>3.03</td>
            <td>4.05</td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
        </tr>
        <tr>
            <td colspan=8>Dell XPS 15 9500 (i7-10875H CPU @ 2.30GHz × 16), 32 GB RAM</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">Miden VM</td>
            <td> 3.65</td>
            <td> 3.18</td>
            <td> 2.96</td>
            <td> 3.78</td>
            <td> 2.87</td>
            <td> 3.13</td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left">RISC Zero</td>
            <td> 3.81</td>
            <td> 6.39</td>
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
            <td>87.7</td>
            <td>105.0</td>
            <td>81.3</td>
            <td>98.4</td>
            <td>56.2</td>
            <td>71.0</td>
        </tr>
        <tr>
            <td style="text-align:left">RISC Zero</td>
            <td>183.4</td>
            <td>205.1</td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
        </tr>
       
</table>

---

### Running all of the benchmarks

```console
$ ./all.sh
```


