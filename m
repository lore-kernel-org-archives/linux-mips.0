From: "Tom Cernius" <tcernius@correlant.com>
Subject: FW: Db1500 PCI Auto Scan Question
Date: Wed, 11 Jun 2003 15:12:18 -0700
Message-ID: <000201c33066$8623dac0$d452dad1@correlant.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <tcernius@correlant.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: ppopov@mvista.com
Cc: linux-mips@linux-mips.org
Message-ID: <20030611221218.1MhLnDxtRt5P6HysAk4Jx2bfjktWqlOZC6HsL1yA9jI@z>

Hello,

   I am porting my first PCI driver for a PCI card hosted by the AMD Db1500
"Zinfandel" development board.
   This driver had been previously working on another host, where
CONFIG_PCI_AUTO was not enabled.

    My PCI card REQUIRES 0xFF000000 and 0x90000000 be programmed into BAR0
and BAR1 respectively.
    My PCI card has nothing programmed into BAR0 and BAR1 at power-up.
    My host Linux kernel was built with CONFIG_PCI, CONFIG_NEW_PCI, and
CONFIG_PCI_AUTO turned on in the .config file.

     I noticed that during boot, the kernel tickles my devices BAR's and
then writes these BARs with addresses in the range of
     4000 0000 thru 43FF FFFF

     I have tried everything and although I am able to write the proper
(0xFF00 0000 and 0x9000 0000) addresses into the BAR's,
     I have been unable to successfully read anything from my PCI cards CPU
Register/Sdram space.

     I suspect that it is NOT possible to use hardcoded PCI BAR addresses
with the MIPS processor AND CONFIG_PCI_AUTO turned on,
     as the kernel expects (and configures the PCI BARS of) PCI devices to
reside in the address space 0x4000 0000 thru 0x43FF FFFF ??

     I tried disabling the device, updating my BARS, reenabling in the
driver code (a loadable module).
     I tried writing the BARS just prior to tickling in the
linux/arch/mips/kernel/pci_auto.c code.
     I tried writing the BARS as soon as my device/vendor id are detected
also in the linux/arch/mips/kernel/pci_auto.c code.

Thanks,
Tom
