# DD1351 - Logik

Filer för kurs DD1351(HT24)-Logik för dataloger.

## Basic Logic Operations

Negation (NOT)

|   p   |  ~p   |
| :---: | :---: |
|   0   |   1   |
|   1   |   0   |

Conjunction (AND)

|   p   |   q   | p ∧ q |
| :---: | :---: | :---: |
|   0   |   0   |   0   |
|   0   |   1   |   0   |
|   1   |   0   |   0   |
|   1   |   1   |   1   |

Disjunction (OR)

|   p   |   q   | p ∨ q |
| :---: | :---: | :---: |
|   0   |   0   |   0   |
|   0   |   1   |   1   |
|   1   |   0   |   1   |
|   1   |   1   |   1   |

Implication (IF-THEN)

|   p   |   q   | p ⟶ q |
| :---: | :---: | :---: |
|   0   |   0   |   1   |
|   0   |   1   |   1   |
|   1   |   0   |   0   |
|   1   |   1   |   1   |

Equivalence (IF and ONLY IF, aka OMM)

|   p   |   q   | p ↔ q |
| :---: | :---: | :---: |
|   0   |   0   |   1   |
|   0   |   1   |   0   |
|   1   |   0   |   0   |
|   1   |   1   |   1   |

=============== Derived Connectors ======

Not AND (NAND)

|   p   |   q   | p ↑ q |
| :---: | :---: | :---: |
|   0   |   0   |   1   |
|   0   |   1   |   1   |
|   1   |   0   |   1   |
|   1   |   1   |   0   |

Not OR/Joint Denial (NOR)

|   p   |   q   | p ↓ q |
| :---: | :---: | :---: |
|   0   |   0   |   1   |
|   0   |   1   |   0   |
|   1   |   0   |   0   |
|   1   |   1   |   0   |

Either OR (XOR)

|   p   |   q   | p ⨁ q |
| :---: | :---: | :---: |
|   0   |   0   |   0   |
|   0   |   1   |   1   |
|   1   |   0   |   1   |
|   1   |   1   |   0   |
