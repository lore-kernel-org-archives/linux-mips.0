Message-ID: <004a01c11651$07e206e0$830448c0@gv.com.tw>
From: "´¿¬L©ú" <kevin@gv.com.tw>
References: <7DF7BFDC95ECD411B4010090278A44CA0A3BC1@ATVX>
Subject: Re: Linux 2.4.6
Date: Fri, 27 Jul 2001 12:03:02 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Sender: owner-linux-mips@oss.sgi.com
To: "Siders, Keith" <keith_siders@toshibatv.com>, linux-mips@oss.sgi.com
Message-ID: <20010727040302.UqhNES1wIvSa7XYY_L-SknapPbMeDNX2Uk7YKW8lQ9E@z>

bash v2.03 should help

----- Original Message ----- 
From: "Siders, Keith" <keith_siders@toshibatv.com>
To: <linux-mips@oss.sgi.com>
Sent: Friday, July 27, 2001 5:02 AM
Subject: Linux 2.4.6


I've made changes to the plain vanilla Linux 2.4.6 to port to our TX49H2
core on one of our EVB's. Which version of the compiler and binutils should
I use? The binutils-xx-2.8.1-2 and egcs-xx-1.1.2-4 worked for the 2.2.19
port, but I'm getting errors in the shell scripts when I run 'make config'.
I get the same errors with the same tools with the generic 2.4.6 as well.
Looks like

bash-2.04$ cd linux
bash-2.04$ make config
rm -f include/asm
( cd include ; ln -sf asm-mips asm)
/bin/sh scripts/Configure arch/mips/config.in
: command not found
'cripts/Configure: line 68: syntax error near unexpected token `{
'cripts/Configure: line 68: `function mainmenu_option () {
make: *** [config] Error 2
bash-2.04$

Not sure where to go from here as the scripts didn't change significantly
between 2.2.19 and 2.4.6.

Keith Siders
Software Engineer
 Toshiba America Consumer Products, Inc.
Advanced Television Technology Center
801 Royal Parkway, Suite 100
Nashville, Tennessee 37214
Phone: (615) 257-4050
Fax:   (615) 453-7880
