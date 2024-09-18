# Arquitectura de Computadoras

En este repositorio se desarrolla el trabajo práctico 1 de la materia Arquitectura de Computadoras.
Este proyecto fue realizado por los alumnos: 
- [Mansilla, Josías Leonel](https://github.com/w3rqil)

- [Schroder Ferrando, Florencia](https://github.com/FlorSchroder) 

# Consigna

• Implementar en FPGA una ALU.
• La ALU debe ser parametrizable (bus de datos) para
poder ser utilizada posteriormente en el trabajo final.
• Validar el desarrollo por medio de Test Bench.
• El testbench debe incluir generación de entradas
aleatorias y código de chequeo automático.
• Simular el diseño usando las herramientas de
simulación de vivado incluyendo análisis de tiempo.

Más información y detalles de la consigna en [Trabajo_Practico_N_1_-_ALU.pdf](/Trabajo_Practico_N_1_-_ALU.pdf).

# Desarrollo

Para el desarrollo del trabajo práctico se implementaron dos módulos, el primero que comprende la lógica de la [alu](/src/alu.v) y el segundo es un [top](/src/top.v) a función de 'wrapper'.
## Jerarquía de archivos

![jerarquia](/img/files_hierarchy.png)


## Module ALU

Este módulo comprende una lógica combinacional sencilla que tiene en cuenta todos los casos posibles de operaciones propuestos en la consigna, y dependiendo de la operación seleccionada (i_op), pone en la salida el resultado correcto.

A continuación un diagrama del módulo donde se pueden ver sus entradas y salidas:

![diagram_ALU](/TerosHDL/alu.svg)

### Generics

| Generic name | Type | Value | Description          |
| ------------ | ---- | ----- | -------------------- |
| NB_DATA      |      | 4     | BITs de datos y LEDs |
| NB_OP        |      | 6     | BITs de operaciones  |

### Ports

| Port name   | Direction | Type                         | Description          |
| ----------- | --------- | ---------------------------- | -------------------- |
| i_datoA     | input     | wire    signed [NB_DATA-1:0] | Dato de entrada      |
| i_datoB     | input     | wire    signed [NB_DATA-1:0] | Dato de entrada      |
| i_operation | input     | wire    [NB_OP - 1:0]        | Operación a realizar |
| o_leds      | output    | wire    signed [NB_DATA-1:0] | output               |

### Signals

| Name   | Type                     | Description               |
| ------ | ------------------------ | ------------------------- |
| result | reg signed [NB_DATA-1:0] | Resultado de la operación |

### Constants

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


## Module TOP

Este módulo genera una instancia del módulo tiene una entrada i_dato de 6 bits, que, dependiendo del valor del switch (i_sw) va a asignar el valor de i_dato en una instancia del módulo ALU de forma:
- i_sw = 00 ----> Dato A
- i_sw = 01 ----> Dato B
- i_sw = 10 ----> Opetarion


A continuació un diagrama del módulo top:

![Diagram_TOP](/TerosHDL/top.svg)


### Ports

| Port name | Direction | Type                 | Description                                                                    |
| --------- | --------- | -------------------- | ------------------------------------------------------------------------------ |
| i_dato    | input     | wire signed    [5:0] | Dato de entrada                                                                |
| i_sw      | input     | wire [1:0]           | Selector: i_sw = 00 ----> Dato A ; i_sw = 01 ----> Dato B ; i_sw = 10 ----> Op |
| i_rst_n   | input     | wire                 | Reset del sistema: asigna 00 a todas las entradas de u_alu                     |
| o_leds    | output    | wire [3:0]           | output                                                                         |
| clk       | input     | wire                 | Clock del sistema                                                              |

### Signals

| Name  | Type              | Description |
| ----- | ----------------- | ----------- |
| datoA | reg [NB_DATA-1:0] |             |
| datoB | reg [NB_DATA-1:0] |             |
| op    | reg [NB_OP - 1:0] |             |



## Testbenchs

Para comprobar el funcionamiento del código se realizaron dos módulos de testbenchs [tb_top.v](/tb/tb_top.v) y [tb_alu.v](/tb/tb_alu.v) donde se estimulan las entradas de los respectivos módulos a fin de comprobar el funcionamiento y verificar el resultado en todas las operaciones posibles. 

### TB ALU

A continuación se presentan waveform y console log generados luego de ejecutar el testbench del módulo ALU. Se puede ver el correcto funcionamiento del módulo.

![tb_ALU_wvfm](/img/tb_ALU_waveform.png)

![tb_ALU_cl](/img/tb_ALU_consolelog.png)

### TB TOP

A continuación se presentan waveform y console log generados luego de ejecutar el testbench del módulo TOP. Se puede ver la presencia del clock y el correcto funcionamiento del sistema analizando los resultados.

![tb_TOP_wvfm](/img/tb_TOP_waveform.png)

![tb_TOP_cl](/img/tb_TOP_consolelog.png)

## Schematic

Luego de generar el bitstream, o luego de correr la implementación, se puede observar el diseño implementado (FPGA):

![implemented_design](/img/implemented_design.png)

se puede ver el esquemático del proyecto yendo a IMPLEMENTATION -> Open Implemented Design -> schematic

![schematic_path](/img/schematic_path.png)

A continuación el esquemático del proyecto completo (top):

![top_sch](/img/top_schematic.png)

Haciendo click en el **+** que se encuentra en la esquina izquierda superior del módulo ALU, podemos ver el esquemático del mismo:

![alu_sch](/img/alu_schematic.png)





