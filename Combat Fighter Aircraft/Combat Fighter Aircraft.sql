SELECT * FROM fightjet ;

SELECT
    COUNT(*) AS TotalFighterJets,
    AVG(MaxSpeed) AS AverageMaxSpeed,
    MAX(MaxSpeed) AS MaxSpeed,
    MIN(MaxSpeed) AS MinSpeed,
    MAX(MaxAltitude) AS MaxAltitude,
    MIN(MaxAltitude) AS MinAltitude,
    CountryofOrigin,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    CountryofOrigin
ORDER BY
    TotalFighterJets DESC;
    
    SELECT
    Generation,
    COUNT(*) AS NumberOfJets,
    AVG(MaxSpeed) AS AverageMaxSpeed,
    MAX(MaxSpeed) AS MaxSpeed,
    MIN(MaxSpeed) AS MinSpeed
FROM
    fightjet
GROUP BY
    Generation
ORDER BY
    Generation;

SELECT
    CountryofOrigin,
    NameofJet,
    MaxAltitude
FROM
    fightjet AS f1
WHERE
    MaxAltitude = (SELECT MAX(MaxAltitude) FROM fightjet AS f2 WHERE f2.CountryofOrigin = f1.CountryofOrigin)
ORDER BY
    CountryofOrigin;
    
    SELECT
    RadarType,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    RadarType;
    
    SELECT
    CountryofOrigin,
    AVG(FuelCapacity) AS AverageFuelCapacity,
    MAX(FuelCapacity) AS MaxFuelCapacity
FROM
    fightjet
GROUP BY
    CountryofOrigin
ORDER BY
    CountryofOrigin;
    
SELECT
    EngineType,
    COUNT(*) AS NumberOfJets,
    SUM(Cost) AS TotalCost,
    AVG(Cost) AS AverageCost
FROM
    fightjet
GROUP BY
    EngineType
ORDER BY
    NumberOfJets DESC;
    
SELECT
    NameofJet,
    Wingspan
FROM
    fightjet
ORDER BY
    Wingspan DESC
LIMIT 1;

SELECT
    MIN(Introduced) AS EarliestIntroduction,
    MAX(Introduced) AS LatestIntroduction,
    AVG(Introduced) AS AverageIntroduction,
    COUNT(*) AS NumberOfJets
FROM
    fightjet;

SELECT
    Generation,
    AVG(CombatRange) AS AverageCombatRange,
    MAX(CombatRange) AS MaxCombatRange
FROM
    fightjet
GROUP BY
    Generation
ORDER BY
    Generation;
    
SELECT
    NameofJet,
    BattlesWon
FROM
    fightjet
ORDER BY
    BattlesWon DESC
LIMIT 1;

SELECT
    EjectionSystem,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    EjectionSystem;
    
SELECT
    CountryofOrigin,
    Generation,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    CountryofOrigin, Generation
ORDER BY
    CountryofOrigin, Generation;
    
SELECT
    RadarType,
    AVG(ServiceCeiling) AS AverageServiceCeiling,
    MAX(ServiceCeiling) AS MaxServiceCeiling
FROM
    fightjet
GROUP BY
    RadarType
ORDER BY
    AverageServiceCeiling DESC;
    
SELECT
    NameofJet,
    Weapons,
    LENGTH(Weapons) - LENGTH(REPLACE(Weapons, ',', '')) + 1 AS NumberOfWeapons
FROM
    fightjet
ORDER BY
    NumberOfWeapons DESC
LIMIT 1;

SELECT
    AvionicsSystem,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    AvionicsSystem;
    
SELECT
    NameofJet,
    CombatRange
FROM
    fightjet
ORDER BY
    CombatRange DESC
LIMIT 1;


SELECT
    FuelType,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    FuelType;
    
SELECT
    NameofJet,
    BattlesWon,
    ManufacturerofJet
FROM
    fightjet
ORDER BY
    BattlesWon DESC
LIMIT 1;

SELECT
    StealthTechnology,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    StealthTechnology;
    
SELECT
    NameofJet,
    MaximumGForce
FROM
    fightjet
ORDER BY
    MaximumGForce DESC
LIMIT 1;


SELECT
    CountryofOrigin,
    EngineType,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    CountryofOrigin, EngineType
ORDER BY
    CountryofOrigin, EngineType;
    
SELECT
    CountryofOrigin,
    RadarType,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    CountryofOrigin, RadarType
ORDER BY
    CountryofOrigin, RadarType;
    
SELECT
    Introduced,
    COUNT(*) AS NumberOfJets,
    SUM(Cost) AS TotalCost,
    AVG(Cost) AS AverageCost
FROM
    fightjet
GROUP BY
    Introduced
ORDER BY
    Introduced;
    
SELECT
    CountryofOrigin,
    AvionicsSystem,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    CountryofOrigin, AvionicsSystem
ORDER BY
    CountryofOrigin, AvionicsSystem;
    
