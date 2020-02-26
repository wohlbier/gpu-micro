Some gpu micro kernels.

p2p is modified from
`https://github.com/NVIDIA/cuda-samples/blob/master/Samples/p2pBandwidthLatencyTest/p2pBandwidthLatencyTest.cu`

Results on Lambda.
```
jgwohlbier@etc-lambda-01:~/gpu-micro/build$ ./p2p --p2p_read --nElements=1073741824 --nRepeat=20
[P2P (Peer-to-Peer) GPU Bandwidth Latency Test]
Device: 0, TITAN RTX, pciBusID: 1a, pciDeviceID: 0, pciDomainID:0
Device: 1, TITAN RTX, pciBusID: 1b, pciDeviceID: 0, pciDomainID:0
Device: 2, TITAN RTX, pciBusID: 3d, pciDeviceID: 0, pciDomainID:0
Device: 3, TITAN RTX, pciBusID: 3e, pciDeviceID: 0, pciDomainID:0
Device: 4, TITAN RTX, pciBusID: 88, pciDeviceID: 0, pciDomainID:0
Device: 5, TITAN RTX, pciBusID: 89, pciDeviceID: 0, pciDomainID:0
Device: 6, TITAN RTX, pciBusID: b1, pciDeviceID: 0, pciDomainID:0
Device: 7, TITAN RTX, pciBusID: b2, pciDeviceID: 0, pciDomainID:0
Device=0 CANNOT Access Peer Device=1
Device=0 CANNOT Access Peer Device=2
Device=0 CANNOT Access Peer Device=3
Device=0 CANNOT Access Peer Device=4
Device=0 CANNOT Access Peer Device=5
Device=0 CANNOT Access Peer Device=6
Device=0 CANNOT Access Peer Device=7
Device=1 CANNOT Access Peer Device=0
Device=1 CANNOT Access Peer Device=2
Device=1 CANNOT Access Peer Device=3
Device=1 CANNOT Access Peer Device=4
Device=1 CANNOT Access Peer Device=5
Device=1 CANNOT Access Peer Device=6
Device=1 CANNOT Access Peer Device=7
Device=2 CANNOT Access Peer Device=0
Device=2 CANNOT Access Peer Device=1
Device=2 CANNOT Access Peer Device=3
Device=2 CANNOT Access Peer Device=4
Device=2 CANNOT Access Peer Device=5
Device=2 CANNOT Access Peer Device=6
Device=2 CANNOT Access Peer Device=7
Device=3 CANNOT Access Peer Device=0
Device=3 CANNOT Access Peer Device=1
Device=3 CANNOT Access Peer Device=2
Device=3 CANNOT Access Peer Device=4
Device=3 CANNOT Access Peer Device=5
Device=3 CANNOT Access Peer Device=6
Device=3 CANNOT Access Peer Device=7
Device=4 CANNOT Access Peer Device=0
Device=4 CANNOT Access Peer Device=1
Device=4 CANNOT Access Peer Device=2
Device=4 CANNOT Access Peer Device=3
Device=4 CANNOT Access Peer Device=5
Device=4 CANNOT Access Peer Device=6
Device=4 CANNOT Access Peer Device=7
Device=5 CANNOT Access Peer Device=0
Device=5 CANNOT Access Peer Device=1
Device=5 CANNOT Access Peer Device=2
Device=5 CANNOT Access Peer Device=3
Device=5 CANNOT Access Peer Device=4
Device=5 CANNOT Access Peer Device=6
Device=5 CANNOT Access Peer Device=7
Device=6 CANNOT Access Peer Device=0
Device=6 CANNOT Access Peer Device=1
Device=6 CANNOT Access Peer Device=2
Device=6 CANNOT Access Peer Device=3
Device=6 CANNOT Access Peer Device=4
Device=6 CANNOT Access Peer Device=5
Device=6 CANNOT Access Peer Device=7
Device=7 CANNOT Access Peer Device=0
Device=7 CANNOT Access Peer Device=1
Device=7 CANNOT Access Peer Device=2
Device=7 CANNOT Access Peer Device=3
Device=7 CANNOT Access Peer Device=4
Device=7 CANNOT Access Peer Device=5
Device=7 CANNOT Access Peer Device=6

***NOTE: In case a device doesn't have P2P access to other one, it falls back to normal memcopy procedure.
So you can see lesser Bandwidth (GB/s) and unstable Latency (us) in those cases.

P2P Connectivity Matrix
     D\D     0     1     2     3     4     5     6     7
     0	     1     0     0     0     0     0     0     0
     1	     0     1     0     0     0     0     0     0
     2	     0     0     1     0     0     0     0     0
     3	     0     0     0     1     0     0     0     0
     4	     0     0     0     0     1     0     0     0
     5	     0     0     0     0     0     1     0     0
     6	     0     0     0     0     0     0     1     0
     7	     0     0     0     0     0     0     0     1
Unidirectional P2P=Disabled Bandwidth Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7
     0 563.00   9.93  11.37  11.37  11.35  11.36  11.36  11.36
     1   9.93 555.80  11.36  11.35  11.36  11.36  11.36  11.36
     2  11.36  11.37 557.00   9.94  11.35  11.36  11.36  11.36
     3  11.36  11.36   9.95 556.73  11.36  11.36  11.36  11.36
     4  11.44  11.43  11.42  11.42 556.43   9.96  11.46  11.46
     5  11.43  11.44  11.42  11.41   9.99 556.43  11.46  11.45
     6  11.42  11.43  11.42  11.41  11.44  11.45 557.04   9.96
     7  11.43  11.43  11.42  11.41  11.46  11.46   9.98 556.48
Unidirectional P2P=Enabled Bandwidth (P2P Writes) Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7
     0 549.72   9.91  11.36  11.36  11.35  11.36  11.36  11.36
     1   9.92 556.12  11.36  11.36  11.36  11.36  11.36  11.36
     2  11.36  11.37 557.05   9.92  11.35  11.36  11.36  11.36
     3  11.36  11.36   9.96 556.74  11.35  11.36  11.36  11.36
     4  11.44  11.42  11.41  11.41 556.43   9.93  11.44  11.44
     5  11.43  11.42  11.41  11.41   9.97 556.57  11.44  11.45
     6  11.41  11.41  11.41  11.41  11.43  11.44 557.08   9.95
     7  11.42  11.41  11.42  11.41  11.44  11.45   9.97 556.49
Unidirectional P2P=Enabled Bandwidth (P2P Reads) Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7
     0 550.50   9.96  11.37  11.37  11.42  11.43  11.42  11.42
     1   9.96 556.11  11.37  11.37  11.43  11.44  11.43  11.43
     2  11.37  11.38 557.06   9.98  11.41  11.42  11.42  11.42
     3  11.37  11.37   9.97 556.74  11.41  11.42  11.41  11.42
     4  11.39  11.38  11.38  11.38 556.42  10.01  11.46  11.47
     5  11.38  11.38  11.38  11.38  10.00 556.53  11.45  11.45
     6  11.38  11.38  11.38  11.38  11.46  11.46 557.09   9.99
     7  11.37  11.38  11.38  11.37  11.45  11.45   9.99 556.53
Bidirectional P2P=Disabled Bandwidth Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7
     0 549.64   9.93  11.40  11.40  11.43  11.43  11.42  11.43
     1   9.93 554.44  11.40  11.40  11.43  11.43  11.43  11.43
     2  11.40  11.40 555.46   9.94  11.42  11.43  11.43  11.43
     3  11.40  11.40   9.94 555.10  11.42  11.42  11.42  11.42
     4  11.44  11.43  11.43  11.42 554.95   9.98  11.49  11.49
     5  11.43  11.43  11.43  11.42   9.96 555.06  11.49  11.49
     6  11.43  11.43  11.43  11.42  11.49  11.49 555.69   9.98
     7  11.43  11.43  11.43  11.42  11.49  11.49   9.98 554.98
Bidirectional P2P=Enabled Bandwidth Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7
     0 551.90   9.94  11.40  11.40  11.43  11.43  11.42  11.43
     1   9.94 554.03  11.40  11.40  11.43  11.43  11.43  11.43
     2  11.40  11.40 554.97   9.95  11.42  11.43  11.43  11.43
     3  11.40  11.39   9.94 554.65  11.42  11.42  11.42  11.42
     4  11.44  11.43  11.43  11.42 554.49   9.98  11.49  11.49
     5  11.43  11.44  11.43  11.42   9.96 554.53  11.49  11.49
     6  11.43  11.43  11.43  11.42  11.49  11.49 555.09   9.99
     7  11.43  11.43  11.43  11.42  11.49  11.49   9.97 554.61
P2P=Disabled Latency Matrix (us)
   GPU     0      1      2      3      4      5      6      7
     0   3.20  25.52   9.88   9.94  13.04  13.00  13.04  13.26
     1  10.16   3.27  12.76  12.57  13.04  12.94  12.93  13.38
     2  13.64  14.06   3.21  13.99  13.56  13.58  13.55  14.02
     3  13.93  13.99  13.91   3.18  13.61  14.21  13.97  13.78
     4  14.08  13.57  13.86  13.66   2.89  13.72  13.33  14.10
     5  13.58  13.55  13.89  13.48  13.86   2.92  13.43  13.99
     6  13.47  13.71  13.39  13.79  12.84  12.83   2.89  12.85
     7  13.41  13.39  13.38  13.36  12.94  12.88  12.97   2.88

   CPU     0      1      2      3      4      5      6      7
     0   3.95  25.82  10.31  10.38  13.10  13.06  13.10  13.27
     1  10.23   3.77  12.83  12.61  13.09  13.00  12.95  13.40
     2  13.70  14.31   3.94  14.26  13.84  13.85  13.83  13.95
     3  14.22  14.27  14.19   3.91  13.89  14.45  14.23  14.06
     4  14.37  13.85  14.14  13.89   3.62  13.93  13.61  14.38
     5  13.87  13.80  14.17  13.74  14.07   3.65  13.71  14.24
     6  13.73  13.74  13.67  13.72  13.13  13.11   3.62  13.05
     7  13.68  13.67  13.66  13.64  13.22  13.16  13.11   3.62
P2P=Enabled Latency (P2P Writes) Matrix (us)
   GPU     0      1      2      3      4      5      6      7
     0   3.16  13.99  13.90  13.94  13.55  13.55  13.54  13.73
     1  13.98   3.17  13.87  13.91  13.50  13.58  13.59  13.72
     2  13.94  14.02   3.17  14.06  13.70  13.68  13.49  13.95
     3  13.95  13.98  13.94   3.19  13.83  13.75  13.70  14.15
     4  13.51  13.48  13.47  13.42   2.90  14.36  13.87  14.37
     5  13.60  13.57  13.58  13.72  13.97   2.92  13.34  14.29
     6  13.59  13.55  13.50  13.75  12.86  12.86   2.90  12.82
     7  13.42  13.41  13.34  13.42  12.96  12.86  12.83   2.90

   CPU     0      1      2      3      4      5      6      7
     0   3.90  14.27  14.18  14.21  13.82  13.83  13.81  14.00
     1  14.26   3.90  14.14  14.17  13.75  13.85  13.85  13.98
     2  14.22  14.28   3.90  14.28  13.89  13.87  13.77  13.89
     3  14.23  14.26  14.21   3.92  14.11  14.00  13.98  14.41
     4  13.79  13.76  13.71  13.69   3.64  14.59  14.13  14.60
     5  13.87  13.85  13.85  14.00  14.19   3.65  13.61  14.56
     6  13.76  13.75  13.78  13.68  13.04  13.05   3.63  13.03
     7  13.67  13.69  13.62  13.70  13.20  13.14  13.11   3.63
P2P=Enabled Latency (P2P Reads) Matrix (us)
   GPU     0      1      2      3      4      5      6      7
     0   3.16  12.75  12.65  12.72  12.33  12.33  12.43  12.33
     1  12.65   3.12  12.68  12.76  12.35  12.42  12.32  12.34
     2  12.74  12.63   3.18  12.71  12.32  12.45  12.42  12.32
     3  12.86  12.78  12.76   3.13  12.38  12.36  12.35  12.42
     4  12.41  12.40  12.38  12.39   2.92  11.91  12.08  11.97
     5  12.38  12.38  12.38  12.38  11.98   2.86  12.00  11.97
     6  12.42  12.41  12.37  12.39  11.99  12.05   2.90  11.88
     7  12.36  12.33  12.33  12.38  11.94  11.93  12.00   2.85

   CPU     0      1      2      3      4      5      6      7
     0   3.89  13.03  12.93  12.99  12.61  12.61  12.61  12.61
     1  12.93   3.86  12.96  13.04  12.62  12.61  12.60  12.61
     2  12.97  12.90   3.91  12.99  12.60  12.60  12.59  12.60
     3  13.13  13.06  13.03   3.86  12.62  12.64  12.63  12.66
     4  12.69  12.65  12.65  12.67   3.65  12.19  12.24  12.23
     5  12.66  12.65  12.66  12.66  12.25   3.60  12.24  12.24
     6  12.67  12.64  12.65  12.66  12.28  12.27   3.63  12.18
     7  12.63  12.61  12.61  12.62  12.21  12.21  12.21   3.59

NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.
```

Results on DGX-2. Someone was using devices 0,3,4,5.
```

```