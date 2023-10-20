# Basic-Calculator
This Unix shell program stimulates a basic calculator.

## How to run
In terminal:
To compile: chmod u+x calc.sh
To run: ./calc.sh

At the "Operand" prompt, the user can enter: Any digit, MR, MC, Clear (C), Off (X)
﻿﻿At the "Operator" prompt, the user can enter: +, -, *, /, MS, M+, MC, Clear (C), Off (X)
﻿﻿At both prompts (treat as operand or operator): MC, Clear (C), Off (X)
## ﻿﻿Error checking
For the operand, assume valid input (no error checking). 
For the operator, there is error checking for an invalid operator. A brief informative message will be displayed to re-ask the user for input.

## Commands
<table>
<thead>
  <tr>
    <th>User Input</th>
    <th>Function</th>
    <th>Action</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>digits</td>
    <td>Operand entry</td>
    <td>Accept entry</td>
  </tr>
  <tr>
    <td>+</td>
    <td>Addition</td>
    <td rowspan="4">Arithmetic</td>
  </tr>
  <tr>
    <td>-</td>
    <td>Subtraction</td>
  </tr>
  <tr>
    <td>*</td>
    <td>Multiplication</td>
  </tr>
  <tr>
    <td>/</td>
    <td>Division</td>
  </tr>
  <tr>
    <td>C</td>
    <td>Clear</td>
    <td>Clear result, keep memory</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>Memory Store</td>
    <td>Store result in memory</td>
  </tr>
  <tr>
    <td>M+</td>
    <td>Memory Add</td>
    <td>Adds result to memory</td>
  </tr>
  <tr>
    <td>MR</td>
    <td>Recall</td>
    <td>Can be 1st or 2nd operand</td>
  </tr>
  <tr>
    <td>MC</td>
    <td>Memory Clear</td>
    <td>Put 0 in memory</td>
  </tr>
  <tr>
    <td>X</td>
    <td>Off</td>
    <td>Exit</td>
  </tr>
  <tr>
    <td>X</td>
    <td>Off</td>
    <td>Exit</td>
  </tr>
</tbody>
</table>
