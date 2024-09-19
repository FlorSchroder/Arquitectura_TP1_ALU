
# Entity: top 
- **File**: top.v

## Diagram
![Diagram](top.svg "Diagram")
## Ports

| Port name | Direction | Type                 | Description                                                                    |
| --------- | --------- | -------------------- | ------------------------------------------------------------------------------ |
| i_dato    | input     | wire signed    [5:0] | Dato de entrada                                                                |
| i_sw      | input     | wire [1:0]           | Selector: i_sw = 00 ----> Dato A ; i_sw = 01 ----> Dato B ; i_sw = 10 ----> Op |
| i_rst_n   | input     | wire                 |                                                                                |
| o_leds    | output    | wire [3:0]           | output                                                                         |
| clk       | input     | wire                 |                                                                                |

## Signals

| Name  | Type              | Description |
| ----- | ----------------- | ----------- |
| datoA | reg [NB_DATA-1:0] |             |
| datoB | reg [NB_DATA-1:0] |             |
| op    | reg [NB_OP - 1:0] |             |

## Constants

| Name    | Type | Value | Description |
| ------- | ---- | ----- | ----------- |
| NB_DATA |      | 4     |             |
| NB_OP   |      | 6     |             |

## Processes
- unnamed: ( @(posedge clk or negedge i_rst_n) )
  - **Type:** always

## Instantiations

- u_alu: alu
  -  ALU