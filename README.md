# Collateral manager

### Struktura bazy danych

![Alt text](docs/CollateralManager_DELTA.png?raw=true "Title")


### Wzór wyznaczania wagi

**position** = abs(lead_tags.length - lead_tag_position)

**not_matched_tags_count** = abs(collateral_tags.length - lead_tags.length)

_collateral_weight = sum(collateral_tag_weight * position) - not_matched_tags_count_


### Scenariusz testowy 

1. Setup Tags: [Tag 1] [Tag 2] [Tag 3] [Tag 4] [Tag 5]
2. Setup Collateral Kinds: [Collateral Kind 1] [Collateral Kind 2]
3. Setup Leads:
- Lead 1: [Tag 1: 0] [Tag 2: 1] [Tag 3: 2]
- Lead 2: [Tag 5: 0] [Tag 1: 1]
2. Setup Collaterals: 
- Collateral 1: [Tag 1: 10] [Tag 5: 9] [Tag 2: 3] [Tag 4: 9]
- Collateral 2: [Tag 2: 6] [Tag 3: 9]
- Collateral 3: [Tag 1: 10] [Tag 2: 9] [Tag 3: 10]
- Collateral 4: [Tag 1: 10] [Tag 4: 5] 
- Collateral 5: [Tag 5: 7]
- Collateral 6: [Tag 4: 5] [Tag 5: 3]

3. Expectation for Lead 1:
- Collateral 3 => weight: ((10 * 3) + (9 * 2) + (10 * 1)) - 0 = 58
- Collateral 1 => weight: ((10 * 3) + (3 * 2)) - 2 = 34
- Collateral 2 => weight: ((6 * 2) + (9 * 1)) - 1 = 20

4. Expectation for Lead 2:
- Collateral 1 => weight: ((5 * 2) + (10 * 1)) - 2 = 18
- Collateral 5 => weight: ((7 * 2)) - 1 = 13
- Collateral 4 => weight: ((10 * 1)) - 1 = 9
- Collateral 3 => weight: ((10 * 1)) - 2 = 8
- Collateral 6 => weight: ((3 * 2)) - 2 = 4

