Config = {}

Config.Language = "cs"

Config.ChargePricePerPercent = 4

Config.ChargeTimePerPercent = 350

Config.GlobalProp = "Coil_Supercharger"

Config.FuelSystem = "ox_fuel"

Config.Notifications = "ox_lib" -- "esx", "qb", "ps-ui", "ox_lib"
Config.ProgressBar = "ox_lib" -- "esx", "qb", "ox_lib"
Config.Interaction = "ox_target" -- "ox_target",  "qb_target",  "textui"
Config.Menu = "ox_lib" -- "esx", "qb", "ps-ui", "ox_lib", "context menu"

Config.AllowedVehicles = {
    "gbbriosof",        -- Custom Vehicle Gabz
    "gbeon",            -- Custom Vehicle Gabz
    "gbtaxieon",        -- Custom Vehicle Gabz
    "gblod4",           -- Custom Vehicle Gabz
    "gbneonct",         -- Custom Vehicle Gabz
    "gbstarlight",      -- Custom Vehicle Gabz
    "gbpolstarlight",   -- Custom Vehicle Gabz
    "gbtaxistarlight",  -- Custom Vehicle Gabz
    "airtug",           -- HVY Airtug
    "caddy",            -- Nagasaki Caddy (Civilian)
    "caddy2",           -- Nagasaki Caddy (Bunker)
    "caddy3",           -- Nagasaki Caddy (Golf)
    "cyclone",          -- Coil Cyclone
    "cyclone2",         -- Coil Cyclone II
    "dilettante",       -- Karin Dilettante
    "dilettante2",      -- Karin Dilettante (Patrol)
    "imorgon",          -- Overflod Imorgon
    "khamelion",        -- Hijak Khamelion
    "neon",             -- Pfister Neon
    "iwagen",           -- Obey I-Wagen
    "omnisegt",         -- Obey Omnis e-GT
    "raiden",           -- Coil Raiden
    "surge",            -- Cheval Surge
    "tezeract",         -- Pegassi Tezeract
    "virtue",           -- Ocelot Virtue
    "voltic",           -- Coil Voltic
    "voltic2",          -- Coil Rocket Voltic
    "powersurge",       -- Western Powersurge
    "envisage",         -- Bollokan Envisage
    "lacourese",        -- Penaud La Coureuse
    "pipistrello"       -- Overflod Pipistrello
}

