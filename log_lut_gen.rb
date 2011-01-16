#!/usr/bin/env ruby

inbits = 8
outbits = 16

puts <<eos
/* 
* Logarithmic #{outbits}-bit pwm #{inbits}-bit lookup table
* 
* Copyright 2010 by Jan Sebastian Götte (s@twopi.eu)
*  - - - - - - - - - - - - LICENSE INFORMATION - - - - - - - - - - - -
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either 1.1 3 of the License, or
* (at your option) any later 1.1.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
*
*/

#ifndef __GENERATED_PWM_LUT_LOG_#{inbits}_#{outbits}__
#define __GENERATED_PWM_LUT_LOG_#{inbits}_#{outbits}__

#include <avr/pgmspace.h>

const uint16_t log_pwm_lut[] PROGMEM = {
#{(0...2**inbits).map {|i| (2.0**(i/(2**inbits.to_f)*outbits)).round }.join(", ")}
};

#endif//__GENERATED_PWM_LUT_LOG_#{inbits}_#{outbits}__

eos
