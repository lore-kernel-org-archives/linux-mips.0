Received: from mail.windriver.com ([147.11.1.11]:49029 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013324AbcBTBMvp0K3y (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Feb 2016 02:12:51 +0100
From: Yang Shi <yang.shi@windriver.com>
Subject: 4.5-rc4 kernel is failed to bootup on CN6880
Message-ID: <56C7BD89.2040800@windriver.com>
Date: Fri, 19 Feb 2016 17:12:41 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Yang.Shi@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: david.daney@cavium.com
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160220011241.ppU-eLhbgFg9R9M7O1zmphPWUhcLBKy5vfuxHwHbkVM@z>

Hi David,

I tried to boot 4.5-rc4 kernel on my CN6880 board, but it is failed at 
booting up secondary cores. The error is:

CPU31 revision is: 000d9101 (Cavium Octeon II)
SMP: Booting CPU32 (CoreId 32)...
Secondary boot timeout

I passed "numcores=32" in kernel commandline since there are 32 cores 
ion CN6880. And, the bootloader information is as below:

U-Boot 2013.07 ( (U-BOOT build: 104, SDK version: 3.1.1-544), 
svnversion: u-boot:107133M, exec:)-svn107117 (Build time: Oct 31 2014 - 
19:39:37)

Skipping PCIe port 0 BIST, reset not done. (port not configured)
Skipping PCIe port 1 BIST, reset not done. (port not configured)
BIST check passed.
EBB6800 board revision major:2, minor:0, serial #: 2011-2.0-00120
OCTEON CN6880-AAP pass 1.1, Core clock: 1200 MHz, IO clock: 800 MHz, DDR 
clock: 667 MHz (1334 Mhz DDR)
Base DRAM address used by u-boot: 0x20f000000, size: 0x1000000
DRAM: 8 GiB
Clearing DRAM...... done
NAND:  4096 MiB
Registered IDE device 0 from IDE bus:dev 0:0
Flash: 8 MiB
0:PCIe: Port 0 is unknown, skipping.
0:PCIe: Port 1 is unknown, skipping.
PCI console init succeeded, 1 consoles, 1024 bytes each
Net:   octmgmt0, octeth0, octeth1, octeth2, octeth3
Bus 0: OK
   Device 0: Model: CF 1GB Firm: 20071116 Ser#: TSS20037110113081057
             Type: Hard Disk
             Capacity: 967.6 MB = 0.9 GB (1981728 x 512)
USB0:   USB EHCI 1.00
scanning bus 0 for devices... 1 USB Device(s) found
Type the command 'usb start' to scan for USB storage devices.


Any hint is appreciated.

Thanks,
Yang
