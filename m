Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Mon, 8 Mar 1999 13:47:03 +0100
Message-ID: <199903081247.NAA02741@sun168.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Tom Woelfel <eedthwo@eede.ericsson.se>
Reply-To: eedthwo@eede.ericsson.se
Sender: owner-linux@cthulhu.engr.sgi.com
To: Illegal.f_magic.number.while.install-procedure@eede.ericsson.se
Message-ID: <19990308124703.yJmRPBL7i1zcdNuJmkX2yRb3C3QFYE20IXq5PRaZm2U@z>

Hi,

on the last weekend I've started to install linux on my good ol' Indy
(System: IP22; Processor: 100MHz R4000, with FPU). After setting up
bootp/tftp and creating a file-system I was finally ready to boot linux 
over the network. After loading the kernel the system is giving me
these messages:

============================================================
>> boot bootp()/vmlinux
73264+592+11520+331680+27848d+3628+5792 entry: 0x8df9a960
Setting $netaddres to 192.168.1.5 (from server deadmoon)
Obtaining /vmlinux from server deadmoon

Cannot load bootp()/vmlinux
Illegal f_magic number 0x7f45, expected MIPSELMAGIC or MIPSEBMAGIC.

Exception: <vector=UTLB MISS>
....<More Information>.....
============================================================

Then a message that <return> is rebooting the system appears at the
bottom of the screen.

On server deadmoon I can see:

============================================================
bootp():found 192.168.1.5(sgi)
bootp():bootfile=/export/mipseb/vmlinux
bootp():vendor magic field is 0.0.0.0
bootp():sending reply..

============================================================

I have tried this with the vmlinuv that comes with hardhat, and with
several newer (prebuild) kernels (2.1.131, 990212). The result was
always the same. I guess that this has something todo with magic
numbers ? Is there anyone out there who has seen this before?

(System Configuration: Server running kernel 2.2.2 - connected with
internal net via 10Mbit-Hub).

Any hints welcome,
Tom
