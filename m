Received: from sj-iport-5.cisco.com ([171.68.10.87]:30951 "EHLO
	sj-iport-5.cisco.com") by ftp.linux-mips.org with ESMTP
	id S20022744AbXF1WUA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 28 Jun 2007 23:20:00 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: gdbserver
Date: Thu, 28 Jun 2007 15:19:50 -0700
Message-ID: <27801B4D04E7CA45825B0E0CE60FE10A0416F836@xmb-sjc-237.amer.cisco.com>
In-Reply-To: <46842B05.5050103@avtrex.com>
References: <cda58cb80706260820y4db3eacnae4dff0101852d52@mail.gmail.com> <20070627.013312.25479645.anemo@mba.ocn.ne.jp> <20070627153932.GA6016@lst.de> <20070628.112223.96686654.nemoto@toshiba-tops.co.jp> <20070628083725.GA23394@lst.de> <27801B4D04E7CA45825B0E0CE60FE10A0410F0D6@xmb-sjc-237.amer.cisco.com> <46842B05.5050103@avtrex.com>
From: "Ratin Rahman \(mratin\)" <mratin@cisco.com>
Return-Path: <mratin@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@avtrex.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20070628221950.8K1q8K7rkSFIIXvVvuRGrF5EAv8S31Qa3Z0eWNxoBHE@z>

 
It might be the fact that I am trying to compile gdbsever from the
latest version of gdb with older toolchain. I need an upgraded gcc and
glibc but they are also failing to build. Not sure what order I should
compile them ..

Ratin


-----Original Message-----
From: David Daney [mailto:ddaney@avtrex.com] 
Sent: Thursday, June 28, 2007 2:41 PM
To: Ratin Rahman (mratin)
Cc: linux-mips@linux-mips.org
Subject: Re: gdbserver

Ratin Rahman (mratin) wrote:
> Anybody had luck with compiling gdbserver for mipsel? I am using x86 
> based machine running Fedora 2.6.11 kernel, the target device is IDT 
> 434 running Mipsel 2.6.10 kernel. The gcc crosscompiler is 
> mipsel-linux-gcc and version 3.2.3.
> 
> I did a ./configure --host=mipsel-linux-gnu --target=mipsel-linux-gnu 
> followed by a make. Make failed with the messages:
> 
> /opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h:33: syntax 
> error before numeric constant
> /opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h:49: syntax 
> error before numeric constant
> /opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h:61: syntax 
> error before numeric constant
> /opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h:94: syntax 
> error before numeric constant
> /opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h:112: syntax 
> error before numeric constant
> linux-low.c: In function `kill_lwp':
> linux-low.c:760: warning: unused variable `tkill_failed'
> make: *** [linux-low.o] Error 1
> [root@Clearnet gdbserver]# nano
> /opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h
> [root@Clearnet gdbserver]# nano
> /opt/mipseltools/mipsel-linux/sys-include/sys/ptrace.h
> 
> 
> The content of ptrace.h has the enums declared as
> 
> /* Type of the REQUEST argument to `ptrace.'  */ enum __ptrace_request

> {
>   /* Indicate that the process making this request should be traced.
>      All signals received by this process can be intercepted by its
>      parent, and its parent can use the other `ptrace' requests.  */
>   PTRACE_TRACEME = 0,
> <==================================line 33 #define PT_TRACE_ME 
> PTRACE_TRACEME
> 
>   /* Return the word in the process's text space at address ADDR.  */
>   PTRACE_PEEKTEXT = 1,
> #define PT_READ_I PTRACE_PEEKTEXT
> 
> 
> ..which looks pretty normal to me , anybod yhave any clue? 
> Thanks,
> 

Perhaps your toolchain is broken, or perhaps you need to configure
differently.

With my glibc-2.3.3/gcc-3.4.3 toolchain I do:
../gdb-6.6/configure  --target=mipsel-linux --host=mipsel-linux
--build=i686-pc-linux-gnu

Then make and voila! gdb, gdbserver et al. are built.

David Danay
