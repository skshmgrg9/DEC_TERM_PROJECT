module reaction_timer_top
(
    output [6:0] units_seg, tens_seg, hundreds_seg, thousands_seg,
    input clk_100MHz,
    input led_on,
    input reaction_switch,
    input clear
);

wire clk_1kHz;
wire [3:0] units_BCD, tens_BCD, hundreds_BCD, thousands_BCD;

// Wiring up the modules:

// Step #1: Time Mechanism
clock_divider divider_inst(clk_1kHz, clk_100MHz);

// Step #2: Counter Mechanism
mod_ten_counter counter0_inst(units_BCD, (clk_1kHz & led_on & ~reaction_switch), clear);
mod_ten_counter counter1_inst(tens_BCD, units_BCD[3], clear);
mod_ten_counter counter2_inst(hundreds_BCD, tens_BCD[3], clear);
mod_ten_counter counter3_inst(thousands_BCD, hundreds_BCD[3], clear);

// Step #3: Display Mechanism
seven_segment_driver driver0_inst(units_seg, units_BCD);
seven_segment_driver driver1_inst(tens_seg, tens_BCD);
seven_segment_driver driver2_inst(hundreds_seg, hundreds_BCD);
seven_segment_driver driver3_inst(thousands_seg, thousands_BCD);

endmodule