SELECT
    Generation,
    EngineType,
    RadarType,
    AVG(MaxSpeed) AS AverageMaxSpeed,
    MAX(MaxSpeed) AS MaxMaxSpeed,
    AVG(MaxAltitude) AS AverageMaxAltitude,
    MAX(MaxAltitude) AS MaxMaxAltitude,
    AVG(Cost) AS AverageCost,
    MAX(Cost) AS MaxCost,
    COUNT(*) AS NumberOfJets
FROM
    fightjet
GROUP BY
    Generation, EngineType, RadarType
ORDER BY
    Generation, EngineType, RadarType;
    
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    EngineType,
    RadarType,
    MaxSpeed,
    MaxAltitude,
    Cost,
    (MaxSpeed + MaxAltitude - Cost) AS PerformanceScore
FROM
    fightjet
ORDER BY
    PerformanceScore DESC
LIMIT 1;


SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    EngineType,
    RadarType,
    MaxSpeed,
    MaxAltitude,
    Weapons,
    (MaxSpeed + MaxAltitude + (LENGTH(Weapons) - LENGTH(REPLACE(Weapons, ',', '')) + 1) * 100) AS OverallPerformanceScore
FROM
    fightjet
ORDER BY
    OverallPerformanceScore DESC
LIMIT 1;


WITH FighterJetScores AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        EngineType,
        RadarType,
        MaxSpeed,
        MaxAltitude,
        Cost,
        (MaxSpeed + MaxAltitude - Cost) AS PerformanceScore
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    EngineType,
    RadarType,
    MaxSpeed,
    MaxAltitude,
    Cost,
    PerformanceScore,
    RANK() OVER (ORDER BY PerformanceScore DESC) AS PerformanceRank
FROM
    FighterJetScores
ORDER BY
    PerformanceScore DESC;
    
    
WITH RankedJets AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        EngineType,
        RadarType,
        MaxSpeed,
        MaxAltitude,
        Weapons,
        ROW_NUMBER() OVER (ORDER BY (MaxSpeed + MaxAltitude) DESC) AS SpeedAltitudeRank,
        ROW_NUMBER() OVER (ORDER BY (LENGTH(Weapons) - LENGTH(REPLACE(Weapons, ',', '')) + 1) DESC) AS WeaponsRank
    FROM
        fightjet
)
SELECT
    rj.NameofJet,
    rj.CountryofOrigin,
    rj.Generation,
    rj.EngineType,
    rj.RadarType,
    rj.MaxSpeed,
    rj.MaxAltitude,
    rj.Weapons,
    ((rj.SpeedAltitudeRank * 0.7) + (rj.WeaponsRank * 0.3)) AS WeightedPerformanceScore
FROM
    RankedJets rj
ORDER BY
    WeightedPerformanceScore DESC;



WITH FighterJetAttributes AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        EngineType,
        RadarType,
        MaxSpeed,
        MaxAltitude,
        LENGTH(Weapons) - LENGTH(REPLACE(Weapons, ',', '')) + 1 AS NumberOfWeapons
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    EngineType,
    RadarType,
    MaxSpeed,
    MaxAltitude,
    NumberOfWeapons,
    RANK() OVER (ORDER BY MaxSpeed DESC, MaxAltitude DESC, NumberOfWeapons DESC) AS CombatRank
FROM
    FighterJetAttributes
ORDER BY
    CombatRank;
    
WITH EngineTypeAnalysis AS (
    SELECT
        EngineType,
        AVG(Cost) AS AverageCost,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        EngineType
)
SELECT
    EngineType,
    AverageCost,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageCost DESC) AS CostRank
FROM
    EngineTypeAnalysis
ORDER BY
    CostRank;


WITH RadarTypeAnalysis AS (
    SELECT
        RadarType,
        AVG(LENGTH(Weapons) - LENGTH(REPLACE(Weapons, ',', '')) + 1) AS AverageWeapons,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        RadarType
)
SELECT
    RadarType,
    AverageWeapons,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageWeapons DESC) AS WeaponsRank
FROM
    RadarTypeAnalysis
ORDER BY
    WeaponsRank;
    

WITH CountryAnalysis AS (
    SELECT
        CountryofOrigin,
        AVG(MaxSpeed) AS AverageMaxSpeed,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        CountryofOrigin
)
SELECT
    CountryofOrigin,
    AverageMaxSpeed,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageMaxSpeed DESC) AS SpeedRank
FROM
    CountryAnalysis
ORDER BY
    SpeedRank;
    
    
WITH GenerationAnalysis AS (
    SELECT
        Generation,
        AVG(MaxAltitude) AS AverageMaxAltitude,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        Generation
)
SELECT
    Generation,
    AverageMaxAltitude,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageMaxAltitude DESC) AS AltitudeRank
FROM
    GenerationAnalysis
ORDER BY
    AltitudeRank;


