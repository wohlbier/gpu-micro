Some gpu micro kernels.

p2p is modified from
`https://github.com/NVIDIA/cuda-samples/blob/master/Samples/p2pBandwidthLatencyTest/p2pBandwidthLatencyTest.cu`

Results on DGX-2. Someone was using devices 0,3,4,5.
```
CUDA_VISIBLE_DEVICES=1,2,6,7,8,9,10,11,12,13,14,15 ./p2p --p2p_read --nElements=1073741824 --nRepeat=20
[P2P (Peer-to-Peer) GPU Bandwidth Latency Test]
Device: 0, Tesla V100-SXM3-32GB, pciBusID: 36, pciDeviceID: 0, pciDomainID:0
Device: 1, Tesla V100-SXM3-32GB, pciBusID: 39, pciDeviceID: 0, pciDomainID:0
Device: 2, Tesla V100-SXM3-32GB, pciBusID: 5c, pciDeviceID: 0, pciDomainID:0
Device: 3, Tesla V100-SXM3-32GB, pciBusID: 5e, pciDeviceID: 0, pciDomainID:0
Device: 4, Tesla V100-SXM3-32GB, pciBusID: b7, pciDeviceID: 0, pciDomainID:0
Device: 5, Tesla V100-SXM3-32GB, pciBusID: b9, pciDeviceID: 0, pciDomainID:0
Device: 6, Tesla V100-SXM3-32GB, pciBusID: bc, pciDeviceID: 0, pciDomainID:0
Device: 7, Tesla V100-SXM3-32GB, pciBusID: be, pciDeviceID: 0, pciDomainID:0
Device: 8, Tesla V100-SXM3-32GB, pciBusID: e0, pciDeviceID: 0, pciDomainID:0
Device: 9, Tesla V100-SXM3-32GB, pciBusID: e2, pciDeviceID: 0, pciDomainID:0
Device: 10, Tesla V100-SXM3-32GB, pciBusID: e5, pciDeviceID: 0, pciDomainID:0
Device: 11, Tesla V100-SXM3-32GB, pciBusID: e7, pciDeviceID: 0, pciDomainID:0
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

***NOTE: In case a device doesn't have P2P access to other one, it falls back to normal memcopy procedure.
So you can see lesser Bandwidth (GB/s) and unstable Latency (us) in those cases.

P2P Connectivity Matrix
     D\D     0     1     2     3     4     5     6     7     8     9    10    11
     0	     1     1     1     1     1     1     1     1     1     1     1     1
     1	     1     1     1     1     1     1     1     1     1     1     1     1
     2	     1     1     1     1     1     1     1     1     1     1     1     1
     3	     1     1     1     1     1     1     1     1     1     1     1     1
     4	     1     1     1     1     1     1     1     1     1     1     1     1
     5	     1     1     1     1     1     1     1     1     1     1     1     1
     6	     1     1     1     1     1     1     1     1     1     1     1     1
     7	     1     1     1     1     1     1     1     1     1     1     1     1
     8	     1     1     1     1     1     1     1     1     1     1     1     1
     9	     1     1     1     1     1     1     1     1     1     1     1     1
    10	     1     1     1     1     1     1     1     1     1     1     1     1
    11	     1     1     1     1     1     1     1     1     1     1     1     1
Unidirectional P2P=Disabled Bandwidth Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7      8      9     10     11
     0 851.00   9.28  10.74  10.73  10.99  11.01  11.04  11.24  11.24  11.22  10.93  11.04
     1   9.28 850.55  10.58  10.76  11.02  11.02  11.06  11.25  11.25  11.28  11.00  11.03
     2  10.65  10.67 850.61   9.32  11.00  11.01  11.03  11.24  11.22  11.23  11.22  11.03
     3  10.65  10.66   9.35 850.62  10.99  11.00  11.03  11.21  11.24  11.23  11.24  11.02
     4  11.08  11.10  11.16  11.14 850.66   8.69   9.92   9.37  10.78  10.85  10.90  11.32
     5  11.11  11.11  11.17  11.17   8.69 850.58   9.92   9.36  10.86  10.86  10.83  11.34
     6  11.11  10.64  11.28  11.14   9.90   9.88 850.59   9.45  10.86  10.86  10.89  11.35
     7  11.10  11.12  11.19  11.17   9.89   9.88   9.96 850.58  10.86  10.84  10.89  11.35
     8  10.74  11.10  11.19  11.14  11.27  11.27  11.33  10.87 850.60   8.51   9.37   9.91
     9  11.10   9.67  11.17  11.16  11.27  11.27  11.33  10.88   8.53 850.58   9.38   9.93
    10  11.10  11.11  11.20  11.14  11.29  11.27  11.34  10.86   9.37   9.37 850.59   9.92
    11  11.09  11.10  11.19  11.15  11.28  11.27  11.33  10.87   9.37   9.36   9.43 850.59
Unidirectional P2P=Enabled Bandwidth (P2P Writes) Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7      8      9     10     11
     0 848.29 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     1 145.57 848.33 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     2 145.57 145.57 848.32 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     3 145.57 145.57 145.57 848.38 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     4 145.57 145.57 145.57 145.57 848.36 145.57 145.57 145.57 145.57 145.57 145.57 145.57
     5 145.57 145.57 145.57 145.57 145.57 848.35 145.57 145.57 145.57 145.57 145.57 145.57
     6 145.57 145.57 145.57 145.57 145.57 145.57 848.34 145.57 145.57 145.57 145.57 145.57
     7 145.57 145.57 145.57 145.57 145.57 145.57 145.57 848.32 145.57 145.57 145.57 145.57
     8 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 848.34 145.57 145.57 145.57
     9 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 848.29 145.57 145.57
    10 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 850.61 145.57
    11 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 145.57 850.57
Unidirectional P2P=Enabled Bandwidth (P2P Reads) Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7      8      9     10     11
     0 850.59 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50
     1 145.50 850.54 145.50 145.50 145.50 145.50 145.50 145.50 145.51 145.50 145.50 145.50
     2 145.50 145.50 851.26 145.50 145.50 145.50 145.50 145.50 145.51 145.50 145.50 145.50
     3 145.50 145.50 145.50 850.64 145.50 145.50 145.50 145.50 145.50 145.51 145.51 145.51
     4 145.50 145.50 145.50 145.50 850.63 145.50 145.50 145.50 145.50 145.50 145.50 145.51
     5 145.50 145.50 145.50 145.50 145.50 850.52 145.50 145.50 145.50 145.50 145.50 145.50
     6 145.50 145.50 145.50 145.50 145.51 145.51 850.58 145.51 145.50 145.50 145.50 145.50
     7 145.50 145.50 145.50 145.50 145.50 145.50 145.50 850.53 145.50 145.50 145.50 145.50
     8 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 850.58 145.50 145.50 145.50
     9 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 850.60 145.50 145.50
    10 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.51 850.57 145.50
    11 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 145.50 850.63
Bidirectional P2P=Disabled Bandwidth Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7      8      9     10     11
     0 849.47   9.30  10.54  10.72  10.61  11.08  11.09  11.19  11.17  11.21  11.20  11.09
     1   9.25 849.47  10.74   9.84  11.09  10.39  11.12  11.21  11.20  11.23  11.22  11.11
     2  10.73  10.61 849.43   9.35  11.09  11.13  11.13  11.24  11.23  10.96  11.22  11.11
     3  10.73  10.74   9.32 849.47  11.09  11.10  11.13  11.20  11.20  11.23  11.22  11.12
     4  11.07  11.09  11.11  11.13 849.45   8.69   9.91   9.62  11.08  11.09  11.10  11.32
     5  11.08  11.08  11.11  11.13   8.70 849.43   9.91   9.62  11.08  11.08  11.09  11.33
     6  11.10  11.11  11.13  11.13   9.91   9.92 849.43   9.70  11.11  11.11  11.13  11.37
     7  11.20  11.22  11.24  11.20   9.63   9.63   9.70 849.45  10.89  10.89  10.90  11.12
     8  11.19  11.21  11.21  11.20  11.07  11.08  11.11  10.89 849.41   8.52   9.38   9.64
     9  11.22  11.23  10.19  11.24  11.08  11.09  11.11  10.89   8.52 849.47   9.38   9.63
    10  11.21  10.94  11.23  11.22  11.11  11.10  11.13  10.91   9.38   9.37 849.47   9.66
    11  10.73  11.11  11.12  11.10  11.33  11.34  11.36  11.14   9.63   9.64   9.68 849.50
Bidirectional P2P=Enabled Bandwidth Matrix (GB/s)
   D\D     0      1      2      3      4      5      6      7      8      9     10     11
     0 849.80 269.50 269.47 269.38 267.95 268.02 269.99 269.52 268.89 268.94 269.46 269.98
     1 269.49 849.90 271.30 272.88 269.49 269.25 272.26 271.17 270.95 270.85 272.74 272.86
     2 269.45 271.43 849.76 270.81 269.16 269.23 271.53 270.97 269.85 270.46 271.59 271.50
     3 269.40 272.84 270.81 849.93 269.46 269.65 273.34 271.39 270.79 271.43 272.70 273.56
     4 267.94 269.47 269.16 269.48 850.01 267.52 269.96 269.23 269.19 268.76 269.38 269.96
     5 268.11 269.25 269.25 269.68 267.53 849.81 269.70 268.91 268.98 268.69 269.38 270.21
     6 270.07 272.28 271.50 273.32 270.00 269.73 849.90 271.49 270.97 270.76 273.75 273.65
     7 269.57 271.15 270.96 271.39 269.16 268.90 271.51 849.86 270.30 270.32 272.01 271.45
     8 268.86 270.92 269.85 270.80 269.23 268.97 271.10 270.31 849.91 270.22 270.83 272.13
     9 268.98 270.71 270.64 271.38 268.80 268.73 270.80 270.34 270.11 849.86 271.58 271.26
    10 269.50 272.70 271.57 272.74 269.33 269.33 273.70 271.96 270.84 271.39 849.96 273.96
    11 270.00 272.87 271.52 273.56 269.97 270.22 273.67 271.43 272.07 271.31 273.95 849.85
P2P=Disabled Latency Matrix (us)
   GPU     0      1      2      3      4      5      6      7      8      9     10     11
     0   3.78  24.82  23.70  21.93  22.56  23.54  23.28  22.98  21.23  21.64  22.36  22.35
     1  22.68   3.57  21.97  21.83  22.11  22.18  22.57  20.73  20.89  22.08  22.83  22.33
     2  21.76  21.32   3.52  21.29  21.22  21.74  22.38  21.10  20.67  21.54  20.94  21.30
     3  21.68  21.37  22.81   3.51  22.92  23.01  23.59  20.71  21.53  21.66  20.94  22.55
     4  21.24  21.78  21.93  21.84   3.48  25.05  25.96  25.43  22.65  23.01  22.32  25.00
     5  22.64  22.56  23.32  22.64  23.32   3.44  24.36  23.37  21.78  21.68  21.92  22.84
     6  21.49  22.42  20.91  22.48  25.54  27.16   3.64  24.20  21.00  21.77  22.62  25.73
     7  21.14  20.93  21.12  20.95  20.92  21.05  20.16   3.73  20.15  20.03  20.23  21.76
     8  21.07  21.54  21.58  21.01  21.09  22.49  21.80  19.88   3.67  20.59  20.55  22.86
     9  20.93  20.86  20.92  20.93  22.43  22.86  22.52  20.57  20.32   3.68  20.69  23.56
    10  20.94  20.88  21.40  21.42  22.27  21.17  20.18  19.83  20.26  20.11   3.72  21.98
    11  21.22  21.16  21.21  21.28  26.64  27.91  26.15  21.45  23.89  26.30  24.18   3.48

   CPU     0      1      2      3      4      5      6      7      8      9     10     11
     0   4.03  24.72  23.64  21.89  22.49  23.43  23.20  22.90  21.16  21.56  22.28  22.28
     1  22.64   3.95  21.84  21.79  22.03  22.10  22.50  20.66  20.81  22.01  22.75  22.26
     2  21.71  21.28   4.07  21.25  21.15  21.66  22.30  21.03  20.60  21.47  20.87  21.23
     3  21.64  21.33  22.77   4.05  22.84  22.94  23.52  20.64  21.46  21.60  20.88  22.48
     4  21.14  21.68  21.83  21.74   3.75  24.98  25.97  25.43  22.66  23.02  22.33  25.01
     5  22.56  22.47  23.23  22.56  23.28   3.75  24.32  23.33  21.73  21.45  21.85  22.77
     6  21.41  22.34  20.83  22.40  25.49  27.10   3.99  24.26  21.02  21.79  22.64  25.72
     7  21.04  20.83  21.02  20.85  20.82  21.01  20.10   4.35  20.11  19.98  20.19  21.72
     8  20.96  21.47  21.49  20.93  21.05  22.45  21.75  19.84   4.30  20.54  20.51  22.82
     9  20.84  20.79  20.84  20.85  22.39  22.82  22.45  20.52  20.28   4.31  20.65  23.52
    10  20.85  20.81  21.33  21.34  22.14  21.13  20.14  19.79  20.10  19.88   4.35  21.94
    11  21.13  21.08  21.13  21.20  26.61  27.88  26.11  21.41  23.85  26.27  24.14   3.75
P2P=Enabled Latency (P2P Writes) Matrix (us)
   GPU     0      1      2      3      4      5      6      7      8      9     10     11
     0   4.00   2.90   2.95   2.94   2.97   2.93   2.91   2.88   2.60   2.55   2.50   2.51
     1   2.54   3.57   2.52   2.52   2.52   2.52   2.53   2.50   2.52   2.52   2.50   2.50
     2   2.65   2.63   3.55   2.57   2.58   2.58   2.59   2.53   2.52   2.56   2.61   2.63
     3   2.68   2.68   2.70   3.49   2.65   2.65   2.70   2.66   2.68   2.66   2.67   2.70
     4   2.51   2.48   2.48   2.49   3.45   2.42   2.42   2.36   2.43   2.43   2.43   2.46
     5   2.43   2.43   2.47   2.47   2.49   3.47   2.48   2.42   2.50   2.44   2.45   2.48
     6   2.53   2.51   2.54   2.53   2.50   2.46   3.49   2.41   2.47   2.46   2.46   2.50
     7   2.80   2.78   2.81   2.83   2.81   2.79   2.77   3.71   2.73   2.75   2.72   2.72
     8   2.84   2.80   2.80   2.80   2.79   2.81   2.81   2.76   3.70   2.72   2.71   2.73
     9   2.82   2.79   2.80   2.77   2.75   2.85   2.85   2.82   2.83   3.70   2.76   2.77
    10   2.83   2.81   2.84   2.86   2.87   2.83   2.82   2.79   2.81   2.82   3.70   2.80
    11   2.67   2.65   2.68   2.69   2.67   2.67   2.65   2.59   2.61   2.60   2.56   3.46

   CPU     0      1      2      3      4      5      6      7      8      9     10     11
     0   4.63   3.52   3.58   3.57   3.59   3.56   3.53   3.51   3.23   3.18   3.13   3.14
     1   3.17   4.04   3.14   3.14   3.15   3.15   3.15   3.13   3.14   3.15   3.13   3.13
     2   3.28   3.25   4.05   3.20   3.21   3.21   3.22   3.16   3.15   3.19   3.24   3.26
     3   3.30   3.31   3.33   4.08   3.28   3.28   3.33   3.28   3.31   3.28   3.29   3.32
     4   3.14   3.11   3.11   3.11   3.79   3.04   3.05   2.99   3.05   3.06   3.06   3.09
     5   3.06   3.06   3.09   3.10   3.12   3.76   3.11   3.04   3.13   3.07   3.08   3.11
     6   3.16   3.14   3.16   3.15   3.12   3.08   3.76   3.03   3.10   3.09   3.09   3.13
     7   3.53   3.51   3.54   3.56   3.53   3.45   3.43   4.37   3.39   3.38   3.35   3.35
     8   3.56   3.53   3.53   3.46   3.45   3.47   3.46   3.39   4.33   3.35   3.34   3.36
     9   3.55   3.51   3.52   3.49   3.48   3.51   3.51   3.48   3.49   4.32   3.39   3.40
    10   3.55   3.53   3.56   3.58   3.53   3.49   3.48   3.45   3.44   3.44   4.32   3.42
    11   3.30   3.28   3.30   3.31   3.30   3.30   3.27   3.22   3.24   3.23   3.18   3.74
P2P=Enabled Latency (P2P Reads) Matrix (us)
   GPU     0      1      2      3      4      5      6      7      8      9     10     11
     0   3.55   9.76   9.64   9.62   9.51   9.54   9.54   9.49   9.49   9.50   9.50   9.56
     1   9.70   3.55   9.60   9.64   9.52   9.55   9.54   9.50   9.53   9.51   9.49   9.56
     2   9.85   9.77   3.52   9.76   9.52   9.50   9.56   9.48   9.55   9.48   9.50   9.52
     3   9.71   9.63   9.54   4.01   9.54   9.55   9.52   9.52   9.54   9.53   9.45   9.49
     4   9.61   9.61   9.62   9.66   3.47   9.55   9.57   9.52   9.53   9.51   9.49   9.52
     5   9.63   9.70   9.63   9.68   9.53   3.47   9.54   9.52   9.52   9.55   9.46   9.54
     6   9.64   9.69   9.60   9.65   9.55   9.58   3.47   9.53   9.55   9.52   9.54   9.52
     7   9.81   9.80   9.73   9.78   9.55   9.53   9.52   3.72   9.54   9.49   9.45   9.59
     8  10.08  10.02   9.78   9.88   9.57   9.56   9.50   9.53   3.68   9.53   9.48   9.50
     9   9.86   9.99  10.03  10.04   9.52   9.54   9.52   9.48   9.49   3.73   9.52   9.55
    10  10.09   9.95   9.89   9.97   9.56   9.57   9.52   9.53   9.52   9.51   3.72   9.54
    11   9.63   9.63   9.68   9.54   9.52   9.49   9.54   9.49   9.48   9.51   9.47   3.45

   CPU     0      1      2      3      4      5      6      7      8      9     10     11
     0   3.92  10.03   9.92   9.89   9.77   9.80   9.81   9.77   9.77   9.78   9.78   9.85
     1   9.98   4.00   9.88   9.94   9.79   9.82   9.81   9.76   9.78   9.80   9.75   9.83
     2  10.13  10.07   4.00  10.07   9.79   9.77   9.84   9.77   9.82   9.76   9.78   9.80
     3  10.01   9.90   9.82   4.63   9.81   9.82   9.81   9.80   9.81   9.80   9.75   9.76
     4   9.91   9.90   9.88   9.96   3.74   9.80   9.85   9.81   9.80   9.79   9.77   9.81
     5   9.91   9.97   9.93   9.96   9.79   3.75   9.81   9.78   9.78   9.83   9.74   9.80
     6   9.91   9.96   9.87   9.92   9.81   9.84   3.75   9.82   9.82   9.79   9.82   9.81
     7  10.08  10.09  10.02  10.07   9.83   9.81   9.79   4.35   9.79   9.76   9.73   9.86
     8  10.35  10.30  10.06  10.15   9.83   9.82   9.79   9.81   4.30   9.80   9.76   9.78
     9  10.13  10.26  10.30  10.32   9.79   9.81   9.79   9.76   9.75   4.36   9.81   9.83
    10  10.37  10.22  10.17  10.24   9.83   9.83   9.80   9.81   9.79   9.79   4.34   9.82
    11   9.92   9.89   9.96   9.80   9.78   9.75   9.81   9.78   9.73   9.77   9.76   3.76

NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.
```