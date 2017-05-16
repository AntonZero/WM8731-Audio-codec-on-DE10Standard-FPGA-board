transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib pll
vmap pll pll
vlog -vlog01compat -work pll +incdir+d:/intelfpga_lite/projects/project1/db/ip/pll {d:/intelfpga_lite/projects/project1/db/ip/pll/pll.v}
vlog -vlog01compat -work pll +incdir+d:/intelfpga_lite/projects/project1/db/ip/pll/submodules {d:/intelfpga_lite/projects/project1/db/ip/pll/submodules/pll_onchip_memory2_0.v}
vlog -vlog01compat -work pll +incdir+d:/intelfpga_lite/projects/project1/db/ip/pll/submodules {d:/intelfpga_lite/projects/project1/db/ip/pll/submodules/pll_pll_0.v}
vcom -93 -work work {D:/intelFPGA_lite/projects/project1/audio_codec.vhd}
vcom -93 -work work {D:/intelFPGA_lite/projects/project1/i2c.vhd}
vcom -93 -work work {D:/intelFPGA_lite/projects/project1/aud_gen.vhd}

