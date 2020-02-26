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

Results on DGX-2.
```
jgwohlbier@escalade:/raid/user-scratch/jgwohlbier/gpu-micro/build$ ./p2p --p2p_read --nElements=1073741824 --nRepeat=20
[P2P (Peer-to-Peer) GPU Bandwidth Latency Test]
Device: 0, Tesla V100-SXM3-32GB, pciBusID: 34, pciDeviceID: 0, pciDomainID:0
Device: 1, Tesla V100-SXM3-32GB, pciBusID: 36, pciDeviceID: 0, pciDomainID:0
Device: 2, Tesla V100-SXM3-32GB, pciBusID: 39, pciDeviceID: 0, pciDomainID:0
Device: 3, Tesla V100-SXM3-32GB, pciBusID: 3b, pciDeviceID: 0, pciDomainID:0
Device: 4, Tesla V100-SXM3-32GB, pciBusID: 57, pciDeviceID: 0, pciDomainID:0
Device: 5, Tesla V100-SXM3-32GB, pciBusID: 59, pciDeviceID: 0, pciDomainID:0
Device: 6, Tesla V100-SXM3-32GB, pciBusID: 5c, pciDeviceID: 0, pciDomainID:0
Device: 7, Tesla V100-SXM3-32GB, pciBusID: 5e, pciDeviceID: 0, pciDomainID:0
Device: 8, Tesla V100-SXM3-32GB, pciBusID: b7, pciDeviceID: 0, pciDomainID:0
Device: 9, Tesla V100-SXM3-32GB, pciBusID: b9, pciDeviceID: 0, pciDomainID:0
Device: 10, Tesla V100-SXM3-32GB, pciBusID: bc, pciDeviceID: 0, pciDomainID:0
Device: 11, Tesla V100-SXM3-32GB, pciBusID: be, pciDeviceID: 0, pciDomainID:0
Device: 12, Tesla V100-SXM3-32GB, pciBusID: e0, pciDeviceID: 0, pciDomainID:0
Device: 13, Tesla V100-SXM3-32GB, pciBusID: e2, pciDeviceID: 0, pciDomainID:0
Device: 14, Tesla V100-SXM3-32GB, pciBusID: e5, pciDeviceID: 0, pciDomainID:0
Device: 15, Tesla V100-SXM3-32GB, pciBusID: e7, pciDeviceID: 0, pciDomainID:0
Device=0 CAN Access Peer Device=1
Device=0 CAN Access Peer Device=2
Device=0 CAN Access Peer Device=3
Device=0 CAN Access Peer Device=4
Device=0 CAN Access Peer Device=5
Device=0 CAN Access Peer Device=6
Device=0 CAN Access Peer Device=7
Device=0 CAN Access Peer Device=8
Device=0 CAN Access Peer Device=9
Device=0 CAN Access Peer Device=10
Device=0 CAN Access Peer Device=11
Device=0 CAN Access Peer Device=12
Device=0 CAN Access Peer Device=13
Device=0 CAN Access Peer Device=14
Device=0 CAN Access Peer Device=15
Device=1 CAN Access Peer Device=0
Device=1 CAN Access Peer Device=2
Device=1 CAN Access Peer Device=3
Device=1 CAN Access Peer Device=4
Device=1 CAN Access Peer Device=5
Device=1 CAN Access Peer Device=6
Device=1 CAN Access Peer Device=7
Device=1 CAN Access Peer Device=8
Device=1 CAN Access Peer Device=9
Device=1 CAN Access Peer Device=10
Device=1 CAN Access Peer Device=11
Device=1 CAN Access Peer Device=12
Device=1 CAN Access Peer Device=13
Device=1 CAN Access Peer Device=14
Device=1 CAN Access Peer Device=15
Device=2 CAN Access Peer Device=0
Device=2 CAN Access Peer Device=1
Device=2 CAN Access Peer Device=3
Device=2 CAN Access Peer Device=4
Device=2 CAN Access Peer Device=5
Device=2 CAN Access Peer Device=6
Device=2 CAN Access Peer Device=7
Device=2 CAN Access Peer Device=8
Device=2 CAN Access Peer Device=9
Device=2 CAN Access Peer Device=10
Device=2 CAN Access Peer Device=11
Device=2 CAN Access Peer Device=12
Device=2 CAN Access Peer Device=13
Device=2 CAN Access Peer Device=14
Device=2 CAN Access Peer Device=15
Device=3 CAN Access Peer Device=0
Device=3 CAN Access Peer Device=1
Device=3 CAN Access Peer Device=2
Device=3 CAN Access Peer Device=4
Device=3 CAN Access Peer Device=5
Device=3 CAN Access Peer Device=6
Device=3 CAN Access Peer Device=7
Device=3 CAN Access Peer Device=8
Device=3 CAN Access Peer Device=9
Device=3 CAN Access Peer Device=10
Device=3 CAN Access Peer Device=11
Device=3 CAN Access Peer Device=12
Device=3 CAN Access Peer Device=13
Device=3 CAN Access Peer Device=14
Device=3 CAN Access Peer Device=15
Device=4 CAN Access Peer Device=0
Device=4 CAN Access Peer Device=1
Device=4 CAN Access Peer Device=2
Device=4 CAN Access Peer Device=3
Device=4 CAN Access Peer Device=5
Device=4 CAN Access Peer Device=6
Device=4 CAN Access Peer Device=7
Device=4 CAN Access Peer Device=8
Device=4 CAN Access Peer Device=9
Device=4 CAN Access Peer Device=10
Device=4 CAN Access Peer Device=11
Device=4 CAN Access Peer Device=12
Device=4 CAN Access Peer Device=13
Device=4 CAN Access Peer Device=14
Device=4 CAN Access Peer Device=15
Device=5 CAN Access Peer Device=0
Device=5 CAN Access Peer Device=1
Device=5 CAN Access Peer Device=2
Device=5 CAN Access Peer Device=3
Device=5 CAN Access Peer Device=4
Device=5 CAN Access Peer Device=6
Device=5 CAN Access Peer Device=7
Device=5 CAN Access Peer Device=8
Device=5 CAN Access Peer Device=9
Device=5 CAN Access Peer Device=10
Device=5 CAN Access Peer Device=11
Device=5 CAN Access Peer Device=12
Device=5 CAN Access Peer Device=13
Device=5 CAN Access Peer Device=14
Device=5 CAN Access Peer Device=15
Device=6 CAN Access Peer Device=0
Device=6 CAN Access Peer Device=1
Device=6 CAN Access Peer Device=2
Device=6 CAN Access Peer Device=3
Device=6 CAN Access Peer Device=4
Device=6 CAN Access Peer Device=5
Device=6 CAN Access Peer Device=7
Device=6 CAN Access Peer Device=8
Device=6 CAN Access Peer Device=9
Device=6 CAN Access Peer Device=10
Device=6 CAN Access Peer Device=11
Device=6 CAN Access Peer Device=12
Device=6 CAN Access Peer Device=13
Device=6 CAN Access Peer Device=14
Device=6 CAN Access Peer Device=15
Device=7 CAN Access Peer Device=0
Device=7 CAN Access Peer Device=1
Device=7 CAN Access Peer Device=2
Device=7 CAN Access Peer Device=3
Device=7 CAN Access Peer Device=4
Device=7 CAN Access Peer Device=5
Device=7 CAN Access Peer Device=6
Device=7 CAN Access Peer Device=8
Device=7 CAN Access Peer Device=9
Device=7 CAN Access Peer Device=10
Device=7 CAN Access Peer Device=11
Device=7 CAN Access Peer Device=12
Device=7 CAN Access Peer Device=13
Device=7 CAN Access Peer Device=14
Device=7 CAN Access Peer Device=15
Device=8 CAN Access Peer Device=0
Device=8 CAN Access Peer Device=1
Device=8 CAN Access Peer Device=2
Device=8 CAN Access Peer Device=3
Device=8 CAN Access Peer Device=4
Device=8 CAN Access Peer Device=5
Device=8 CAN Access Peer Device=6
Device=8 CAN Access Peer Device=7
Device=8 CAN Access Peer Device=9
Device=8 CAN Access Peer Device=10
Device=8 CAN Access Peer Device=11
Device=8 CAN Access Peer Device=12
Device=8 CAN Access Peer Device=13
Device=8 CAN Access Peer Device=14
Device=8 CAN Access Peer Device=15
Device=9 CAN Access Peer Device=0
Device=9 CAN Access Peer Device=1
Device=9 CAN Access Peer Device=2
Device=9 CAN Access Peer Device=3
Device=9 CAN Access Peer Device=4
Device=9 CAN Access Peer Device=5
Device=9 CAN Access Peer Device=6
Device=9 CAN Access Peer Device=7
Device=9 CAN Access Peer Device=8
Device=9 CAN Access Peer Device=10
Device=9 CAN Access Peer Device=11
Device=9 CAN Access Peer Device=12
Device=9 CAN Access Peer Device=13
Device=9 CAN Access Peer Device=14
Device=9 CAN Access Peer Device=15
Device=10 CAN Access Peer Device=0
Device=10 CAN Access Peer Device=1
Device=10 CAN Access Peer Device=2
Device=10 CAN Access Peer Device=3
Device=10 CAN Access Peer Device=4
Device=10 CAN Access Peer Device=5
Device=10 CAN Access Peer Device=6
Device=10 CAN Access Peer Device=7
Device=10 CAN Access Peer Device=8
Device=10 CAN Access Peer Device=9
Device=10 CAN Access Peer Device=11
Device=10 CAN Access Peer Device=12
Device=10 CAN Access Peer Device=13
Device=10 CAN Access Peer Device=14
Device=10 CAN Access Peer Device=15
Device=11 CAN Access Peer Device=0
Device=11 CAN Access Peer Device=1
Device=11 CAN Access Peer Device=2
Device=11 CAN Access Peer Device=3
Device=11 CAN Access Peer Device=4
Device=11 CAN Access Peer Device=5
Device=11 CAN Access Peer Device=6
Device=11 CAN Access Peer Device=7
Device=11 CAN Access Peer Device=8
Device=11 CAN Access Peer Device=9
Device=11 CAN Access Peer Device=10
Device=11 CAN Access Peer Device=12
Device=11 CAN Access Peer Device=13
Device=11 CAN Access Peer Device=14
Device=11 CAN Access Peer Device=15
Device=12 CAN Access Peer Device=0
Device=12 CAN Access Peer Device=1
Device=12 CAN Access Peer Device=2
Device=12 CAN Access Peer Device=3
Device=12 CAN Access Peer Device=4
Device=12 CAN Access Peer Device=5
Device=12 CAN Access Peer Device=6
Device=12 CAN Access Peer Device=7
Device=12 CAN Access Peer Device=8
Device=12 CAN Access Peer Device=9
Device=12 CAN Access Peer Device=10
Device=12 CAN Access Peer Device=11
Device=12 CAN Access Peer Device=13
Device=12 CAN Access Peer Device=14
Device=12 CAN Access Peer Device=15
Device=13 CAN Access Peer Device=0
Device=13 CAN Access Peer Device=1
Device=13 CAN Access Peer Device=2
Device=13 CAN Access Peer Device=3
Device=13 CAN Access Peer Device=4
Device=13 CAN Access Peer Device=5
Device=13 CAN Access Peer Device=6
Device=13 CAN Access Peer Device=7
Device=13 CAN Access Peer Device=8
Device=13 CAN Access Peer Device=9
Device=13 CAN Access Peer Device=10
Device=13 CAN Access Peer Device=11
Device=13 CAN Access Peer Device=12
Device=13 CAN Access Peer Device=14
Device=13 CAN Access Peer Device=15
Device=14 CAN Access Peer Device=0
Device=14 CAN Access Peer Device=1
Device=14 CAN Access Peer Device=2
Device=14 CAN Access Peer Device=3
Device=14 CAN Access Peer Device=4
Device=14 CAN Access Peer Device=5
Device=14 CAN Access Peer Device=6
Device=14 CAN Access Peer Device=7
Device=14 CAN Access Peer Device=8
Device=14 CAN Access Peer Device=9
Device=14 CAN Access Peer Device=10
Device=14 CAN Access Peer Device=11
Device=14 CAN Access Peer Device=12
Device=14 CAN Access Peer Device=13
Device=14 CAN Access Peer Device=15
Device=15 CAN Access Peer Device=0
Device=15 CAN Access Peer Device=1
Device=15 CAN Access Peer Device=2
Device=15 CAN Access Peer Device=3
Device=15 CAN Access Peer Device=4
Device=15 CAN Access Peer Device=5
Device=15 CAN Access Peer Device=6
Device=15 CAN Access Peer Device=7
Device=15 CAN Access Peer Device=8
Device=15 CAN Access Peer Device=9
Device=15 CAN Access Peer Device=10
Device=15 CAN Access Peer Device=11
Device=15 CAN Access Peer Device=12
Device=15 CAN Access Peer Device=13
Device=15 CAN Access Peer Device=14

***NOTE: In case a device doesn't have P2P access to other one, it falls back to normal memcopy procedure.
So you can see lesser Bandwidth (GB/s) and unstable Latency (us) in those cases.

P2P Connectivity Matrix
     D\D     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15
     0	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
     1	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
     2	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
     3	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
     4	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
     5	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
     6	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
     7	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
     8	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
     9	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
    10	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
    11	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
    12	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
    13	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
    14	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
    15	     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1     1
Unidirectional P2P=Disabled Bandwidth Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0 851.98   8.68   9.85   9.86  11.28  11.35  11.35  11.34  11.27  11.27  11.28  11.27  11.28  11.28  11.29  11.24
     1   8.69 851.02   9.86   9.88  11.27  11.31  11.35  11.34  11.27  11.27  11.27  11.27  11.27  11.27  11.29  11.24
     2   9.90   9.90 850.94   9.89  11.27  11.35  11.35  11.34  11.27  11.27  11.28  11.27  11.27  11.27  11.29  11.24
     3   9.89   9.90   9.90 850.99  11.27  11.35  11.35  11.34  11.27  11.26  11.28  11.27  11.27  11.27  11.28  11.24
     4  11.30  11.33  11.29  11.34 850.97   8.68   9.87   9.91  11.26  11.26  11.26  11.26  11.27  11.26  11.28  11.24
     5  11.30  11.33  11.29  11.34   8.66 850.91   9.87   9.91  11.26  11.26  11.26  11.26  11.26  11.26  11.28  11.24
     6  11.33  11.36  11.30  11.36   9.88   9.91 850.92   9.94  11.27  11.26  11.28  11.27  11.27  11.28  11.28  11.25
     7  11.33  11.36  11.29  11.35   9.88   9.92   9.91 851.02  11.27  11.26  11.28  11.27  11.27  11.27  11.29  11.25
     8  11.10  11.10  11.10  11.11  11.07  11.07  11.11  11.11 850.97   8.48   9.37   9.37  10.86  10.88  10.89  10.90
     9  11.09  11.10  11.11  11.11  11.06  11.07  11.12  11.11   8.48 851.03   9.37   9.37  10.86  10.87  10.90  10.90
    10  11.09  11.10  11.11  11.11  11.07  11.07  11.12  11.12   9.34   9.34 850.97   9.47  10.86  10.88  10.90  10.90
    11  11.10  11.10  11.12  11.12  11.07  11.08  11.13  11.12   9.35   9.35   9.48 851.02  10.86  10.88  10.90  10.90
    12  11.09  11.10  11.11  11.11  11.06  11.07  11.13  11.06  10.82  10.83  10.89  10.88 850.97   8.49   9.38   9.38
    13  11.10  11.11  11.11  11.11  11.07  11.07  11.13  11.12  10.82  10.84  10.90  10.89   8.49 850.98   9.38   9.38
    14  11.11  11.11  11.12  11.11  11.07  11.07  11.13  11.12  10.82  10.83  10.89  10.89   9.36   9.37 850.98   9.48
    15  11.09  11.10  11.10  11.11  11.07  11.07  11.12  11.12  10.82  10.83  10.89  10.88   9.36   9.37   9.48 851.03
Unidirectional P2P=Enabled Bandwidth (P2P Writes) Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0 850.94 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     1 145.57 850.96 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     2 145.57 145.57 850.97 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     3 145.57 145.57 145.57 850.99 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     4 145.57 145.57 145.57 145.57 850.97 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     5 145.57 145.57 145.57 145.57 145.57 851.01 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     6 145.57 145.57 145.57 145.57 145.57 145.57 850.99 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     7 145.57 145.57 145.57 145.57 145.57 145.57 145.57 850.96 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     8 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 850.96 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     9 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 851.08 145.57 145.57 145.57 145.57 145.57 145.57
    10 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 850.97 145.57 145.57 145.57 145.57 145.57
    11 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 851.04 145.57 145.57 145.57 145.57
    12 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 850.95 145.57 145.57 145.57
    13 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 850.97 145.57 145.57
    14 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 850.95 145.57
    15 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 851.00
Unidirectional P2P=Enabled Bandwidth (P2P Reads) Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0 848.64 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50
     1 145.50 849.62 145.50 145.50 145.50 145.51 145.51 145.51 145.50 145.50 145.50 145.50 145.50 145.50 145.51 145.51
     2 145.51 145.50 848.64 145.51 145.51 145.51 145.51 145.51 145.51 145.50 145.50 145.50 145.50 145.50 145.51 145.51
     3 145.51 145.50 145.51 850.91 145.51 145.50 145.51 145.51 145.50 145.50 145.51 145.51 145.51 145.50 145.50 145.51
     4 145.51 145.51 145.51 145.51 850.88 145.50 145.50 145.51 145.50 145.50 145.51 145.50 145.50 145.50 145.50 145.50
     5 145.51 145.50 145.51 145.50 145.51 851.73 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50
     6 145.50 145.50 145.50 145.50 145.50 145.51 850.94 145.51 145.50 145.50 145.51 145.50 145.51 145.50 145.50 145.50
     7 145.51 145.51 145.51 145.51 145.51 145.51 145.51 850.92 145.50 145.51 145.50 145.51 145.50 145.50 145.51 145.50
     8 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 850.90 145.50 145.50 145.50 145.50 145.50 145.50 145.50
     9 145.51 145.50 145.50 145.50 145.50 145.50 145.51 145.50 145.50 851.04 145.50 145.50 145.50 145.50 145.50 145.50
    10 145.50 145.51 145.51 145.51 145.51 145.51 145.50 145.50 145.50 145.50 851.91 145.50 145.50 145.51 145.51 145.50
    11 145.50 145.50 145.50 145.51 145.50 145.51 145.51 145.51 145.51 145.50 145.50 852.07 145.51 145.50 145.51 145.51
    12 145.51 145.51 145.51 145.50 145.50 145.50 145.51 145.51 145.50 145.50 145.51 145.51 852.06 145.51 145.51 145.51
    13 145.51 145.51 145.51 145.51 145.51 145.51 145.50 145.50 145.50 145.50 145.50 145.51 145.50 852.18 145.50 145.50
    14 145.50 145.51 145.50 145.51 145.50 145.50 145.50 145.51 145.50 145.50 145.50 145.50 145.50 145.50 852.08 145.50
    15 145.50 145.50 145.50 145.51 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.51 145.51 145.50 145.51 851.52
Bidirectional P2P=Disabled Bandwidth Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0 849.95   8.69   9.89   9.89  11.31  11.34  11.36  11.36  11.20  11.20  11.21  11.21  11.20  11.21  11.22  11.19
     1   8.69 849.84   9.89   9.89  11.33  11.35  11.38  11.37  11.20  11.20  11.21  11.21  11.20  11.21  11.22  11.19
     2   9.89   9.89 849.99   9.90  11.30  11.34  11.35  11.35  11.21  11.21  11.22  11.22  11.21  11.22  11.23  11.20
     3   9.90   9.89   9.90 849.49  11.33  11.36  11.38  11.38  11.21  11.20  11.22  11.21  11.21  11.21  11.23  11.20
     4  11.31  11.33  11.30  11.33 849.43   8.67   9.88   9.90  11.19  11.18  11.19  11.19  11.19  11.19  11.20  11.18
     5  11.33  11.35  11.34  11.36   8.67 849.46   9.90   9.92  11.19  11.18  11.20  11.19  11.19  11.19  11.21  11.18
     6  11.37  11.38  11.35  11.38   9.88   9.90 849.46   9.92  11.22  11.21  11.23  11.23  11.22  11.22  11.24  11.21
     7  11.36  11.38  11.35  11.38   9.89   9.90   9.91 849.45  11.22  11.21  11.22  11.22  11.22  11.22  11.24  11.21
     8  11.21  11.21  11.21  11.21  11.19  11.19  11.22  11.21 849.50   8.48   9.36   9.37  10.87  10.88  10.89  10.89
     9  11.20  11.20  11.21  11.20  11.18  11.18  11.21  11.20   8.48 849.56   9.37   9.37  10.87  10.88  10.89  10.89
    10  11.21  11.21  11.22  11.21  11.19  11.19  11.22  11.22   9.37   9.37 850.00   9.49  10.90  10.91  10.92  10.92
    11  11.21  11.20  11.21  11.21  11.18  11.19  11.22  11.22   9.37   9.37   9.49 850.09  10.90  10.91  10.92  10.92
    12  11.20  11.21  11.21  11.21  11.19  11.19  11.22  11.22  10.87  10.87  10.90  10.90 849.92   8.49   9.37   9.38
    13  11.20  11.21  11.21  11.21  11.18  11.18  11.22  11.21  10.88  10.88  10.91  10.91   8.49 850.00   9.38   9.38
    14  11.22  11.22  11.23  11.22  11.20  11.20  11.23  11.23  10.88  10.89  10.92  10.92   9.37   9.38 849.97   9.49
    15  11.19  11.19  11.20  11.20  11.18  11.18  11.21  11.21  10.89  10.89  10.92  10.92   9.38   9.38   9.48 850.01
Bidirectional P2P=Enabled Bandwidth Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0 849.93 270.18 271.03 270.09 270.37 271.46 270.45 271.09 268.59 268.85 271.16 269.35 271.01 270.42 271.48 271.80
     1 270.16 849.96 272.71 271.55 270.21 272.36 270.59 271.46 269.11 269.14 272.81 270.43 271.36 270.81 273.07 272.96
     2 271.02 272.75 849.96 271.56 270.39 274.15 271.00 273.43 269.67 269.50 273.09 270.47 271.57 271.06 273.67 274.06
     3 270.09 271.50 271.54 849.94 270.04 271.49 270.61 271.83 269.35 269.24 271.47 269.51 271.01 270.49 271.48 271.78
     4 270.34 270.21 270.38 270.05 849.98 271.33 269.99 270.39 268.68 269.02 270.45 269.71 270.43 269.34 270.83 270.56
     5 271.47 272.34 274.36 271.51 271.31 849.96 271.50 273.54 270.09 269.75 273.68 271.13 271.71 271.44 273.96 274.02
     6 270.46 270.62 271.12 270.46 269.94 271.47 849.93 270.84 268.87 268.45 271.42 269.89 269.81 270.21 271.38 271.35
     7 271.14 271.45 273.36 271.77 270.39 273.55 270.82 849.88 269.55 269.11 273.26 270.57 271.11 271.21 273.27 273.49
     8 268.61 269.11 269.66 269.35 268.67 270.10 268.90 269.53 849.94 267.91 269.76 268.91 269.38 269.03 269.63 269.49
     9 268.84 269.17 269.51 269.22 269.02 269.74 268.38 269.03 267.92 849.95 269.52 268.01 268.52 268.92 268.56 268.97
    10 271.17 272.82 273.03 271.42 270.51 273.64 271.44 273.28 269.75 269.51 849.98 270.45 271.43 271.45 273.65 274.47
    11 269.32 270.43 270.45 269.49 269.62 271.05 269.63 270.57 268.87 268.02 270.40 849.99 269.85 269.60 271.50 270.92
    12 271.10 271.37 271.55 271.02 270.45 271.72 269.80 271.12 269.41 268.53 271.50 269.88 849.95 270.38 271.47 270.98
    13 270.47 270.85 271.08 270.50 269.33 271.42 270.14 271.26 268.95 268.99 271.47 269.67 270.39 849.97 271.42 271.26
    14 271.49 273.06 273.87 271.50 270.87 273.77 271.33 273.29 269.64 268.58 273.73 271.45 271.50 271.47 849.90 274.01
    15 271.78 272.96 274.03 271.78 270.64 274.02 271.36 273.47 269.50 268.94 274.47 270.93 270.97 271.22 274.03 849.95
P2P=Disabled Latency Matrix (us)
   GPU     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0   3.12  24.69  24.52  25.56  25.28  25.00  25.91  25.90  23.47  23.68  23.35  23.39  23.72  23.59  23.77  22.15
     1  24.83   3.05  24.99  25.97  24.85  24.06  25.88  25.60  23.57  23.33  23.38  23.51  23.50  23.38  23.37  22.25
     2  23.10  24.35   3.03  25.59  23.90  23.33  25.51  24.76  22.61  22.76  22.72  22.92  22.75  21.79  22.56  21.51
     3  25.02  25.50  24.80   3.08  24.77  22.88  25.53  25.04  23.03  22.88  22.16  22.60  22.98  22.88  22.87  21.86
     4  25.43  23.63  23.84  25.20   3.06  23.81  25.39  24.89  22.00  22.43  22.20  22.29  22.71  22.71  22.79  21.77
     5  27.99  28.89  27.95  27.33  26.95   3.12  26.92  25.90  21.80  22.19  21.61  21.71  22.15  22.01  21.95  21.57
     6  25.49  24.75  23.61  23.97  24.64  24.43   3.10  25.75  22.06  22.59  23.15  23.55  23.78  23.61  22.85  22.51
     7  25.63  25.90  25.97  26.87  25.21  25.54  25.03   3.14  22.99  23.75  22.80  22.51  23.85  23.73  23.77  23.37
     8  23.57  22.71  23.14  23.46  22.92  23.20  23.23  23.71   3.31  22.56  24.22  23.61  24.11  21.86  24.65  22.72
     9  23.54  22.49  21.68  21.85  21.78  26.22  27.58  27.36  24.76   3.33  23.58  24.67  26.08  24.45  24.19  24.21
    10  24.45  22.98  23.12  23.41  24.34  24.08  22.96  24.34  22.82  22.80   3.35  22.24  23.19  22.84  21.87  22.40
    11  22.77  23.63  24.40  26.11  24.84  23.89  24.21  24.17  22.36  22.63  22.72   3.35  24.01  20.74  23.71  22.38
    12  23.40  26.52  26.85  27.06  26.39  25.09  25.94  26.34  25.35  25.31  24.27  23.40   3.33  23.51  23.67  24.34
    13  24.80  25.33  24.31  25.23  23.52  23.01  24.65  24.75  23.02  23.89  22.46  22.86  22.69   3.45  21.71  23.43
    14  21.51  21.68  22.71  21.76  21.57  21.16  21.71  21.45  20.68  20.44  20.29  20.19  20.58  20.38   3.33  20.90
    15  23.12  22.07  24.39  22.61  22.75  21.97  23.61  22.90  23.04  23.56  23.22  23.42  23.83  23.32  24.15   3.27

   CPU     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0   3.85  24.71  24.51  25.55  25.27  24.98  25.90  25.89  23.40  23.60  23.28  23.32  23.65  23.52  23.70  22.08
     1  24.79   3.67  24.95  25.93  24.81  24.02  25.85  25.56  23.47  23.22  23.27  23.41  23.39  23.28  23.27  22.15
     2  23.07  24.32   3.66  25.56  23.86  23.30  25.47  24.72  22.51  22.66  22.64  22.82  22.64  21.68  22.46  21.42
     3  24.99  25.46  24.77   3.71  24.73  22.85  25.50  25.01  22.96  22.79  22.08  22.52  22.90  22.79  22.79  21.78
     4  25.39  23.50  23.80  25.17   3.68  23.78  25.35  24.84  21.91  22.34  22.11  22.21  22.62  22.63  22.71  21.67
     5  27.95  28.85  27.90  27.29  26.90   3.75  26.88  25.86  21.69  22.09  21.50  21.61  22.04  21.91  21.84  21.46
     6  25.45  24.71  23.54  23.99  24.66  24.45   3.82  25.80  22.00  22.53  23.09  23.49  23.72  23.56  22.78  22.45
     7  25.66  25.94  25.99  26.90  25.23  25.57  25.06   3.86  22.99  23.71  22.76  22.46  23.81  23.69  23.73  23.33
     8  23.50  22.64  23.06  23.38  22.85  23.12  23.15  23.64   3.94  22.50  24.17  23.56  24.05  21.81  24.60  22.65
     9  23.47  22.42  21.61  21.78  21.70  26.13  27.59  27.37  24.79   4.05  23.63  24.66  26.07  24.43  24.18  24.19
    10  24.40  22.93  23.06  23.36  24.29  24.03  22.91  24.29  22.80  22.77   4.00  22.20  23.13  22.79  21.82  22.35
    11  22.70  23.56  24.33  26.04  24.76  23.81  24.13  24.10  22.31  22.59  22.68   3.98  23.97  20.67  23.66  22.34
    12  23.41  26.52  26.86  27.06  26.40  25.10  25.94  26.34  25.35  25.32  24.29  23.41   4.04  23.52  23.66  24.33
    13  24.72  25.26  24.24  25.16  23.45  22.94  24.58  24.68  22.96  23.77  22.39  22.72  22.64   4.07  21.67  23.39
    14  21.44  21.61  22.64  21.69  21.50  21.08  21.64  21.37  20.63  20.37  20.24  20.14  20.54  20.33   3.96  20.86
    15  23.05  22.00  24.32  22.54  22.68  21.90  23.54  22.83  23.00  23.51  23.18  23.38  23.79  23.28  24.11   3.90
P2P=Enabled Latency (P2P Writes) Matrix (us)
   GPU     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0   3.16   2.29   2.28   2.29   2.28   2.28   2.28   2.28   2.28   2.28   2.28   2.28   2.28   2.28   2.28   2.28
     1   2.28   3.07   2.27   2.27   2.28   2.27   2.28   2.28   2.28   2.27   2.27   2.27   2.27   2.27   2.28   2.28
     2   2.34   2.32   3.13   2.27   2.26   2.27   2.27   2.27   2.27   2.27   2.27   2.27   2.27   2.27   2.26   2.27
     3   2.28   2.27   2.27   3.06   2.27   2.27   2.27   2.27   2.27   2.27   2.27   2.27   2.27   2.27   2.27   2.42
     4   2.33   2.30   2.29   2.28   3.10   2.28   2.28   2.28   2.28   2.28   2.28   2.28   2.29   2.28   2.28   2.28
     5   2.28   2.28   2.28   2.28   2.28   3.05   2.28   2.28   2.28   2.28   2.28   2.28   2.28   2.28   2.28   2.28
     6   2.29   2.31   2.35   2.30   2.30   2.32   3.10   2.27   2.28   2.27   2.27   2.27   2.27   2.28   2.31   2.31
     7   2.35   2.32   2.33   2.39   2.36   2.39   2.41   3.18   2.37   2.38   2.37   2.38   2.36   2.39   2.40   2.38
     8   2.60   2.68   2.68   2.67   2.68   2.67   2.63   2.64   3.44   2.63   2.60   2.60   2.60   2.64   2.68   2.68
     9   2.69   2.59   2.59   2.55   2.60   2.58   2.57   2.57   2.55   3.34   2.53   2.53   2.53   2.54   2.57   2.55
    10   2.60   2.60   2.59   2.57   2.63   2.61   2.61   2.61   2.59   2.63   3.36   2.58   2.60   2.55   2.59   2.59
    11   2.61   2.60   2.62   2.59   2.59   2.60   2.60   2.55   2.61   2.61   2.63   3.35   2.55   2.56   2.59   2.61
    12   2.63   2.61   2.58   2.63   2.64   2.63   2.60   2.62   2.59   2.65   2.63   2.65   3.38   2.63   2.68   2.69
    13   2.67   2.66   2.69   2.68   2.67   2.70   2.69   2.67   2.66   2.70   2.69   2.68   2.69   3.43   2.73   2.72
    14   2.71   2.74   2.76   2.75   2.74   2.75   2.75   2.74   2.71   2.66   2.72   2.70   2.71   2.71   3.31   2.66
    15   2.70   2.71   2.71   2.71   2.70   2.70   2.70   2.71   2.70   2.71   2.70   2.71   2.70   2.70   2.71   3.45

   CPU     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0   3.79   2.80   2.79   2.79   2.78   2.78   2.79   2.77   2.79   2.79   2.81   2.79   2.80   2.80   2.81   2.81
     1   2.77   3.70   2.75   2.73   2.74   2.79   2.80   2.80   2.81   2.83   2.83   2.85   2.86   2.84   2.89   2.90
     2   2.96   2.95   3.76   2.84   2.83   2.84   2.82   2.83   2.85   2.84   2.85   2.85   2.87   2.83   2.85   2.87
     3   2.91   2.90   2.90   3.69   2.83   2.83   2.81   2.81   2.82   2.83   2.81   2.82   2.82   2.81   2.82   3.05
     4   2.95   2.93   2.89   2.89   3.73   2.81   2.82   2.80   2.84   2.83   2.84   2.82   2.86   2.83   2.85   2.85
     5   2.86   2.85   2.87   2.87   2.88   3.68   2.84   2.83   2.86   2.83   2.85   2.85   2.85   2.86   2.88   2.90
     6   2.92   2.93   2.98   2.93   2.92   2.94   3.73   2.87   2.90   2.90   2.90   2.88   2.90   2.91   2.94   2.93
     7   2.98   2.94   2.95   3.02   2.98   3.02   3.03   3.80   2.99   3.00   3.00   3.01   2.99   3.01   3.02   3.01
     8   3.22   3.31   3.30   3.30   3.31   3.30   3.26   3.26   4.07   3.26   3.23   3.23   3.23   3.27   3.31   3.31
     9   3.31   3.22   3.22   3.17   3.23   3.21   3.20   3.19   3.18   3.96   3.16   3.16   3.16   3.17   3.20   3.18
    10   3.23   3.23   3.21   3.20   3.26   3.24   3.24   3.24   3.22   3.26   3.99   3.21   3.22   3.18   3.22   3.21
    11   3.24   3.23   3.25   3.22   3.22   3.22   3.22   3.18   3.24   3.24   3.25   3.98   3.17   3.19   3.22   3.23
    12   3.26   3.24   3.20   3.25   3.27   3.25   3.23   3.25   3.22   3.28   3.26   3.28   4.01   3.26   3.31   3.32
    13   3.30   3.29   3.31   3.31   3.30   3.32   3.32   3.30   3.29   3.32   3.32   3.30   3.32   4.05   3.35   3.34
    14   3.34   3.37   3.39   3.38   3.37   3.38   3.38   3.37   3.34   3.29   3.35   3.33   3.33   3.34   3.94   3.29
    15   3.32   3.33   3.34   3.34   3.33   3.33   3.33   3.33   3.33   3.34   3.32   3.34   3.33   3.33   3.34   4.08
P2P=Enabled Latency (P2P Reads) Matrix (us)
   GPU     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0   3.22   9.47   9.53   9.57   9.47   9.49   9.63   9.51  10.03  10.06   9.90   9.81   9.90   9.90   9.91   9.93
     1   9.48   3.09   9.50   9.55   9.49   9.48   9.50   9.42  10.01  10.04   9.92   9.83   9.97   9.92   9.89  10.29
     2   9.46   9.72   3.09   9.57   9.56   9.58   9.45   9.47   9.81   9.84  10.01   9.85   9.93   9.92   9.86   9.85
     3   9.43   9.60   9.54   3.04   9.45   9.45   9.27   9.24   9.80   9.82   9.76   9.66   9.80   9.76   9.72   9.78
     4   9.43   9.55   9.63   9.44   3.08   9.46   9.27   9.60   9.77   9.80   9.74   9.72   9.77   9.76   9.72   9.75
     5   9.39   9.38   9.48   9.57   9.43   3.06   9.53   9.46  10.04   9.91   9.92   9.78   9.98   9.92   9.90   9.82
     6   9.49   9.43   9.57   9.44   9.49   9.77   3.07   9.57   9.93   9.87  10.01   9.90  10.05   9.95   9.94   9.83
     7   9.52   9.45   9.35   9.38   9.64   9.47   9.31   3.04   9.78   9.80   9.74   9.69   9.80   9.77   9.81   9.76
     8   9.49   9.51   9.47   9.48   9.54   9.56   9.47   9.48   3.40   9.95   9.93   9.83   9.98   9.94   9.92   9.96
     9   9.39   9.46   9.41   9.43   9.46   9.46   9.31   9.35   9.78   3.29   9.83   9.82   9.86   9.82   9.95   9.82
    10   9.48   9.30   9.33   9.34   9.52   9.45   9.31   9.31   9.87   9.99   3.39   9.63  10.05   9.77   9.81   9.81
    11   9.34   9.45   9.37   9.39   9.47   9.48   9.29   9.31   9.77   9.95  10.01   3.31   9.87   9.80   9.70   9.78
    12   9.39   9.35   9.26   9.30   9.48   9.48   9.27   9.26   9.76   9.78   9.83   9.90   3.32   9.74   9.69   9.76
    13   9.40   9.26   9.31   9.32   9.53   9.38   9.31   9.28   9.83   9.75   9.76   9.70   9.77   3.33   9.70   9.82
    14   9.46   9.40   9.40   9.42   9.52   9.53   9.54   9.42   9.92   9.94   9.87   9.73   9.88   9.85   3.30   9.89
    15   9.43   9.44   9.39   9.60   9.57   9.49   9.35   9.39   9.74   9.82   9.80   9.83   9.90   9.80   9.75   3.48

   CPU     0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15
     0   3.85   9.74   9.83   9.86   9.75   9.76   9.93   9.80  10.29  10.33  10.18  10.08  10.16  10.16  10.18  10.21
     1   9.76   3.71   9.78   9.82   9.79   9.78   9.76   9.71  10.28  10.32  10.19  10.10  10.25  10.29  10.26  10.66
     2   9.84  10.11   3.81   9.95   9.95   9.97   9.82   9.85  10.18  10.21  10.38  10.23  10.30  10.30  10.24  10.22
     3   9.71   9.87   9.81   3.67   9.73   9.73   9.57   9.54  10.08  10.10  10.02   9.93  10.06  10.03   9.99  10.04
     4   9.71   9.82   9.94   9.71   3.71   9.73   9.56   9.88  10.05  10.06  10.02   9.98  10.04  10.03   9.99  10.01
     5   9.67   9.65   9.77   9.84   9.74   3.69   9.81   9.76  10.34  10.17  10.19  10.05  10.27  10.19  10.16  10.10
     6   9.79   9.71   9.84   9.71   9.76  10.07   3.69   9.86  10.20  10.15  10.27  10.17  10.32  10.21  10.20  10.12
     7   9.81   9.72   9.64   9.65   9.94   9.76   9.59   3.66  10.06  10.06  10.01   9.96  10.08  10.06  10.07  10.02
     8   9.75   9.79   9.74   9.75   9.85   9.86   9.75   9.75   4.02  10.22  10.20  10.09  10.28  10.22  10.20  10.22
     9   9.66   9.74   9.69   9.71   9.74   9.75   9.59   9.63  10.06   3.91  10.11  10.08  10.12  10.09  10.22  10.09
    10   9.75   9.60   9.62   9.63   9.79   9.73   9.62   9.60  10.15  10.27   4.01   9.90  10.31  10.03  10.07  10.08
    11   9.62   9.72   9.65   9.66   9.74   9.76   9.57   9.59  10.04  10.20  10.29   3.93  10.12  10.06   9.96  10.06
    12   9.67   9.63   9.56   9.58   9.75   9.76   9.56   9.56  10.04  10.06  10.09  10.16   3.95  10.00   9.96  10.03
    13   9.68   9.57   9.60   9.62   9.81   9.67   9.61   9.57  10.10  10.01  10.03   9.96  10.03   3.96   9.98  10.09
    14   9.73   9.68   9.68   9.70   9.83   9.80   9.84   9.71  10.18  10.21  10.15  10.02  10.16  10.12   3.93  10.17
    15   9.70   9.72   9.67   9.90   9.88   9.77   9.64   9.66  10.02  10.09  10.07  10.09  10.16  10.07  10.04   4.11

NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.
```