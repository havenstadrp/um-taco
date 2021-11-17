UM = {}

UM.TacoMoneyMin = 300
UM.TacoMoneyMax = 500
UM.TacoTip = 25 -- not always 

UM.TacoMarker = {
    ["tacobread"] = vec3(15.71111, -1598.30, 29.377),
    ["tacomeat"]  = vec3(14.38271, -1597.32, 29.377),
    ["tacosalad"] = vec3(13.18363, -1596.59, 29.377),
    ["taco"]      = vec3(13.54629, -1599.84, 29.376),
    ["packedtaco"]= vec3(8.578270, -1603.40, 29.373),
    ["selltaco"]  = vec3(10.97071, -1605.91, 29.393),
}

UM.Locations = {
    vec4(-212.88, -1618.16, 34.87, 183.45),
    vec4(-223.15, -1617.6, 34.87, 90.52),
    vec4(-223.15, -1601.2, 34.88, 89.98),
    vec4(-223.06, -1585.81, 34.87, 96.12),
    vec4(-219.32, -1579.92, 34.87, 56.45),
    vec4(-215.66, -1576.28, 34.87, 328.55),
    vec4(-208.74, -1600.64, 34.87, 262.82),
    vec4(-210.01, -1607.03, 34.87, 258.99),
    vec4(-205.7, -1585.59, 38.05, 261.13),
    vec4(-215.73, -1576.32, 38.05, 318.59),
    vec4(-219.29, -1579.92, 38.05, 57.37),
    vec4(-223.09, -1585.89, 38.05, 84.95),
    vec4(-223.07, -1601.14, 38.05, 91.67),
    vec4(-223.08, -1617.59, 38.06, 100.36),
    vec4(-212.1, -1617.63, 38.05, 253.22),
    vec4(-209.96, -1607.11, 38.05, 262.46),
    vec4(-208.63, -1600.57, 38.05, 264.01),
    vec4(-160.08, -1636.25, 34.03, 319.31),
    vec4(-161.1, -1638.77, 34.03, 139.27),
    vec4(-161.66, -1638.4, 37.25, 142.38),
    vec4(159.96, -1636.3, 37.25, 326.86),
    vec4(-150.35, -1625.66, 33.66, 235.2),
    vec4(-151.32, -1622.34, 33.65, 56.46),
    vec4(-144.95, -1618.58, 36.05, 230.86),
    vec4(-152.42, -1623.58, 36.85, 51.96),
    vec4(-150.36, -1625.62, 36.85, 236.43),
    vec4(69.0, -1570.04, 29.6, 230.32),
    vec4(20.43, -1505.37, 31.85, 54.24),
    vec4(-1098.15, -345.84, 37.8, 355.64),
    vec4(-1102.43, -367.91, 37.78, 211.79),
    vec4(-1112.61, -355.77, 37.8, 86.28),
    vec4(-1077.63, -354.84, 37.8, 204.43),
    vec4(-930.84, -214.46, 38.55, 265.65),
    vec4(-783.65, -390.64, 37.33, 334.83),
    vec4(-733.45, -317.38, 36.55, 343.73),
    vec4(-1200.24, -156.96, 40.09, 193.64),
    vec4(-1440.64, -174.37, 47.7, 93.43),
    vec4(-336.23, 30.89, 47.86, 258.93),
    vec4(-338.85, 21.43, 47.86, 258.64),
    vec4(-345.18, 17.91, 47.86, 168.13),
    vec4(-360.45, 20.89, 47.86, 174.26),
    vec4(-371.42, 23.1, 47.86, 178.76),
    vec4(-362.25, 57.76, 54.43, 2.21),
    vec4(-350.59, 57.74, 54.43, 359.38),
    vec4(-344.57, 57.55, 54.43, 354.84),
    vec4(-333.07, 57.1, 54.43, 354.49),
    vec4(-483.53, -18.08, 45.09, 176.3),
    vec4(-492.97, -17.99, 45.06, 177.8),
    vec4(-500.47, -19.27, 45.13, 218.85),
    vec4(-569.88, 169.57, 66.57, 85.5),
    vec4(-476.72, 217.54, 83.7, 177.98),
    vec4(-310.15, 221.54, 87.93, 194.03),
    vec4(-169.9, 285.42, 93.76, 355.38),
    vec4(57.58, 449.66, 147.03, 151.65),
    vec4(318.84, 561.05, 155.0, 199.5),
    vec4(228.73, 765.8, 204.97, 238.66),
    vec4(-429.48, 1109.5, 327.68, 165.38),
    vec4(1179.77, -394.61, 68.0, 73.78),
    vec4(1114.32, -391.27, 68.95, 243.22),
    vec4(1028.76, -408.28, 66.34, 40.17),
    vec4(945.84, -519.02, 60.63, 121.84),
    vec4(964.3, -596.2, 59.9, 253.62),
    vec4(996.89, -729.58, 57.82, 128.54),
    vec4(1207.47, -620.29, 66.44, 268.16),
    vec4(1341.31, -597.31, 74.7, 48.81),
    vec4(1389.03, -569.57, 74.5, 293.76),
    vec4(1303.21, -527.36, 71.46, 340.6),
    vec4(213.08, -592.83, 43.87, 342.72),
    vec4(269.81, -640.79, 42.02, 245.95),
    vec4(-192.43, -652.64, 40.68, 71.02),
    vec4(-759.92, -709.14, 30.06, 94.47),
    vec4(-741.55, -982.29, 17.44, 203.21),
    vec4(-884.2, -1072.55, 2.53, 212.04),
    vec4(-978.07, -1108.35, 2.15, 214.74),
    vec4(-985.86, -1121.67, 4.55, 302.03),
    vec4(-991.71, -1103.4, 2.15, 31.96),
    vec4(-1113.9, -1193.92, 2.38, 215.16),
    vec4(-1207.17, -1264.31, 7.08, 150.31),
    vec4(-1150.83, -1519.37, 4.36, 308.62),
    vec4(-935.52, -1523.16, 5.24, 287.73),
    vec4(347.01, 2618.08, 44.67, 213.95),

}