Config.ChargingStations = {
    { coords = vector4(298.37, -1238.77, 28.29, 90.0), useProp = true },
    { coords = vector4(294.84, -1238.77, 28.27, 90.0), useProp = true },
    { coords = vector4(291.63, -1238.77, 28.26, 90.0), useProp = true },
    { coords = vector4(288.23, -1238.77, 28.25, 90.0), useProp = true },
    { coords = vector4(285.0, -1238.77, 28.23, 90.0), useProp = true },
    { coords = vector4(-45.13, -1096.0, 25.42, 116.24), useProp = true },
    { coords = vector4(-40.65, -1097.52, 25.42, 116.65), useProp = true },
    { coords = vector4(-35.83, -1099.46, 25.42, 118.2), useProp = true },
    { coords = vector4(1720.8652, 6429.8433, 32.1206, 64.2785), useProp = true },
    { coords = vector4(148.2104, 6613.2983, 30.8334, 1.1503), useProp = true },
    { coords = vector4(1724.1558, 6428.1973, 32.6779, 59.8747), useProp = true },
    { coords = vector4(138.5494, 6606.9863, 30.8449, 181.3163), useProp = true },
    { coords = vector4(-94.5605, 6419.834, 30.4895, 314.3099), useProp = true },
    { coords = vector4(-72.0356, 6437.5532, 30.6402, 48.2815), useProp = true },
    { coords = vector4(-2554.6262, 2326.6438, 32.078, 90.4572), useProp = true },
    { coords = vector4(-2555.0801, 2333.7349, 32.078, 90.5663), useProp = true },
    { coords = vector4(-2555.6965, 2341.4963, 32.078, 90.635), useProp = true },
    { coords = vector4(-2087.6833, -317.8097, 12.0228, 354.455), useProp = true },
    { coords = vector4(-2096.1077, -316.8466, 12.0236, 354.455), useProp = true },
    { coords = vector4(-2104.6094, -315.9832, 12.0236, 354.455), useProp = true },
    { coords = vector4(-1439.575, -279.2603, 45.2077, 217.4449), useProp = true },
    { coords = vector4(-1433.2233, -274.1623, 45.2077, 217.4449), useProp = true },
    { coords = vector4(-1793.9844, 809.7203, 137.6916, 44.0908), useProp = true },
    { coords = vector4(-1800.3406, 803.9573, 137.6512, 44.0908), useProp = true },
    { coords = vector4(-1806.6614, 798.0491, 137.6512, 41.0908), useProp = true },
    { coords = vector4(-728.8383, -909.3865, 18.0139, 358.3695), useProp = true },
    { coords = vector4(-529.0386, -1194.1578, 17.4206, 71.711), useProp = true },
    { coords = vector4(-312.0145, -1467.2474, 29.5461, 31.6431), useProp = true },
    { coords = vector4(-319.5397, -1471.4625, 29.5483, 31.3452), useProp = true },
    { coords = vector4(-326.9461, -1475.8003, 29.5485, 31.5531), useProp = true },
    { coords = vector4(-63.1779, -1766.3809, 28.0773, 339.8046), useProp = true },
    { coords = vector4(178.2602, -1564.9836, 28.2802, 314.3199), useProp = true },
    { coords = vector4(172.5527, -1558.9521, 28.2458, 314.6686), useProp = true },
    { coords = vector4(1197.6968, -1379.8518, 34.227, 87.4731), useProp = true },
    { coords = vector4(1201.5386, -1379.6348, 34.227, 87.4731), useProp = true },
    { coords = vector4(1184.6238, -338.5759, 68.1772, 278.506), useProp = true },
    { coords = vector4(1181.3792, -321.5069, 68.1744, 278.3674), useProp = true },
    { coords = vector4(612.1872, 268.9317, 102.0894, 180.3644), useProp = true },
    { coords = vector4(629.2473, 268.7949, 102.0895, 180.348), useProp = true },
    { coords = vector4(2687.7488, 3258.853, 54.2405, 329.0372), useProp = true },
    { coords = vector4(1703.8616, 4936.9546, 41.0782, 324.4799), useProp = true },
    { coords = vector4(1999.0145, 3770.5159, 31.1808, 119.2519), useProp = true },
    { coords = vector4(1768.2651, 3337.7102, 40.4327, 301.4904), useProp = true },
    { coords = vector4(1204.7872, 2663.1443, 36.8099, 40.1939), useProp = true },
    { coords = vector4(1039.2267, 2674.6099, 38.5507, 90.0629), useProp = true },
    { coords = vector4(1039.1633, 2667.9548, 38.5507, 270.8289), useProp = true },
    { coords = vector4(258.9709, 2605.8965, 43.974, 281.8592), useProp = true },
    { coords = vector4(45.6102, 2781.6892, 56.884, 53.1652), useProp = true }
}

Config.Translations = {
    ["cs"] = {
        no_vehicle = "Musíš byť vo vozidle.",
        not_allowed_vehicle = "Toto vozidlo nemožno nabiť.",
        charging_complete = "Vozidlo úspešne nabité!",
        insufficient_funds = "Nemáš dostatok peňazí!",
        charging_vehicle = "Nabíjanie vozidla...",
        choose_payment = "Vyber spôsob platby",
        choose_paymentTextUI = "[E] Vyber spôsob platby",
        pay_cash = "Zaplatit hotovosťou",
        pay_bank = "Zaplatit z banky",
        exit_vehicle_first = "Musíš najprv vystúpiť z vozidla!",
        charging_in_progress = "Vozidlo sa stále nabíja!"
    },
    ["en"] = {
        no_vehicle = "You must be in a vehicle.",
        not_allowed_vehicle = "This vehicle cannot be charged.",
        charging_complete = "Vehicle successfully charged!",
        insufficient_funds = "You don't have enough money!",
        charging_vehicle = "Charging vehicle...",
        choose_payment = "Choose payment method",
        choose_paymentTextUI = "[E] Choose payment method",
        pay_cash = "Pay with cash",
        pay_bank = "Pay from bank",
        exit_vehicle_first = "You must exit the vehicle first!",
        charging_in_progress = "The vehicle is still charging.!"
    }
}