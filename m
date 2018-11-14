Received: from mail.kernel.org ([198.145.29.99]:47450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993032AbeKNATKwIuBG (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 14 Nov 2018 01:19:10 +0100
Subject: Patch "MIPS: kexec: Mark CPU offline before disabling local IRQ" has been added to the 3.18-stable tree
From: <gregkh@linuxfoundation.org>
Date: Tue, 13 Nov 2018 16:19:05 -0800
Message-ID: <1542154745200101@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-Path: <SRS0=PMNE=NZ=linuxfoundation.org=gregkh@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: dzhu@wavecomp.com, gregkh@linuxfoundation.org, linux-mips@linux-mips.org, paul.burton@mips.com, pburton@wavecomp.com, rachel.mozes@intel.com, ralf@linux-mips.org, sashal@kernel.org
Cc: stable-commits@vger.kernel.org
Message-ID: <20181114001905.E3jTEkmnLkRSG7dA4JXfZP-P6b7lOgxac5-fFCu7ZLI@z>


This is a note to let you know that I've just added the patch titled

    MIPS: kexec: Mark CPU offline before disabling local IRQ

to the 3.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-kexec-mark-cpu-offline-before-disabling-local-irq.patch
and it can be found in the queue-3.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
