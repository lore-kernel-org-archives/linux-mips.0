Date: Wed, 7 Mar 2001 15:03:03 -0500 (EST)
From: Kenneth C Barr <kbarr@MIT.EDU>
Subject: oops on shutdown
Message-ID: <Pine.GSO.4.30L.0103071457170.9228-100000@scrubbing-bubbles.mit.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20010307200303.kvTINsBOaQTfE4KmzpZzUbZOnnrmtACNKZWQUQqGOaQ@z>

I receive this error any time I try to "reboot" or "shutdown" my Indy
running a snapshot of 2.4.1.

Is this normal or experienced by anyone else?

Easy solution would be never to turn off the machine, but I want to make
sure this isn't indicative of a larger problem.  (eg, broken paging?)


shutdown: couldn't unmount /dev/sda1

Unable to handle kernel paging request at virtual address 00000000, epc
== 00008
Oops in fault.c:do_page_fault, line 172:
regs:

...

epc     00000000
Status  1000fc03
Cause   00000008
Process reboot (pid:39, stackpage=8bc8e000)
Stack:

...

Call trace: [<88031a6c>]  [<88031a64>] [<8813f734>] [<880b9a5c>]
[<88058714>]
Code: (Bad address in epc)
