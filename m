Received: from sj-iport-2-in.cisco.com ([171.71.176.71]:11066 "EHLO
	sj-iport-2.cisco.com") by ftp.linux-mips.org with ESMTP
	id S20022731AbXF1Up1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 28 Jun 2007 21:45:27 +0100
Received: from sj-core-4.cisco.com (sj-core-4.cisco.com [171.68.223.138])
	by sj-dkim-1.cisco.com (8.12.11/8.12.11) with ESMTP id l5SKjCDD023545
	for <linux-mips@linux-mips.org>; Thu, 28 Jun 2007 13:45:12 -0700
Received: from xbh-sjc-211.amer.cisco.com (xbh-sjc-211.cisco.com [171.70.151.144])
	by sj-core-4.cisco.com (8.12.10/8.12.6) with ESMTP id l5SKisH0005995
	for <linux-mips@linux-mips.org>; Thu, 28 Jun 2007 20:45:12 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: gdbserver
Date: Thu, 28 Jun 2007 13:45:02 -0700
Message-ID: <27801B4D04E7CA45825B0E0CE60FE10A0410F0D6@xmb-sjc-237.amer.cisco.com>
In-Reply-To: <20070628083725.GA23394@lst.de>
References: <cda58cb80706260820y4db3eacnae4dff0101852d52@mail.gmail.com> <20070627.013312.25479645.anemo@mba.ocn.ne.jp> <20070627153932.GA6016@lst.de> <20070628.112223.96686654.nemoto@toshiba-tops.co.jp> <20070628083725.GA23394@lst.de>
From: "Ratin Rahman \(mratin\)" <mratin@cisco.com>
Return-Path: <mratin@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: "Ratin Rahman (mratin)" <mratin@cisco.com>
Message-ID: <20070628204502.0eRIDOFf202-IA5bwvb_v5jiGuTkY6P5Hudujwzc2Sg@z>

Anybody had luck with compiling gdbserver for mipsel? I am using x86
based machine running Fedora 2.6.11 kernel, the target device is IDT 434
running Mipsel 2.6.10 kernel. The gcc crosscompiler is mipsel-linux-gcc
and version 3.2.3.

I did a ./configure --host=mipsel-linux-gnu --target=mipsel-linux-gnu
followed by a make. Make failed with the messages: 

/opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h:33: syntax error
before numeric constant
/opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h:49: syntax error
before numeric constant
/opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h:61: syntax error
before numeric constant
/opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h:94: syntax error
before numeric constant
/opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h:112: syntax error
before numeric constant
linux-low.c: In function `kill_lwp':
linux-low.c:760: warning: unused variable `tkill_failed'
make: *** [linux-low.o] Error 1
[root@Clearnet gdbserver]# nano
/opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h
[root@Clearnet gdbserver]# nano
/opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h


The content of ptrace.h has the enums declared as 

/* Type of the REQUEST argument to `ptrace.'  */
enum __ptrace_request
{
  /* Indicate that the process making this request should be traced.
     All signals received by this process can be intercepted by its
     parent, and its parent can use the other `ptrace' requests.  */
  PTRACE_TRACEME = 0,
<==================================line 33
#define PT_TRACE_ME PTRACE_TRACEME

  /* Return the word in the process's text space at address ADDR.  */
  PTRACE_PEEKTEXT = 1,
#define PT_READ_I PTRACE_PEEKTEXT


..which looks pretty normal to me , anybod yhave any clue? 
Thanks,


Ratin 