WITH FuelTypeAnalysis AS (
    SELECT
        FuelType,
        AVG(FuelCapacity) AS AverageFuelCapacity,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        FuelType
)
SELECT
    FuelType,
    AverageFuelCapacity,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageFuelCapacity DESC) AS FuelCapacityRank
FROM
    FuelTypeAnalysis
ORDER BY
    FuelCapacityRank;
    

WITH BattlesWonAnalysis AS (
    SELECT
        Introduced,
        AVG(BattlesWon) AS AverageBattlesWon,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        Introduced
)
SELECT
    Introduced,
    AverageBattlesWon,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageBattlesWon DESC) AS BattlesWonRank
FROM
    BattlesWonAnalysis
ORDER BY
    BattlesWonRank;
    
    
WITH StealthTechnologyAnalysis AS (
    SELECT
        StealthTechnology,
        AVG(MaxAltitude) AS AverageMaxAltitude,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        StealthTechnology
)
SELECT
    StealthTechnology,
    AverageMaxAltitude,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageMaxAltitude DESC) AS AltitudeRank
FROM
    StealthTechnologyAnalysis
ORDER BY
    AltitudeRank;
    
    
WITH AdvancedAnalysis AS (
    SELECT
        AvionicsSystem,
        RadarType,
        AVG(BattlesWon) AS AverageBattlesWon,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        AvionicsSystem,
        RadarType
)
SELECT
    AvionicsSystem,
    RadarType,
    AverageBattlesWon,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageBattlesWon DESC) AS BattlesWonRank
FROM
    AdvancedAnalysis
ORDER BY
    BattlesWonRank;
    
    
WITH AdvancedAnalysis AS (
    SELECT
        Introduced,
        AVG(MaxAltitude) AS AverageMaxAltitude,
        AVG(CASE WHEN StealthTechnology = 'Yes' THEN 1 ELSE 0 END) AS StealthTechnologyPercentage,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        Introduced
)
SELECT
    Introduced,
    AverageMaxAltitude,
    StealthTechnologyPercentage,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageMaxAltitude DESC) AS AltitudeRank
FROM
    AdvancedAnalysis
ORDER BY
    AltitudeRank;
    

WITH AdvancedAnalysis AS (
    SELECT
        AvionicsSystem,
        Generation,
        AVG(BattlesWon) AS AverageBattlesWon,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        AvionicsSystem,
        Generation
)
SELECT
    AvionicsSystem,
    Generation,
    AverageBattlesWon,
    NumberOfJets,
    RANK() OVER (PARTITION BY Generation ORDER BY AverageBattlesWon DESC) AS BattlesWonRank
FROM
    AdvancedAnalysis
ORDER BY
    Generation,
    BattlesWonRank;
    
    
WITH EngineRadarAnalysis AS (
    SELECT
        EngineType,
        RadarType,
        AVG(Cost) AS AverageCost,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        EngineType,
        RadarType
)
SELECT
    EngineType,
    RadarType,
    AverageCost,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageCost DESC) AS CostRank
FROM
    EngineRadarAnalysis
ORDER BY
    CostRank;
    
    
WITH FighterPerformanceAnalysis AS (
    SELECT
        CountryofOrigin,
        Generation,
        RadarType,
        AVG(MaxAltitude) AS AverageMaxAltitude,
        AVG(MaxSpeed) AS AverageMaxSpeed,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        CountryofOrigin,
        Generation,
        RadarType
)
SELECT
    CountryofOrigin,
    Generation,
    RadarType,
    AverageMaxAltitude,
    AverageMaxSpeed,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageMaxAltitude DESC, AverageMaxSpeed DESC) AS PerformanceRank
FROM
    FighterPerformanceAnalysis
ORDER BY
    PerformanceRank;
    
    
WITH FighterCompositeScore AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        EngineType,
        RadarType,
        AvionicsSystem,
        StealthTechnology,
        MaxSpeed,
        MaxAltitude,
        AVG(BattlesWon) AS AverageBattlesWon,
        RANK() OVER (ORDER BY MaxSpeed DESC, MaxAltitude DESC, AVG(BattlesWon) DESC) AS PerformanceRank
    FROM
        fightjet
    GROUP BY
        NameofJet,
        CountryofOrigin,
        Generation,
        EngineType,
        RadarType,
        AvionicsSystem,
        StealthTechnology,
        MaxSpeed,
        MaxAltitude
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    EngineType,
    RadarType,
    AvionicsSystem,
    StealthTechnology,
    MaxSpeed,
    MaxAltitude,
    AverageBattlesWon,
    PerformanceRank
FROM
    FighterCompositeScore
ORDER BY
    PerformanceRank;
    
    
    
WITH FighterWeightedPerformance AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        EngineType,
        RadarType,
        AvionicsSystem,
        MaxSpeed,
        MaxAltitude,
        LENGTH(Weapons) - LENGTH(REPLACE(Weapons, ',', '')) + 1 AS NumberOfWeapons,
        RANK() OVER (ORDER BY MaxSpeed DESC, MaxAltitude DESC, LENGTH(Weapons) DESC) AS PerformanceRank
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    EngineType,
    RadarType,
    AvionicsSystem,
    MaxSpeed,
    MaxAltitude,
    NumberOfWeapons,
    PerformanceRank
