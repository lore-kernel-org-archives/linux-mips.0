content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: Kernel Debugging on the DBAu1500
Date: Fri, 7 Mar 2003 17:41:28 +0530
Message-ID: <69595093233BB547BB70CF5E492B63F2E5246E@sohm.kpit.com>
From: "Dhananjay R. Deshpande" <dhananjayd@kpit.com>
Return-Path: <dhananjayd@kpit.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Juan Quintela <quintela@mandrakesoft.com>, baitisj@evolution.com
Cc: linux-mips@linux-mips.org
Message-ID: <20030307121128.TeODR8LMeRcUBThM6JFJUKOqkEi59Dxq4VTDXKsMGes@z>

Hi,

Try 
(gdb) set remotebaud 115200

before 

(gdb) target remote /dev/ttyS1 


- Dhananjay

> -----Original Message-----
> From: Juan Quintela [mailto:quintela@mandrakesoft.com]
> Sent: Friday, March 07, 2003 5:33 PM
> To: baitisj@evolution.com
> Cc: linux-mips@linux-mips.org
> Subject: Re: Kernel Debugging on the DBAu1500
> 
> 
> >>>>> "jeff" == Jeff Baitis <baitisj@evolution.com> writes:
> 
> Hi
>         perhaps don't help, but try using 57600 bauds.  Some
>         chipsets don't like 115200 bauds.
> 
> I have never used gdb on MIPS, but at least on intel, you need run a
> program in your MIPS board (in intel it is gdbstart called).
> 
> Later, Juan.
> 
> jeff> Hi all:
> jeff> I've been trying to get a kernel debugger running on my 
> AMD DBAu1500.  It boots
> jeff> up over a serial console. I enable "Remote GDB kernel 
> debugging," and "Console
> jeff> output to GDB."
> 
> jeff> Here's what I tell YAMON to do:
> 
> jeff> go . gdb gdbttyS=0 gdbbaud=115200
> 
> jeff> And on my x86 machine, I:
> 
> jeff> stty ispeed 115200 ospeed 115200 < /dev/ttyS1
> 
> jeff> /opt/hardhat/devkit/mips/fp_le/bin/mips_fp_le-gdb vmlinux
> jeff> (gdb) target remote /dev/ttyS1 
> 
> jeff> GDB seems not to communicate. Here's what it says:
> 
> jeff> Ignoring packet error, continuing...
> jeff> Ignoring packet error, continuing...
> jeff> Ignoring packet error, continuing...
> jeff> Couldn't establish connection to remote target
> jeff> Malformed response to offset query, timeout
> 
> jeff> Suggestions?
> 
> jeff> Thanks in advance!
> 
> 
> 
> 
> -- 
> In theory, practice and theory are the same, but in practice they 
> are different -- Larry McVoy
> 
> 
