
# Entity: alu 
- **File**: alu.v

## Diagram
![Diagram](alu.svg "Diagram")
## Generics

| Generic name | Type | Value | Description          |
| ------------ | ---- | ----- | -------------------- |
| NB_DATA      |      | 4     | BITs de datos y LEDs |
| NB_OP        |      | 6     | BITs de operaciones  |

## Ports

| Port name   | Direction | Type                         | Description          |
| ----------- | --------- | ---------------------------- | -------------------- |
| i_datoA     | input     | wire    signed [NB_DATA-1:0] | Dato de entrada      |
| i_datoB     | input     | wire    signed [NB_DATA-1:0] | Dato de entrada      |
| i_operation | input     | wire    [NB_OP - 1:0]        | Operación a realizar |
| o_leds      | output    | wire    signed [NB_DATA-1:0] | output               |

## Signals

| Name   | Type                     | Description               |
| ------ | ------------------------ | ------------------------- |
| result | reg signed [NB_DATA-1:0] | Resultado de la operación |

## Constants

| Name   | Type | Value     | Description     |
| ------ | ---- | --------- | --------------- |
| OP_ADD |      | 6'b100000 | Operation cases |
| OP_SUB |      | 6'b100010 | Operation cases |
| OP_AND |      | 6'b100100 | Operation cases |
| OP_OR  |      | 6'b100101 | Operation cases |
| OP_XOR |      | 6'b100110 | Operation cases |
| OP_SRA |      | 6'b000011 | Operation cases |
| OP_SRL |      | 6'b000010 | Operation cases |
| OP_NOR |      | 6'b100111 | Operation cases |

## Processes
- unnamed: ( @(*) )
  - **Type:** always
  - **Description**
  NOR operation 