FROM
    FighterWeightedPerformance
ORDER BY
    PerformanceRank;
    
    
    
WITH FighterGenerationRadarAnalysis AS (
    SELECT
        Generation,
        RadarType,
        AVG(MaxSpeed) AS AverageMaxSpeed,
        AVG(MaxAltitude) AS AverageMaxAltitude,
        AVG(BattlesWon) AS AverageBattlesWon,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        Generation,
        RadarType
)
SELECT
    Generation,
    RadarType,
    AverageMaxSpeed,
    AverageMaxAltitude,
    AverageBattlesWon,
    NumberOfJets,
    RANK() OVER (PARTITION BY Generation ORDER BY AverageBattlesWon DESC) AS BattlesWonRank
FROM
    FighterGenerationRadarAnalysis
ORDER BY
    Generation,
    BattlesWonRank;
    
    
    WITH FighterCountryAvionicsAnalysis AS (
    SELECT
        CountryofOrigin,
        AvionicsSystem,
        AVG(Cost) AS AverageCost,
        AVG(MaxSpeed) AS AverageMaxSpeed,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        CountryofOrigin,
        AvionicsSystem
)
SELECT
    CountryofOrigin,
    AvionicsSystem,
    AverageCost,
    AverageMaxSpeed,
    NumberOfJets,
    RANK() OVER (PARTITION BY CountryofOrigin ORDER BY AverageMaxSpeed DESC) AS SpeedRank
FROM
    FighterCountryAvionicsAnalysis
ORDER BY
    CountryofOrigin,
    SpeedRank;
    
    
WITH FighterEngineRadarAnalysis AS (
    SELECT
        EngineType,
        RadarType,
        AVG(MaxSpeed) AS AverageMaxSpeed,
        AVG(MaxAltitude) AS AverageMaxAltitude,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        EngineType,
        RadarType
)
SELECT
    EngineType,
    RadarType,
    AverageMaxSpeed,
    AverageMaxAltitude,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageMaxSpeed DESC) AS SpeedRank
FROM
    FighterEngineRadarAnalysis
ORDER BY
    SpeedRank;
    
    
WITH AdvancedFighterAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        EngineType,
        RadarType,
        AvionicsSystem,
        StealthTechnology,
        MaxSpeed,
        MaxAltitude,
        AVG(BattlesWon) AS AverageBattlesWon,
        RANK() OVER (ORDER BY MaxSpeed DESC, MaxAltitude DESC, AVG(BattlesWon) DESC) AS PerformanceRank
    FROM
        fightjet
    GROUP BY
        NameofJet,
        CountryofOrigin,
        Generation,
        EngineType,
        RadarType,
        AvionicsSystem,
        StealthTechnology,
        MaxSpeed,
        MaxAltitude
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    EngineType,
    RadarType,
    AvionicsSystem,
    StealthTechnology,
    MaxSpeed,
    MaxAltitude,
    AverageBattlesWon,
    PerformanceRank
FROM
    AdvancedFighterAnalysis
ORDER BY
    PerformanceRank;



WITH FighterFuelAvionicsAnalysis AS (
    SELECT
        FuelType,
        AvionicsSystem,
        AVG(Cost) AS AverageCost,
        AVG(MaxAltitude) AS AverageMaxAltitude,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        FuelType,
        AvionicsSystem
)
SELECT
    FuelType,
    AvionicsSystem,
    AverageCost,
    AverageMaxAltitude,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageCost DESC, AverageMaxAltitude DESC) AS CostRank
FROM
    FighterFuelAvionicsAnalysis
ORDER BY
    CostRank;



WITH FighterEngineAvionicsRadarAnalysis AS (
    SELECT
        EngineType,
        AvionicsSystem,
        RadarType,
        AVG(Cost) AS AverageCost,
        AVG(MaxAltitude) AS AverageMaxAltitude,
        AVG(BattlesWon) AS AverageBattlesWon,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        EngineType,
        AvionicsSystem,
        RadarType
)
SELECT
    EngineType,
    AvionicsSystem,
    RadarType,
    AverageCost,
    AverageMaxAltitude,
    AverageBattlesWon,
    NumberOfJets,
    RANK() OVER (ORDER BY AverageBattlesWon DESC) AS BattlesWonRank
FROM
    FighterEngineAvionicsRadarAnalysis
ORDER BY
    BattlesWonRank;


