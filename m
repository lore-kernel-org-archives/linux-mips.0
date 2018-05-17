Received: from mail.kernel.org ([198.145.29.99]:55240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993514AbeEQJjhYBm-k (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 17 May 2018 11:39:37 +0200
Subject: Patch "futex: Remove duplicated code and fix undefined behaviour" has been added to the 4.4-stable tree
From: <gregkh@linuxfoundation.org>
Date: Thu, 17 May 2018 11:38:53 +0200
Message-ID: <15265499332582@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-Path: <SRS0=CLTL=IE=linuxfoundation.org=gregkh@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: 20170824073105.3901-1-jslaby@suse.cz, arnd@arndb.de, ben.hutchings@codethink.co.uk, benh@kernel.crashing.org, catalin.marinas@arm.com, chris@zankel.net, cmetcalf@mellanox.com, dalias@libc.org, davem@davemloft.net, deller@gmx.de, dvhart@infradead.org, fenghua.yu@intel.com, gregkh@linuxfoundation.org, heiko.carstens@de.ibm.com, ink@jurassic.park.msu.ru, jcmvbkbc@gmail.com, jejb@parisc-linux.org, jonas@southpole.sejslaby@suse.cz, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, mattst88@gmail.com, monstr@monstr.eu, mpe@ellerman.id.au, openrisc@lists.librecores.org, paulus@samba.org, peterz@infradead.org, ralf@linux-mips.org, rkuo@codeaurora.org, rmk+kernel@armlinux.org.uk, rth@twiddle.net, schwidefsky@de.ibm.com, shorne@gmail.com, stefan.kristiansson@saunalahti.fi, tglx@linutronix.de, tony.luck@intel.com, vgupta@synopsys.com, will.deacon@arm.com, ysato@users.sourceforge.jp
Cc: stable-commits@vger.kernel.org
Message-ID: <20180517093853.iRQxat0iFSemPnv_TcwvaRgEq6sRoNYy6aBPCroIU7M@z>


This is a note to let you know that I've just added the patch titled

    futex: Remove duplicated code and fix undefined behaviour

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     futex-remove-duplicated-code-and-fix-undefined-behaviour.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
