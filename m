Received: from yx-out-1718.google.com ([74.125.44.155]:62 "EHLO
	yx-out-1718.google.com") by ftp.linux-mips.org with ESMTP
	id S20021971AbZDXBy1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 24 Apr 2009 02:54:27 +0100
Received: by yx-out-1718.google.com with SMTP id 4so536277yxp.24
        for <linux-mips@linux-mips.org>; Thu, 23 Apr 2009 18:54:25 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 24 Apr 2009 09:54:24 +0800
Message-ID: <777f39b10904231854m13605b8ayf4ff89e9a853c077@mail.gmail.com>
Subject: kernel panic when resume ( I am porting suspend2 patch into MIPS
	architecture)
From: Bob Zhang <2004.zhang@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-Path: <2004.zhang@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: alex@alexlab.net
Cc: linux-mips@linux-mips.org, "bob.zhang2004" <bob.zhang2004@gmail.com>, Bob Zhang <2004.zhang@gmail.com>
Message-ID: <20090424015424.eGX0vLJIAsNdyB_d-Zx8M6twZ6dYDvLs1ejpYlDL-Po@z>

Hi alex ,

from this url :
http://www.linux-mips.org/archives/linux-mips/2007-11/msg00034.html ,I
am very happly to know you are doing similar thing , it is too good
for me.
I want to know if you have fixed this bug ?

now I have the similar bug. any comments will be welcome.
thanks a lot.


++++++++++++++++++++++++++++++++++++++++++++++++++
Now , I have ported suspend2 code (based on 2.4.21 patch) into mips
architecture, my kernel version is 2.4.21.

My Environment:
kernel:2.4.21
Architecture:mips 32: 4KEc
tty device : only has a serial port.



Now, we have finish 99% work-load, but at last ,we found a problem,
kernel panic after resume code has been executed completely , kernel
code has return the code after hibernate. but system have not return
console, it happened kernel panic.

in resume code, I added debugging code, I am sure, resume code has
been executed completely.
including ,reading pageset1 and pageset2,and copy kernel to original
location, restore cpu context and unfroze processes.

Could you please give me some ideas and suggestions ? thanks very much!


----------
Error output is like this;

Waking     5: bdflush.
Waking     6: kupdated.
Waking     7: mtdblockd.
Waking     8: khubd.
Waking    65: lircd.
Waking    67: inetd.
Waking    80: pure-ftpd.
Waking    81: sh.
Waking    86: hibernate.
Waking   163: hibernate.
Waking   164: tee.
About to restore original console.
swsusp_default_console_level = 1
console_loglevel=7
default_message_loglevel = 4
orig_default_message_loglevel=0
at end of do_software_suspend
Kernel unaligned instruction access in unaligned.c::do_ade, line 446:

CPU Regs : ===========================================================
$0 : 00000000 80290000 00000100 fffdffff 00000007 00000006 802342cc 820e83d4
$8 : 00000000 00000000 00000000 820e83dc 820e83f4 820e8000 80278010 00000000
$16: 8028f7b8 0000debe 00001ebe 802a53a0 0000dee0 7fff7d48 00000004 00000014
$24: 8200000c 2abe4090                   820e8000 820e9e70 00000000 0000000a
Hi : 0000007a
Lo : 000000b7
epc   : 0000000a    Tainted: G Z
Status: 10008403
Cause : 10800010
PrId  : 0001906c
Process init (pid: 1, stackpage=820e8000)
show_stack ============================================================
Stack:    80287ce0 0000003e 0000003c 800b93cc 00000000 00000400 80111bb0
 00000000 00001ee0 ffffffff 0000dee0 10008400 00000001 800b9460 0000000b
 00000189 00000004 00000001 10008400 802a4fc4 80287cf0 10008400 00000001
 0000000a 80287ce0 0000003c 800b9ac0 800b99bc 80239200 10008400 802391bc
 80239200 802a4fc2 802a4fc4 800b9868 820b6d94 00000189 820b72e0 80238b12
 7fff7ba8 00000022 00000000 8028a23c 80287cdc 80239200 802391bc 802391bc
 80239200 80287cdc 00000014 00000005 800da9e4 80238af0 19669944 83feb000
 8028a9d4 00000202 00000000 0000000b 7fff7ba8 00000000 00000001 00008400
 820b1ea0 00000000 00000002 8028a9d4 00000003 820e9ef8 00000002 00000000
 7fff7ba8 0000000b 00000000 7fff7a28 7fff7d48 00000004 00000014 00000000
 2ab61a30 00000000 00000000 2abe7bf0 7fff79b8 00000005 0040709c 00000000
 00000000 2ab61a94 00000008 00008413 10800020 fbbffffe fb7fefff ffffdffb
 bbefefef fdf67ffe b6e5efbd f7f7fff6 efedffff
show_trace =============================================================


Call Trace:
[<800b93cc>__call_console_drivers ]
[<80111bb0>do_select]
[<800b9460> _call_console_drivers ]
[<800b9ac0>release_console_sem]
[<800b99bc>release_console_sem]

[<80239200>] [<802391bc>] [<80239200>] [<800b9868>] [<80238b12>] [<80239200>]
 [<802391bc>] [<802391bc>] [<80239200>] [<800da9e4>] [<80238af0>]
show_code ==============================================================

Code:<7>init: Forwarding exception at [<800acfe0>] (80256a18)
 (Bad address in epc)

Kernel panic: Attempted to kill init!
 UART_MSR_ANY_DELTA




===================================Error Output End ======================