WITH FighterEngineRadarAnalysis AS (
    SELECT
        EngineType,
        RadarType,
        AVG(Cost) AS AvgCost,
        MIN(Cost) AS MinCost,
        MAX(Cost) AS MaxCost,
        AVG(MaxSpeed) AS AvgMaxSpeed,
        MIN(MaxSpeed) AS MinMaxSpeed,
        MAX(MaxSpeed) AS MaxMaxSpeed,
        AVG(MaxAltitude) AS AvgMaxAltitude,
        MIN(MaxAltitude) AS MinMaxAltitude,
        MAX(MaxAltitude) AS MaxMaxAltitude,
        COUNT(*) AS NumberOfJets
    FROM
        fightjet
    GROUP BY
        EngineType,
        RadarType
)
SELECT
    EngineType,
    RadarType,
    AvgCost,
    MinCost,
    MaxCost,
    AvgMaxSpeed,
    MinMaxSpeed,
    MaxMaxSpeed,
    AvgMaxAltitude,
    MinMaxAltitude,
    MaxMaxAltitude,
    NumberOfJets,
    CASE
        WHEN AvgCost >= 120 AND AvgMaxAltitude >= 60000 THEN 'High-End Performance'
        WHEN AvgCost >= 80 AND AvgMaxAltitude >= 50000 THEN 'Standard Performance'
        ELSE 'Basic Performance'
    END AS PerformanceLevel
FROM
    FighterEngineRadarAnalysis
ORDER BY
    AvgCost DESC,
    AvgMaxAltitude DESC;



WITH MaxBattlesWonPerCountry AS (
    SELECT
        CountryofOrigin,
        MAX(BattlesWon) AS MaxBattlesWon
    FROM
        fightjet
    GROUP BY
        CountryofOrigin
)

SELECT
    fj.NameofJet,
    fj.CountryofOrigin,
    AVG(fj.Cost) AS AverageCost,
    MAX(fj.MaxSpeed) AS MaxSpeed,
    MAX(fj.MaxAltitude) AS MaxAltitude,
    fj.BattlesWon
FROM
    fightjet fj
JOIN
    MaxBattlesWonPerCountry maxbw ON fj.CountryofOrigin = maxbw.CountryofOrigin AND fj.BattlesWon = maxbw.MaxBattlesWon
GROUP BY
    fj.NameofJet,
    fj.CountryofOrigin,
    fj.BattlesWon
ORDER BY
    CountryofOrigin, BattlesWon DESC;



WITH RankBattlesWonPerCountry AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        BattlesWon,
        RANK() OVER (PARTITION BY CountryofOrigin ORDER BY BattlesWon DESC) AS BattlesWonRank
    FROM
        fightjet
),
Top3FighterJetsPerCountry AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        BattlesWon
    FROM
        RankBattlesWonPerCountry
    WHERE
        BattlesWonRank <= 3
)

SELECT
    CountryofOrigin,
    COUNT(NameofJet) AS NumberOfFighterJets,
    MAX(BattlesWon) AS MaxBattlesWon,
    AVG(BattlesWon) AS AvgBattlesWon,
    MIN(BattlesWon) AS MinBattlesWon
FROM
    Top3FighterJetsPerCountry
GROUP BY
    CountryofOrigin
ORDER BY
    MaxBattlesWon DESC, CountryofOrigin;
    
    

WITH WeightedScorePerJet AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        BattlesWon,
        Cost,
        MaxSpeed,
        MaxAltitude,
        BattlesWon * 0.3 + Cost * 0.2 + MaxSpeed * 0.2 + MaxAltitude * 0.3 AS WeightedScore,
        RANK() OVER (PARTITION BY CountryofOrigin ORDER BY (BattlesWon * 0.3 + Cost * 0.2 + MaxSpeed * 0.2 + MaxAltitude * 0.3) DESC) AS RankWithinCountry
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    BattlesWon,
    Cost,
    MaxSpeed,
    MaxAltitude,
    WeightedScore,
    RankWithinCountry
FROM
    WeightedScorePerJet
ORDER BY
    CountryofOrigin, RankWithinCountry;




WITH EfficiencyRatioPerJet AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        BattlesWon,
        Cost,
        MAX(BattlesWon) OVER (PARTITION BY CountryofOrigin) AS MaxBattlesWonInCountry,
        MAX(Cost) OVER (PARTITION BY CountryofOrigin) AS MaxCostInCountry,
        BattlesWon / NULLIF(Cost, 0) AS EfficiencyRatio,
        RANK() OVER (PARTITION BY CountryofOrigin ORDER BY (BattlesWon / NULLIF(Cost, 0)) DESC) AS RankWithinCountry
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    BattlesWon,
    Cost,
    EfficiencyRatio,
    RankWithinCountry
FROM
    EfficiencyRatioPerJet
WHERE
    Cost > 0 -- Exclude jets with zero cost for a more meaningful efficiency ratio
ORDER BY
    CountryofOrigin, RankWithinCountry;



