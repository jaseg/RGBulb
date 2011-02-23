#!/usr/bin/env ruby

inbits = 12
outbits = 16

puts <<eos
#ifndef __GENERATED_PWM_LUT_LOG_#{inbits}_#{outbits}__
#define __GENERATED_PWM_LUT_LOG_#{inbits}_#{outbits}__

#include <avr/pgmspace.h>

const uint16_t log_pwm_lut[] PROGMEM = {
#{(0...2**inbits).map {|i| (2.0**(i/(2**inbits.to_f)*outbits)).round }.join(", ")}
};

#endif//__GENERATED_PWM_LUT_LOG_#{inbits}_#{outbits}__
eos
