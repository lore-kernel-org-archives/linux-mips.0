Date: Thu, 17 Oct 2002 18:22:11 +0530 (IST)
From: Venkata Rajesh Bikkina <rajeshbv@intotoinc.com>
Subject: Problems in Remote Debugging
Message-ID: <Pine.LNX.4.33.0210171821230.20688-100000@brahma.intotoind.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <rajeshbv@intotoinc.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: rajeshbv@intotoinc.com
Message-ID: <20021017125211.UzcrXVwcurkygv8MdQX8DDU4-T4VizSV7RTA1c4KRpo@z>

Hi All,

I am using "insmod" part of busybox version 0.51 to insert my driver 
module into 2.4.3 linux on 79S334 board.

For remote debugging we need to do insert the module with "-m" option, 
which is not supported by this version of busybox.
So can anybody who are working with this option, can send across the 
binary for me. I want the LITTLE ENDIAN version.

Secondly, i am using "mips_fp_le-gdb" from montavista for remote 
debugging. The problem i am facing with this gdb is "Ctrl+C" is not 
working. Is there any alternative to make it work ?

Regards,
--Rajesh
