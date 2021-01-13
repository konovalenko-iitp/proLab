
function RGB = Canon5DMarkIII_spectralSensitivity(lambda)

    [fullLambda, R, G, B] = get_data;
 
    fullLambda = [-Inf; fullLambda; Inf];
    
    R = [R(1); R; R(end)];
    G = [G(1); G; G(end)];
    B = [B(1); B; B(end)];
    
    idx = knnsearch(fullLambda,lambda);
    idx(lambda <= fullLambda(idx)) = idx(lambda <= fullLambda(idx)) - 1;
    t = (lambda - fullLambda(idx))./(fullLambda(idx+1) - fullLambda(idx));
    RGB = [(1-t).*R(idx) + t.*R(idx+1), (1-t).*G(idx) + t.*G(idx+1), (1-t).*B(idx) + t.*B(idx+1)];

    RGB(isnan(RGB))=0;
    
end

function [fullLambda, R, G, B] = get_data

    data = [380.0,0.00010782834,0.02183312,0.0
    380.6678,0.00010782834,0.02183312,0.0
    381.33557,0.00010782834,0.02183312,0.0
    382.00333,0.00010782834,0.02183312,0.0
    382.6711,0.00010782834,0.02183312,0.0
    383.3389,0.00010782834,0.02183312,0.0
    384.00668,0.00010782834,0.02183312,0.0
    384.67447,0.00010782834,0.02183312,0.0
    385.34222,0.00010782834,0.02183312,0.0
    386.01,0.00010782834,0.02183312,0.0
    386.6778,0.00010782834,0.02183312,0.0
    387.34558,0.00010782834,0.02183312,0.0
    388.01337,0.00010782834,0.02183312,0.0
    388.68112,0.00010782834,0.02183312,0.0
    389.3489,0.00010782834,0.02183312,0.0
    390.0167,0.00010782834,0.02183312,0.0
    390.68448,0.00010782834,0.02183312,0.0
    391.35226,0.00010782834,0.02183312,0.0
    392.02002,0.00010782834,0.02183312,0.0
    392.6878,0.00010782834,0.02183312,0.0
    393.3556,0.00010782834,0.02183312,0.0
    394.02338,0.00010782834,0.02183312,0.0
    394.69116,0.00010782834,0.02183312,0.0
    395.35892,0.00010782834,0.02183312,0.0
    396.0267,0.00010782834,0.02183312,0.0
    396.6945,0.00010782834,0.02183312,0.0
    397.36227,0.00010782834,0.02183312,0.0
    398.03006,0.00010782834,0.02183312,0.0
    398.6978,0.00010782834,0.02183312,0.0
    399.3656,0.00010782834,0.02183312,0.0
    400.0334,0.00010782834,0.02183312,0.00016224377
    400.70117,0.00010782834,0.02183312,0.003407119
    401.36896,0.00010782834,0.02183312,0.0066519943
    402.0367,0.00010782834,0.02183312,0.0075825374
    402.7045,0.00010782834,0.02183312,0.008237106
    403.37228,0.00010782834,0.02183312,0.008891675
    404.04007,-0.000126325,0.021842051,0.009546244
    404.70786,-0.00037346422,0.021884052,0.0102008125
    405.37564,-0.00062060344,0.021926051,0.01085538
    406.0434,-0.00086774264,0.02196805,0.011509949
    406.71118,-0.0011148818,0.022010049,0.012164518
    407.37897,-0.0013620211,0.022052048,0.013695605
    408.04675,-0.0016091602,0.022094049,0.017378163
    408.71454,-0.0018562995,0.022136047,0.02106072
    409.3823,-0.0021034386,0.022263361,0.024743278
    410.05008,-0.0023505779,0.02268664,0.028425833
    410.71786,-0.002597717,0.02310992,0.032108393
    411.38565,-0.0028448564,0.0235332,0.035790946
    412.05344,-0.0030919956,0.02395648,0.039473504
    412.7212,-0.0033391346,0.02437976,0.04315606
    413.38898,-0.0035862739,0.024803039,0.049012855
    414.05676,-0.0038334131,0.02522632,0.057324503
    414.72455,-0.004080552,0.0256496,0.06563615
    415.39233,-0.0043276916,0.026711615,0.073947795
    416.0601,-0.0045748306,0.02823613,0.08225945
    416.72787,-0.00482197,0.029760646,0.09057109
    417.39566,-0.005069109,0.031285163,0.09888274
    418.06345,-0.005316248,0.03280968,0.10762313
    418.73123,-0.0055633876,0.034334194,0.11817072
    419.399,-0.0058105267,0.035858713,0.12871832
    420.06677,-0.006057666,0.03738323,0.13926591
    420.73456,-0.005880511,0.038907744,0.1498135
    421.40234,-0.005589844,0.038823806,0.1603611
    422.07013,-0.005299177,0.038630392,0.17059216
    422.73788,-0.00500851,0.03843698,0.17895192
    423.40567,-0.0047178427,0.03824357,0.1873117
    424.07346,-0.0044271755,0.038050156,0.19567145
    424.74124,-0.004136509,0.037856743,0.20403121
    425.40903,-0.0038458416,0.03766333,0.21239099
    426.07678,-0.0035681692,0.037469916,0.22075075
    426.74457,-0.0033457843,0.037637312,0.23102538
    427.41235,-0.003123399,0.038677286,0.24149124
    428.08014,-0.0029010142,0.039717257,0.2519571
    428.74792,-0.0026786292,0.04075723,0.26242295
    429.41568,-0.002456244,0.041797202,0.2728888
    430.08347,-0.0022338592,0.042837173,0.2885247
    430.75125,-0.0020114742,0.043877147,0.3043901
    431.41904,-0.0017890892,0.044917118,0.32025555
    432.08682,-0.0012432083,0.045957092,0.33529633
    432.75458,-0.00047501345,0.048483174,0.3464645
    433.42236,0.00029318142,0.051813718,0.3576327
    434.09015,0.0010613763,0.05514426,0.36880088
    434.75793,0.0018295712,0.058474805,0.37996906
    435.42572,0.002597766,0.06180535,0.39589697
    436.09348,0.003365961,0.065135896,0.41610152
    436.76126,0.004134156,0.06846644,0.43630603
    437.42905,0.0049023507,0.07179698,0.45587048
    438.09683,0.0052441345,0.07511673,0.47519052
    438.76462,0.005580314,0.07631087,0.49514958
    439.43237,0.0059164935,0.07750502,0.51739055
    440.10016,0.0062526735,0.078699164,0.5396315
    440.76794,0.006588853,0.079893306,0.55458605
    441.43573,0.0069250325,0.081087455,0.56911296
    442.10352,0.007261212,0.0822816,0.5836399
    442.77127,0.0075973915,0.083475746,0.5926862
    443.43906,0.007801154,0.08466989,0.5979862
    444.10684,0.0077958168,0.085338816,0.6032863
    444.77463,0.00779048,0.085079335,0.6085864
    445.4424,0.0077851424,0.084819846,0.6138865
    446.11017,0.007779805,0.08456036,0.6191866
    446.77795,0.007774468,0.084300876,0.6244866
    447.44574,0.0077691306,0.08404139,0.62831193
    448.11353,0.007763793,0.0837819,0.6313121
    448.7813,0.0077584563,0.08352241,0.6343122
    449.4491,0.007644638,0.08326293,0.63731235
    450.11685,0.007502582,0.08450485,0.64031255
    450.78464,0.007360526,0.086337715,0.6433127
    451.45242,0.0072184703,0.08817057,0.64631283
    452.1202,0.0070764143,0.09000344,0.64931303
    452.788,0.0069343587,0.0918363,0.6523132
    453.45575,0.0067923027,0.09366916,0.6575085
    454.12354,0.006650247,0.09550203,0.6650917
    454.79132,0.0066089923,0.09733489,0.67267483
    455.4591,0.0069679255,0.0993864,0.680258
    456.1269,0.0073268586,0.10418074,0.6878412
    456.79465,0.0076857917,0.108975075,0.6954243
    457.46243,0.008044725,0.11376941,0.7030075
    458.13022,0.008403658,0.11856375,0.7116498
    458.798,0.0087625915,0.123358086,0.7213096
    459.4658,0.009121524,0.12815242,0.7309694
    460.13354,0.009480458,0.13294676,0.7406293
    460.80133,0.009538009,0.13787398,0.75028914
    461.46912,0.009395953,0.14493103,0.75994897
    462.1369,0.009253898,0.1519881,0.764384
    462.8047,0.009111841,0.15904516,0.76525587
    463.47244,0.008969786,0.16610222,0.7661277
    464.14023,0.00882773,0.17315929,0.7669996
    464.808,0.008685674,0.18021634,0.76787144
    465.4758,0.008543618,0.1872734,0.76874334
    466.1436,0.008408136,0.19577241,0.76961523
    466.81134,0.008971771,0.20826063,0.77048707
    467.47913,0.009535407,0.22074886,0.77135897
    468.1469,0.010099043,0.23323709,0.76825225
    468.8147,0.010662679,0.24601363,0.7648096
    469.48248,0.011226314,0.26649538,0.761367
    470.15024,0.011789951,0.2869771,0.75792444
    470.81802,0.012353586,0.30086133,0.7544818
    471.4858,0.0129172215,0.30183378,0.7510392
    472.1536,0.013554805,0.30280623,0.7475966
    472.82138,0.014300278,0.3037787,0.744154
    473.48914,0.015045752,0.30475116,0.7392376
    474.15692,0.015791224,0.33855018,0.7318976
    474.8247,0.016536698,0.37053123,0.72455764
    475.4925,0.017282171,0.39000484,0.7172176
    476.16028,0.018027645,0.4094785,0.7098776
    476.82803,0.018773118,0.42895213,0.7025376
    477.49582,0.01951859,0.44717124,0.6951976
    478.1636,0.020245854,0.46491522,0.68694425
    478.8314,0.020968605,0.4826592,0.67797977
    479.49918,0.021691354,0.49850976,0.66901535
    480.16693,0.022414103,0.51359844,0.6600509
    480.83472,0.023136852,0.5286872,0.6510865
    481.5025,0.023859603,0.5381352,0.6421913
    482.1703,0.024582352,0.5420412,0.6333116
    482.83807,0.025305102,0.54594713,0.62443197
    483.50583,0.025955115,0.54985315,0.6155523
    484.1736,0.026307415,0.55375916,0.60667264
    484.8414,0.026659714,0.55766517,0.59748006
    485.5092,0.027012015,0.5615712,0.58796036
    486.17697,0.027364315,0.56547713,0.57844067
    486.84473,0.027716616,0.56938314,0.56892097
    487.5125,0.028068915,0.5733857,0.5593804
    488.1803,0.028421216,0.5795831,0.54948294
    488.84808,0.028773516,0.58578056,0.5395855
    489.51587,0.029182106,0.591978,0.529688
    490.18362,0.03005461,0.5981754,0.51979053
    490.8514,0.030927114,0.60503954,0.50989306
    491.5192,0.03179962,0.6149403,0.5035702
    492.18698,0.032672122,0.62484103,0.4995921
    492.85477,0.033544622,0.6347418,0.49561402
    493.52255,0.034417126,0.6446425,0.49163592
    494.1903,0.03528963,0.6545432,0.48765785
    494.8581,0.036162134,0.6656813,0.48367977
    495.52588,0.037550475,0.679268,0.47970167
    496.19366,0.038944,0.6928547,0.4757236
    496.86145,0.04033752,0.70644146,0.4717455
    497.5292,0.04173105,0.72004515,0.4668818
    498.197,0.04312457,0.73486,0.4619212
    498.86478,0.044518095,0.74967486,0.45696056
    499.53256,0.045911618,0.7644897,0.45199993
    500.20035,0.047305144,0.7762023,0.44703934
    500.8681,0.048306905,0.7769698,0.4420787
    501.5359,0.049247336,0.77773726,0.43711808
    502.20367,0.050187767,0.7785047,0.4309524
    502.87146,0.051128197,0.7792722,0.42062443
    503.53925,0.05206863,0.78003967,0.41029644
    504.207,0.05300906,0.78080714,0.39996845
    504.8748,0.053949494,0.7815746,0.38964045
    505.54257,0.054889925,0.7823421,0.37908068
    506.21036,0.055830356,0.7839582,0.36850405
    506.87814,0.057176422,0.78605676,0.3579274
    507.5459,0.058645483,0.7881553,0.3473508
    508.21368,0.06011454,0.7902539,0.3372075
    508.88147,0.0615836,0.79235244,0.32795316
    509.54926,0.06305266,0.794451,0.31869885
    510.21704,0.064521715,0.7965496,0.30944455
    510.8848,0.065990776,0.7986482,0.3001902
    511.55258,0.06745984,0.80435973,0.29130125
    512.22034,0.069352,0.8148535,0.28619602
    512.8881,0.07144928,0.82534724,0.2810908
    513.5559,0.07354655,0.83584106,0.2759856
    514.2237,0.07564383,0.8463348,0.27088037
    514.8915,0.0777411,0.85682863,0.26577514
    515.55927,0.07983838,0.8682588,0.26066995
    516.22705,0.08193565,0.87980926,0.25556472
    516.89484,0.08403292,0.89135975,0.2504595
    517.5626,0.0861302,0.90291023,0.24529095
    518.2304,0.08822747,0.91450083,0.24010757
    518.8982,0.09001737,0.9261838,0.23492418
    519.5659,0.09172733,0.9378668,0.2297408
    520.2337,0.09343729,0.9495498,0.2245574
    520.9015,0.09514725,0.9612328,0.21937402
    521.5693,0.09685721,0.9646435,0.21419063
    522.23706,0.09856717,0.9665888,0.20923187
    522.90485,0.100277126,0.96853405,0.2047418
    523.57263,0.101902634,0.9704793,0.20025174
    524.2404,0.103248395,0.97242457,0.19576167
    524.9082,0.10459415,0.9743699,0.1912716
    525.576,0.10593991,0.97631514,0.18678154
    526.2437,0.10728567,0.9782604,0.18229148
    526.9115,0.10863143,0.98020566,0.1778014
    527.5793,0.10997719,0.9814668,0.17331134
    528.2471,0.111322954,0.98237824,0.16934636
    528.91486,0.11266871,0.9832897,0.1658346
    529.58264,0.11398856,0.98420113,0.16232283
    530.2504,0.11524542,0.98511255,0.15881108
    530.9182,0.11650226,0.986024,0.1552993
    531.586,0.117759116,0.98693544,0.15178755
    532.2538,0.11901597,0.9878469,0.1482758
    532.9215,0.120272815,0.98826116,0.14476402
    533.5893,0.12152967,0.988288,0.14125226
    534.2571,0.12278652,0.9883148,0.13943098
    534.92487,0.12493028,0.9883417,0.13762039
    535.59265,0.12810881,0.9883685,0.13580978
    536.26044,0.13128734,0.98839533,0.13399918
    536.9282,0.13446587,0.98842216,0.13218857
    537.596,0.1376444,0.988449,0.13037796
    538.2638,0.14082293,0.98847586,0.12856737
    538.9316,0.14400145,0.984579,0.12675676
    539.5993,0.14717999,0.9803331,0.12478007
    540.2671,0.15038587,0.9760871,0.12257953
    540.9349,0.1537202,0.97184116,0.12037899
    541.60266,0.15705453,0.96759516,0.11817845
    542.27045,0.16038886,0.9633492,0.11597791
    542.93823,0.16372319,0.9591032,0.11377737
    543.606,0.16705751,0.9548573,0.11157683
    544.2738,0.17039183,0.95030296,0.1093763
    544.9416,0.17372616,0.9449337,0.10717575
    545.6094,0.17706048,0.93956447,0.10552976
    546.2771,0.18049626,0.9341953,0.1039712
    546.9449,0.18440565,0.92882603,0.102412626
    547.6127,0.18831503,0.92345685,0.100854054
    548.28046,0.19222443,0.9180876,0.09929548
    548.94824,0.19613382,0.91271836,0.09773692
    549.616,0.2000432,0.90734917,0.096178345
    550.2838,0.2039526,0.90343875,0.09461977
    550.9516,0.20786199,0.9003821,0.09295915
    551.6194,0.21177137,0.89732546,0.09105149
    552.2872,0.21631147,0.8942689,0.08914382
    552.9549,0.2214241,0.8912122,0.08723616
    553.6227,0.22653674,0.8881556,0.0853285
    554.29047,0.23164938,0.88509893,0.083420835
    554.95825,0.23676202,0.88204235,0.08151317
    555.62604,0.24187465,0.8789857,0.079605505
    556.2938,0.24698728,0.8759641,0.07769784
    556.9616,0.25209993,0.87294304,0.07609418
    557.6294,0.25721255,0.8699219,0.07494373
    558.2972,0.26306564,0.8669008,0.07379327
    558.96497,0.2697884,0.8638797,0.07264282
    559.63275,0.2765112,0.86085856,0.07149236
    560.3005,0.28323397,0.85783744,0.0703419
    560.96826,0.28995672,0.8548163,0.06919145
    561.63605,0.2966795,0.8504613,0.06804099
    562.30383,0.30340227,0.844969,0.067420706
    562.9716,0.31012505,0.8394766,0.06703999
    563.6394,0.31707644,0.83398426,0.06665927
    564.3072,0.32414103,0.82849187,0.066278554
    564.975,0.33120564,0.82299954,0.06589784
    565.64276,0.33827022,0.81750715,0.06551712
    566.31055,0.3453348,0.8120148,0.0651364
    566.9783,0.3523994,0.8046978,0.064755686
    567.64606,0.36058617,0.79544634,0.06437497
    568.31384,0.36950412,0.7861948,0.063591346
    568.9816,0.37842208,0.77694327,0.062490467
    569.6494,0.38734004,0.7676918,0.061389584
    570.3172,0.39625797,0.7583633,0.060288705
    570.985,0.4052071,0.7489663,0.059187826
    571.6528,0.4141698,0.7395693,0.058086943
    572.32056,0.42313245,0.7301723,0.056986064
    572.98834,0.43209514,0.72077525,0.055885185
    573.65607,0.44105783,0.71021307,0.0547843
    574.32385,0.4500205,0.69905853,0.05453482
    574.99164,0.45931745,0.68790394,0.054301582
    575.6594,0.4720428,0.6767494,0.054068346
    576.3272,0.48476815,0.66583306,0.05383511
    576.995,0.4974935,0.65556186,0.053601872
    577.6628,0.51021886,0.64529073,0.053368635
    578.33057,0.52187,0.6350196,0.0531354
    578.99835,0.5329531,0.62474847,0.05290216
    579.66614,0.54403615,0.61500764,0.052588798
    580.33386,0.5551192,0.60637295,0.052150298
    581.00165,0.5662023,0.59773827,0.051711798
    581.66943,0.5766303,0.5891036,0.0512733
    582.3372,0.5870224,0.5804689,0.0508348
    583.005,0.5974146,0.5721366,0.0503963
    583.6728,0.60780674,0.5659068,0.049957804
    584.3406,0.6181989,0.55967706,0.049519304
    585.00836,0.628591,0.5534473,0.049080804
    585.67615,0.63898313,0.54721755,0.049044736
    586.34393,0.64937526,0.5409878,0.049107734
    587.01166,0.65778095,0.53475803,0.04917073
    587.67944,0.6652696,0.5285283,0.049233727
    588.3472,0.67275834,0.52020586,0.049296726
    589.015,0.680247,0.50963545,0.049359724
    589.6828,0.68773574,0.49906507,0.049422722
    590.3506,0.6952244,0.4884947,0.04948572
    591.0184,0.70271313,0.4776833,0.04934074
    591.68616,0.70422775,0.46676663,0.04839988
    592.35394,0.7018439,0.45584998,0.047459025
    593.0217,0.6994601,0.4449333,0.046518166
    593.68945,0.69707626,0.43328846,0.04557731
    594.35724,0.69469243,0.42059514,0.04463645
    595.025,0.6923086,0.40790182,0.04369559
    595.6928,0.6899248,0.39520848,0.042754736
    596.3606,0.68754095,0.38233575,0.041813876
    597.0284,0.6851572,0.3692693,0.041059103
    597.69617,0.6814117,0.3562029,0.040415198
    598.36395,0.6764439,0.34313646,0.039771292
    599.03174,0.671476,0.33062896,0.039127387
    599.6995,0.66650814,0.31857523,0.03848348
    600.36725,0.6615403,0.3065215,0.037839577
    601.03503,0.65657246,0.29446778,0.03719567
    601.7028,0.6516046,0.2831938,0.036551766
    602.3706,0.6466368,0.2723918,0.035933577
    603.0384,0.6416653,0.26158983,0.035905458
    603.7062,0.63597834,0.25078782,0.03587734
    604.37396,0.63029134,0.24033844,0.03584922
    605.04175,0.62460434,0.23070768,0.035821103
    605.70953,0.61891735,0.2210769,0.03579298
    606.3773,0.61323035,0.21144614,0.03576486
    607.0451,0.6075434,0.20181538,0.035736743
    607.7128,0.6018564,0.19262555,0.035708625
    608.3806,0.5961694,0.18473184,0.035271756
    609.0484,0.5907344,0.17683814,0.034330897
    609.7162,0.58555794,0.16894443,0.03339004
    610.384,0.5803815,0.16105074,0.032449182
    611.05176,0.5752051,0.1548924,0.031508323
    611.71954,0.5700286,0.15062442,0.030567467
    612.3873,0.5648522,0.14635643,0.029626608
    613.0551,0.5596757,0.14208844,0.02868575
    613.7229,0.55449927,0.13782045,0.027744893
    614.3906,0.54932284,0.13355246,0.02765906
    615.0584,0.54415435,0.12928449,0.027704056
    615.7262,0.5389861,0.1250165,0.02774905
    616.394,0.53381777,0.120748505,0.027794046
    617.06177,0.5286495,0.11699539,0.027839042
    617.72955,0.52348125,0.113344096,0.027884036
    618.39734,0.51831293,0.1096928,0.027929032
    619.0651,0.5131447,0.106041506,0.027974026
    619.7329,0.5079764,0.10239021,0.028022626
    620.4007,0.501219,0.098738916,0.028089067
    621.0684,0.4941653,0.09508762,0.028155508
    621.7362,0.48711166,0.09143633,0.028221946
    622.404,0.480058,0.08805026,0.028288387
    623.0718,0.47300437,0.08578652,0.028354827
    623.73956,0.46595073,0.08352279,0.028421266
    624.40735,0.46005914,0.08125905,0.028487707
    625.07513,0.4544202,0.07899531,0.028554147
    625.7429,0.44878125,0.07673158,0.028517215
    626.4107,0.44314232,0.07446784,0.028135095
    627.0785,0.43750337,0.0722041,0.027752975
    627.7462,0.43186444,0.069940366,0.027370855
    628.414,0.42622548,0.067833364,0.026988735
    629.0818,0.42058656,0.06585594,0.026606616
    629.7496,0.41530332,0.06387853,0.026224496
    630.41736,0.4100476,0.061901115,0.025842376
    631.08514,0.40479186,0.059923697,0.025460256
    631.7529,0.39953613,0.057946283,0.025729157
    632.4207,0.3942804,0.05596887,0.026054224
    633.0885,0.38902467,0.05399145,0.026379293
    633.7563,0.38376895,0.052014038,0.02670436
    634.424,0.37851322,0.051190995,0.027029427
    635.0918,0.3736588,0.050491016,0.027354496
    635.7596,0.3689062,0.049791034,0.027679563
    636.42737,0.3641536,0.049091052,0.02800463
    637.09515,0.359401,0.04839107,0.02836802
    637.76294,0.35464838,0.04769109,0.028771466
    638.4307,0.34989575,0.04699111,0.02917491
    639.0985,0.34514314,0.046291128,0.029578354
    639.7663,0.34039053,0.04549955,0.0299818
    640.4341,0.33559096,0.044447172,0.030385243
    641.1018,0.33073434,0.043394797,0.030788688
    641.7696,0.3258777,0.042342417,0.031192131
    642.4374,0.32102108,0.04129004,0.031353448
    643.10516,0.31616446,0.040237665,0.031166194
    643.77295,0.31130785,0.039185286,0.030978942
    644.44073,0.30645123,0.03813291,0.03079169
    645.1085,0.30159461,0.037080534,0.030604439
    645.7763,0.29673797,0.03625887,0.030417185
    646.4441,0.29190215,0.03558091,0.030229934
    647.1119,0.28707328,0.034902956,0.030042682
    647.77966,0.28224444,0.034225,0.02985543
    648.4474,0.27741557,0.033547044,0.029668177
    649.1152,0.2725867,0.032869086,0.02931709
    649.78296,0.26775786,0.032191128,0.028840054
    650.45074,0.262929,0.031513173,0.028363017
    651.1185,0.25810012,0.030835217,0.027885979
    651.7863,0.25342762,0.030564198,0.027408943
    652.4541,0.24929272,0.030304711,0.026931906
    653.1219,0.24515781,0.030045224,0.02645487
    653.7897,0.24102288,0.029785737,0.025977833
    654.45746,0.23688798,0.029526252,0.025837475
    655.1252,0.23275305,0.029266765,0.026257448
    655.79297,0.22861814,0.029007278,0.026677419
    656.46075,0.22448322,0.028747791,0.02709739
    657.12854,0.2203483,0.028401429,0.02751736
    657.7963,0.21574397,0.027877646,0.02793733
    658.4641,0.21093012,0.027353862,0.0283573
    659.1319,0.20611626,0.026830079,0.028777272
    659.7997,0.2013024,0.026306296,0.029055474
    660.46747,0.19648853,0.025782513,0.029156853
    661.13525,0.19167466,0.025258727,0.029258229
    661.803,0.1868608,0.024734944,0.029359605
    662.47076,0.18367323,0.02421116,0.029460983
    663.13855,0.1806449,0.024200307,0.02956236
    663.80634,0.17761657,0.024425363,0.029663736
    664.4741,0.17458822,0.024650421,0.029765114
    665.1419,0.17155989,0.024875479,0.02986649
    665.8097,0.16853154,0.025100535,0.029967824
    666.4775,0.1655032,0.025325593,0.030068738
    667.14526,0.16247486,0.02555065,0.03016965
    667.81305,0.15917376,0.025775708,0.030270563
    668.4808,0.15450697,0.025959,0.030371478
    669.14856,0.14984018,0.02517092,0.03047239
    669.81635,0.14517339,0.024382839,0.030573305
    670.48413,0.14050658,0.02359476,0.030674217
    671.1519,0.13583979,0.02280668,0.030775132
    671.8197,0.131173,0.022018598,0.030912487
    672.4875,0.1265062,0.021230519,0.031053081
    673.1553,0.121839404,0.02044244,0.031193675
    673.82306,0.117083676,0.019654358,0.03133427
    674.49084,0.11227798,0.019207701,0.031474862
    675.15857,0.10747227,0.019278586,0.03161546
    675.82635,0.10266657,0.019349469,0.03175605
    676.49414,0.097860865,0.019420354,0.031896647
    677.1619,0.09305516,0.019491239,0.03182627
    677.8297,0.08824946,0.019562121,0.03131165
    678.4975,0.08344375,0.019633006,0.030797033
    679.1653,0.078886926,0.019703891,0.030282414
    679.83307,0.07622697,0.019774774,0.029767795
    680.50085,0.073567025,0.018851262,0.029253175
    681.16864,0.07090707,0.017602865,0.028738556
    681.83636,0.068247125,0.016354468,0.028223937
    682.50415,0.06558717,0.015106071,0.027709318
    683.17194,0.062927224,0.013857673,0.02789428
    683.8397,0.06026727,0.012609276,0.028331215
    684.5075,0.05760732,0.011360879,0.028768146
    685.1753,0.055268575,0.010112482,0.029205078
    685.8431,0.053181607,0.009891883,0.02964201
    686.51086,0.05109464,0.009790842,0.030078942
    687.17865,0.049007673,0.009689802,0.030515874
    687.84644,0.04692071,0.009588762,0.030952806
    688.51416,0.044833742,0.009487722,0.03126286
    689.18195,0.042746775,0.009386682,0.030755907
    689.84973,0.04065981,0.009285642,0.030248955
    690.5175,0.038572844,0.009184602,0.029742002
    691.1853,0.036485877,0.009083562,0.029235052
    691.8531,0.034398913,0.0089825215,0.0287281
    692.5209,0.032311946,0.009106587,0.028221147
    693.18866,0.032162666,0.0096203415,0.027714197
    693.85645,0.032225665,0.010134096,0.027207244
    694.52423,0.032288663,0.010647852,0.027261566
    695.192,0.032351658,0.011161607,0.027779724
    695.85974,0.032414656,0.011675362,0.028297884
    696.5275,0.032477655,0.012189116,0.028816042
    697.1953,0.032540653,0.012702871,0.0293342
    697.8631,0.03260365,0.013216626,0.02985236
    698.5309,0.03266665,0.012102432,0.030370519
    699.19867,0.032729648,0.0109015005,0.030888677
    699.86646,0.032792646,0.009700569,0.031406835
    700.53424,0.032855645,0.008499637,0.03147308
    701.202,0.032918643,0.007298706,0.031513304
    701.8698,0.03298164,0.0060977745,0.031553525
    702.53754,0.03304464,0.004896843,0.031593747
    703.2053,0.03310764,0.0036959115,0.031633966
    703.8731,0.033170633,0.0031432922,0.031674188
    704.5409,0.03323363,0.0035920744,0.03171441
    705.2087,0.03329663,0.0040408564,0.03175463
    705.87646,0.03335963,0.004489639,0.031666998
    706.54425,0.033422627,0.004938421,0.03134255
    707.21204,0.033485625,0.005387203,0.031018103
    707.8798,0.033548623,0.0058359853,0.030693656
    708.5476,0.03361162,0.0062847673,0.03036921
    709.21533,0.03367462,0.0067335493,0.030044762
    709.8831,0.03373762,0.0071823318,0.029720316
    710.5509,0.033800617,0.0076311138,0.029395869
    711.2187,0.033863615,0.0076381527,0.029071422
    711.8865,0.03392661,0.007617952,0.02960675
    712.55426,0.03398961,0.0075977505,0.030412054
    713.22205,0.034052607,0.007577549,0.031217357
    713.88983,0.034115605,0.0075573483,0.03202266
    714.5576,0.034178603,0.007537147,0.032827962
    715.2254,0.0342416,0.007516946,0.033633266
    715.8931,0.0343046,0.0072006327,0.03443857
    716.5609,0.0343676,0.0067293695,0.035243873
    717.2287,0.03437028,0.006258107,0.035294443
    717.8965,0.03437028,0.0057868436,0.035294443
    718.5643,0.03437028,0.005315581,0.035294443
    719.23206,0.03437028,0.0048443177,0.035294443
    719.89984,0.03437028,0.004759088,0.035294443
    720.5676,0.03437028,0.004759088,0.035294443
    721.2354,0.03437028,0.004759088,0.035294443
    721.9032,0.03437028,0.004759088,0.035294443
    722.5709,0.03437028,0.004759088,0.035294443
    723.2387,0.03437028,0.004759088,0.035294443
    723.9065,0.03437028,0.004759088,0.035294443
    724.5743,0.03437028,0.004759088,0.035294443
    725.24207,0.03437028,0.004759088,0.035294443
    725.90985,0.03437028,0.004759088,0.035294443
    726.57764,0.03437028,0.004759088,0.035294443
    727.2454,0.03437028,0.004759088,0.035294443
    727.9132,0.03437028,0.004759088,0.035294443
    728.581,0.03437028,0.004759088,0.035294443
    729.2487,0.03437028,0.004759088,0.035294443
    729.9165,0.03437028,0.004759088,0.035294443
    730.5843,0.03437028,0.004759088,0.035294443
    731.2521,0.03437028,0.004759088,0.035294443
    731.91986,0.03437028,0.004759088,0.035294443
    732.58765,0.03437028,0.004759088,0.035294443
    733.25543,0.03437028,0.004759088,0.035294443
    733.9232,0.03437028,0.004759088,0.035294443
    734.591,0.03437028,0.004759088,0.035294443
    735.2588,0.03437028,0.004759088,0.035294443
    735.9266,0.03437028,0.004759088,0.035294443
    736.5943,0.03437028,0.004759088,0.035294443
    737.2621,0.03437028,0.004759088,0.035294443
    737.9299,0.03437028,0.004759088,0.035294443
    738.59766,0.03437028,0.004759088,0.035294443
    739.26544,0.03437028,0.004759088,0.035294443
    739.9332,0.03437028,0.004759088,0.035294443
    740.601,0.03437028,0.004759088,0.035294443
    741.2688,0.03437028,0.004759088,0.035294443
    741.9366,0.03437028,0.004759088,0.035294443
    742.6044,0.03437028,0.004759088,0.035294443
    743.2721,0.03437028,0.004759088,0.035294443
    743.9399,0.03437028,0.004759088,0.035294443
    744.60767,0.03437028,0.004759088,0.035294443
    745.27545,0.03437028,0.004759088,0.035294443
    745.94324,0.03437028,0.004759088,0.035294443
    746.611,0.03437028,0.004759088,0.035294443
    747.2788,0.03437028,0.004759088,0.035294443
    747.9466,0.03437028,0.004759088,0.035294443
    748.6144,0.03437028,0.004759088,0.035294443
    749.28217,0.03437028,0.004759088,0.035294443
    749.9499,0.03437028,0.004759088,0.035294443
    750.6177,0.03437028,0.004759088,0.035294443
    751.28546,0.03437028,0.004759088,0.035294443
    751.95325,0.03437028,0.004759088,0.035294443
    752.62103,0.03437028,0.004759088,0.035294443
    753.2888,0.03437028,0.004759088,0.035294443
    753.9566,0.03437028,0.004759088,0.035294443
    754.6244,0.03437028,0.004759088,0.035294443
    755.2922,0.03437028,0.004759088,0.035294443
    755.95996,0.03437028,0.004759088,0.035294443
    756.6277,0.03437028,0.004759088,0.035294443
    757.2955,0.03437028,0.004759088,0.035294443
    757.96326,0.03437028,0.004759088,0.035294443
    758.63104,0.03437028,0.004759088,0.035294443
    759.2988,0.03437028,0.004759088,0.035294443
    759.9666,0.03437028,0.004759088,0.035294443
    760.6344,0.03437028,0.004759088,0.035294443
    761.3022,0.03437028,0.004759088,0.035294443
    761.97,0.03437028,0.004759088,0.035294443
    762.63776,0.03437028,0.004759088,0.035294443
    763.3055,0.03437028,0.004759088,0.035294443
    763.97327,0.03437028,0.004759088,0.035294443
    764.64105,0.03437028,0.004759088,0.035294443
    765.30884,0.03437028,0.004759088,0.035294443
    765.9766,0.03437028,0.004759088,0.035294443
    766.6444,0.03437028,0.004759088,0.035294443
    767.3122,0.03437028,0.004759088,0.035294443
    767.98,0.03437028,0.004759088,0.035294443
    768.64777,0.03437028,0.004759088,0.035294443
    769.31555,0.03437028,0.004759088,0.035294443
    769.9833,0.03437028,0.004759088,0.035294443
    770.65106,0.03437028,0.004759088,0.035294443
    771.31885,0.03437028,0.004759088,0.035294443
    771.98663,0.03437028,0.004759088,0.035294443
    772.6544,0.03437028,0.004759088,0.035294443
    773.3222,0.03437028,0.004759088,0.035294443
    773.99,0.03437028,0.004759088,0.035294443
    774.6578,0.03437028,0.004759088,0.035294443
    775.32556,0.03437028,0.004759088,0.035294443
    775.99335,0.03437028,0.004759088,0.035294443
    776.6611,0.03437028,0.004759088,0.035294443
    777.32886,0.03437028,0.004759088,0.035294443
    777.99664,0.03437028,0.004759088,0.035294443
    778.6644,0.03437028,0.004759088,0.035294443
    779.3322,0.03437028,0.004759088,0.035294443
    780.0,0.03437028,0.004759088,0.035294443];

    fullLambda = data(:, 1);
    R = data(:, 2);
    G = data(:, 3);
    B = data(:, 4);

end
