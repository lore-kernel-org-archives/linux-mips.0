From: "Mark and Janice Juszczec" <juszczec@hotmail.com>
Subject: Re: cross debugging r3912 cpu with gdb
Date: Mon, 08 Dec 2003 00:02:14 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <Law10-F80XN3su1U6s400015b8a@hotmail.com>
Return-Path: <juszczec@hotmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: dan@debian.org
Cc: linux-mips@linux-mips.org
Message-ID: <20031208000214.HJkwX_0bYVD8jmG8rZ-6Mbl-x5TTRqRfgQLsOrUEUEo@z>


Daniel

you wrote:
>
>You left out lots of details.
>

  Oops.  My bad.

>What operating system is the r3900 running?

  Yes its linux.  kernel v2.4.0-test1-acc22

From the list name, I assume it's Linux/MIPS.  So why did you configure for 
>mips-idt-ecoff?
>
  Hmmmmm.  Good question.  The gdb docs say I have to if I want to use the 
MIPS remote debugging protocol.

  I did try --target=mipsel-elf-linux and --target-mipsel-linux.  I got the 
following targets:

(gdb) help target
Connect to a target machine or process.
The first argument is the type or protocol of the target machine.
Remaining arguments are interpreted by the target protocol.  For more
information on the arguments for a particular protocol, type
`help target ' followed by the protocol name.

List of target subcommands:

target async -- Use a remote computer via a serial line
target cisco -- Use a remote machine via TCP
target core -- Use a core file as a target
target exec -- Use an executable file as a target
target extended-async -- Use a remote computer via a serial line
target extended-remote -- Use a remote computer via a serial line
target remote -- Use a remote computer via a serial line
target sim -- Use the compiled-in simulator

  I figured mips should show up, so I guessed they were incorrect.  Even so, 
I tried connecting with both and got the same results:

(gdb) target async /dev/ttyUSB0
Remote debugging using /dev/ttyUSB0
Sending packet: $Hc-1#09...Sending packet: $Hc-1#09...Sending packet: 
$Hc-1#09...Sending packet: $Hc-1#09...Timed out.
Timed out.
Timed out.
Ignoring packet error, continuing...
Sending packet: $qC#b4...Sending packet: $qC#b4...Sending packet: 
$qC#b4...Sending packet: $qC#b4...Timed out.
Timed out.
Timed out.
Ignoring packet error, continuing...
Sending packet: $qOffsets#4b...Sending packet: $qOffsets#4b...Sending 
packet: $qOffsets#4b...Sending packet: $qOffsets#4b...Timed out.
Timed out.
Timed out.
Ignoring packet error, continuing...
Couldn't establish connection to remote target
Malformed response to offset query, timeout

  Any idea what that all means?

>If you're using gdbserver, then you want target=mips-linux and "target
>remote", not "target mips".
>

  I'm not using gdbserver.  It won't fit on my pda if I include kaffe and 
its associated files.

  Mark

_________________________________________________________________
Take advantage of our best MSN Dial-up offer of the year — six months 
@$9.95/month. Sign up now! http://join.msn.com/?page=dept/dialup