WITH BattlesWonTrendPerJet AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        BattlesWon,
        LAG(BattlesWon) OVER (PARTITION BY CountryofOrigin, NameofJet ORDER BY Generation) AS PreviousGenerationBattlesWon,
        CASE
            WHEN BattlesWon > LAG(BattlesWon) OVER (PARTITION BY CountryofOrigin, NameofJet ORDER BY Generation) THEN 'Increase'
            WHEN BattlesWon < LAG(BattlesWon) OVER (PARTITION BY CountryofOrigin, NameofJet ORDER BY Generation) THEN 'Decrease'
            ELSE 'No Change'
        END AS BattlesWonTrend
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    BattlesWon,
    PreviousGenerationBattlesWon,
    BattlesWonTrend
FROM
    BattlesWonTrendPerJet
ORDER BY
    CountryofOrigin, NameofJet, Generation;
    
    
    
WITH TimeSeriesAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        Introduced,
        BattlesWon,
        Cost,
        MaxAltitude,
        LAG(BattlesWon) OVER (PARTITION BY CountryofOrigin, Generation ORDER BY Introduced) AS PreviousYearBattlesWon,
        LAG(Cost) OVER (PARTITION BY CountryofOrigin, Generation ORDER BY Introduced) AS PreviousYearCost,
        LAG(MaxAltitude) OVER (PARTITION BY CountryofOrigin, Generation ORDER BY Introduced) AS PreviousYearMaxAltitude
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    Introduced,
    BattlesWon,
    Cost,
    MaxAltitude,
    PreviousYearBattlesWon,
    PreviousYearCost,
    PreviousYearMaxAltitude
FROM
    TimeSeriesAnalysis
ORDER BY
    CountryofOrigin, Generation, Introduced;
    
    
    
WITH TimeSeriesForecasting AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        Introduced,
        BattlesWon,
        AVG(BattlesWon) OVER (PARTITION BY NameofJet ORDER BY Introduced ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS MovingAvgBattlesWon
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    Introduced,
    BattlesWon,
    MovingAvgBattlesWon AS PredictedBattlesWon
FROM
    TimeSeriesForecasting
ORDER BY
    CountryofOrigin, Generation, Introduced;
    
    

WITH PercentileRankAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        BattlesWon,
        Cost,
        MaxAltitude,
        PERCENT_RANK() OVER (PARTITION BY Generation ORDER BY BattlesWon) AS BattlesWonPercentileRank,
        PERCENT_RANK() OVER (PARTITION BY Generation ORDER BY Cost) AS CostPercentileRank,
        PERCENT_RANK() OVER (PARTITION BY Generation ORDER BY MaxAltitude) AS MaxAltitudePercentileRank
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    BattlesWon,
    BattlesWonPercentileRank,
    Cost,
    CostPercentileRank,
    MaxAltitude,
    MaxAltitudePercentileRank
FROM
    PercentileRankAnalysis
ORDER BY
    CountryofOrigin, Generation, NameofJet;
    
    
    
WITH MarketShareAnalysis AS (
    SELECT
        CountryofOrigin,
        SUM(BattlesWon) AS TotalBattlesWon,
        RANK() OVER (ORDER BY SUM(BattlesWon) DESC) AS RankByBattlesWon
    FROM
        fightjet
    GROUP BY
        CountryofOrigin
)
SELECT
    CountryofOrigin,
    TotalBattlesWon,
    CAST(TotalBattlesWon * 100.0 / SUM(TotalBattlesWon) OVER () AS DECIMAL(10, 2)) AS MarketSharePercentage,
    RankByBattlesWon
FROM
    MarketShareAnalysis
ORDER BY
    RankByBattlesWon;




WITH SensitivityAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        BattlesWon,
        Cost,
        MaxAltitude,
        BattlesWon * 0.4 + Cost * 0.3 + MaxAltitude * 0.3 AS PerformanceScore
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    BattlesWon,
    Cost,
    MaxAltitude,
    PerformanceScore
FROM
    SensitivityAnalysis
ORDER BY
    CountryofOrigin, Generation, PerformanceScore DESC;
    
    
    
WITH SentimentAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        CASE
            WHEN LOWER(NameofJet) LIKE '%thunder%' OR LOWER(NameofJet) LIKE '%storm%' THEN 'Positive'
            WHEN LOWER(NameofJet) LIKE '%shadow%' OR LOWER(NameofJet) LIKE '%ghost%' THEN 'Neutral'
            ELSE 'Negative'
        END AS Sentiment
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    Sentiment
FROM
    SentimentAnalysis
ORDER BY
    CountryofOrigin, Generation, NameofJet;




WITH NetworkAnalysis AS (
    SELECT
        CountryofOrigin AS SourceCountry,
        ManufacturerofJet AS Connection,
        COUNT(*) AS ConnectionCount
    FROM
        fightjet
    GROUP BY
        CountryofOrigin, ManufacturerofJet
)
SELECT
    SourceCountry,
    Connection,
    ConnectionCount
FROM
    NetworkAnalysis
ORDER BY
    SourceCountry, ConnectionCount DESC;
    
    
    
WITH TrendAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        Introduced,
        MaxAltitude,
        Cost,
        LAG(MaxAltitude) OVER (PARTITION BY NameofJet ORDER BY Introduced) AS PreviousMaxAltitude,
        LAG(Cost) OVER (PARTITION BY NameofJet ORDER BY Introduced) AS PreviousCost
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    Introduced,
    MaxAltitude,
    CASE
        WHEN PreviousMaxAltitude IS NULL THEN 'N/A'
        WHEN MaxAltitude > PreviousMaxAltitude THEN 'Increased'
        WHEN MaxAltitude < PreviousMaxAltitude THEN 'Decreased'
        ELSE 'No Change'
    END AS AltitudeChange,
    Cost,
    CASE
        WHEN PreviousCost IS NULL THEN 'N/A'
        WHEN Cost > PreviousCost THEN 'Increased'
        WHEN Cost < PreviousCost THEN 'Decreased'
        ELSE 'No Change'
    END AS CostChange
FROM
    TrendAnalysis
ORDER BY
    CountryofOrigin, Generation, Introduced;



WITH TimeSeriesAnalysis AS (
    SELECT
        NameofJet,
        Introduced,
        BattlesWon,
        Cost,
        MaxAltitude,
        LAG(BattlesWon) OVER (PARTITION BY NameofJet ORDER BY Introduced) AS PreviousBattlesWon,
        LAG(Cost) OVER (PARTITION BY NameofJet ORDER BY Introduced) AS PreviousCost,
        LAG(MaxAltitude) OVER (PARTITION BY NameofJet ORDER BY Introduced) AS PreviousMaxAltitude
    FROM
        fightjet
    WHERE
        NameofJet = 'F-22 Raptor'
)
SELECT
    NameofJet,
    Introduced,
    BattlesWon,
    CASE
        WHEN PreviousBattlesWon IS NULL THEN 'N/A'
        WHEN BattlesWon > PreviousBattlesWon THEN 'Increased'
        WHEN BattlesWon < PreviousBattlesWon THEN 'Decreased'
        ELSE 'No Change'
    END AS BattlesWonChange,
    Cost,
    CASE
        WHEN PreviousCost IS NULL THEN 'N/A'
        WHEN Cost > PreviousCost THEN 'Increased'
        WHEN Cost < PreviousCost THEN 'Decreased'
        ELSE 'No Change'
    END AS CostChange,
    MaxAltitude,
    CASE
        WHEN PreviousMaxAltitude IS NULL THEN 'N/A'
        WHEN MaxAltitude > PreviousMaxAltitude THEN 'Increased'
        WHEN MaxAltitude < PreviousMaxAltitude THEN 'Decreased'
        ELSE 'No Change'
    END AS MaxAltitudeChange
FROM
    TimeSeriesAnalysis
ORDER BY
    Introduced;



WITH MarketShareAnalysis AS (
    SELECT
        ManufacturerofJet,
        COUNT(*) AS TotalJets,
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER () AS MarketSharePercentage
    FROM
        fightjet
    GROUP BY
        ManufacturerofJet
)
SELECT
    ManufacturerofJet,
    TotalJets,
    MarketSharePercentage
FROM
    MarketShareAnalysis
ORDER BY
    TotalJets DESC, ManufacturerofJet;



WITH RadarTechnologyAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        Introduced,
        RadarType,
        LEAD(RadarType) OVER (PARTITION BY NameofJet ORDER BY Introduced) AS NextRadarType
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    Introduced,
    RadarType,
    NextRadarType AS NextGenerationRadar,
    CASE
        WHEN RadarType = NextRadarType THEN 'No Change'
        WHEN NextRadarType IS NULL THEN 'Latest Technology'
        ELSE 'Technology Upgrade'
    END AS RadarTechnologyChange
FROM
    RadarTechnologyAnalysis
ORDER BY
    Introduced;



WITH EfficiencyAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        BattlesWon,
        Cost,
        BattlesWon / Cost AS EfficiencyRatio,
        RANK() OVER (PARTITION BY Generation ORDER BY BattlesWon / Cost DESC) AS EfficiencyRank
    FROM
        fightjet
    WHERE
        Cost > 0 -- To avoid division by zero
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    BattlesWon,
    Cost,
    EfficiencyRatio,
    EfficiencyRank
FROM
    EfficiencyAnalysis
ORDER BY
    Generation, EfficiencyRank;
    
    
WITH DiplomaticAnalysis AS (
    SELECT
        CountryofOrigin,
        AVG(MaxSpeed) AS AvgMaxSpeed,
        AVG(MaxAltitude) AS AvgMaxAltitude,
        AVG(Cost) AS AvgCost
    FROM
        fightjet
    GROUP BY
        CountryofOrigin
)
SELECT
    A.CountryofOrigin AS CountryA,
    B.CountryofOrigin AS CountryB,
    ABS(A.AvgMaxSpeed - B.AvgMaxSpeed) AS MaxSpeedDifference,
    ABS(A.AvgMaxAltitude - B.AvgMaxAltitude) AS MaxAltitudeDifference,
    ABS(A.AvgCost - B.AvgCost) AS CostDifference
FROM
    DiplomaticAnalysis A
CROSS JOIN
    DiplomaticAnalysis B
WHERE
    A.CountryofOrigin < B.CountryofOrigin
ORDER BY
    CountryA, CountryB;



WITH CompetitivenessAnalysis AS (
    SELECT
        CountryofOrigin,
        Generation,
        AVG(MaxSpeed) AS AvgMaxSpeed,
        AVG(Cost) AS AvgCost,
        RANK() OVER (PARTITION BY Generation ORDER BY AVG(MaxSpeed) DESC, AVG(Cost) ASC) AS CompetitivenessRank
    FROM
        fightjet
    GROUP BY
        CountryofOrigin, Generation
)
SELECT
    CountryofOrigin,
    Generation,
    AvgMaxSpeed,
    AvgCost,
    CompetitivenessRank
FROM
    CompetitivenessAnalysis
WHERE
    CompetitivenessRank = 1
ORDER BY
    Generation, CompetitivenessRank;



WITH InnovationAnalysis AS (
    SELECT
        Generation,
        MAX(Introduced) AS LatestIntroductionYear
    FROM
        fightjet
    GROUP BY
        Generation
),
LatestFighters AS (
    SELECT
        f.NameofJet,
        f.CountryofOrigin,
        f.Generation,
        f.Introduced,
        f.MaxSpeed,
        f.MaxAltitude,
        f.Cost,
        i.LatestIntroductionYear
    FROM
        fightjet f
    JOIN
        InnovationAnalysis i ON f.Generation = i.Generation AND f.Introduced = i.LatestIntroductionYear
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    Introduced,
    MaxSpeed,
    MaxAltitude,
    Cost
FROM
    LatestFighters
ORDER BY
    Generation;



WITH MaintenanceCostAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        Cost,
        FuelCapacity,
        Cost / NULLIF(FuelCapacity, 0) AS MaintenanceCostPerUnitFuel,
        RANK() OVER (PARTITION BY Generation ORDER BY Cost / NULLIF(FuelCapacity, 0) DESC) AS HighMaintenanceRank,
        RANK() OVER (PARTITION BY Generation ORDER BY Cost / NULLIF(FuelCapacity, 0) ASC) AS LowMaintenanceRank
    FROM
        fightjet
    WHERE
        FuelCapacity > 0
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    Cost,
    FuelCapacity,
    MaintenanceCostPerUnitFuel,
    HighMaintenanceRank,
    LowMaintenanceRank
FROM
    MaintenanceCostAnalysis
WHERE
    HighMaintenanceRank = 1 OR LowMaintenanceRank = 1
ORDER BY
    Generation;



WITH CombatRangeAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        AVG(CombatRange) AS AvgCombatRange,
        RANK() OVER (PARTITION BY CountryofOrigin ORDER BY AVG(CombatRange) DESC) AS HighCombatRangeRank,
        RANK() OVER (PARTITION BY CountryofOrigin ORDER BY AVG(CombatRange) ASC) AS LowCombatRangeRank
    FROM
        fightjet
    WHERE
        CombatRange IS NOT NULL
    GROUP BY
        NameofJet, CountryofOrigin
)
SELECT
    NameofJet,
    CountryofOrigin,
    AvgCombatRange,
    HighCombatRangeRank,
    LowCombatRangeRank
FROM
    CombatRangeAnalysis
WHERE
    HighCombatRangeRank = 1 OR LowCombatRangeRank = 1
ORDER BY
    CountryofOrigin;



WITH TechnologyAdvancementAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        Introduced,
        RadarType,
        StealthTechnology,
        RANK() OVER (PARTITION BY Generation ORDER BY Introduced) AS RadarIntroductionRank,
        RANK() OVER (PARTITION BY Generation ORDER BY CASE WHEN StealthTechnology = 'Yes' THEN Introduced END) AS StealthIntroductionRank
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    Introduced,
    RadarType,
    StealthTechnology,
    RadarIntroductionRank,
    StealthIntroductionRank
FROM
    TechnologyAdvancementAnalysis
ORDER BY
    Generation, RadarIntroductionRank, StealthIntroductionRank;



WITH PerformanceAnalysis AS (
    SELECT
        NameofJet,
        CountryofOrigin,
        Generation,
        MaxSpeed,
        MaxAltitude,
        Cost,
        RANK() OVER (PARTITION BY CountryofOrigin ORDER BY (MaxSpeed * 0.4 + MaxAltitude * 0.3 + Cost * 0.2) DESC) AS OverallPerformanceRank
    FROM
        fightjet
)
SELECT
    NameofJet,
    CountryofOrigin,
    Generation,
    MaxSpeed,
    MaxAltitude,
    Cost,
    OverallPerformanceRank
FROM
    PerformanceAnalysis
WHERE
    OverallPerformanceRank <= 3
ORDER BY
    CountryofOrigin, OverallPerformanceRank;





















