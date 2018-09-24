Received: from mail.linuxfoundation.org ([140.211.169.12]:50808 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991947AbeIXHsyspMPb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Sep 2018 09:48:54 +0200
Subject: Patch "binfmt_elf: Respect error return from `regset->active'" has been added to the 4.18-stable tree
From: <gregkh@linuxfoundation.org>
Date: Mon, 24 Sep 2018 09:47:08 +0200
Message-ID: <153777522821434@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-Path: <gregkh@linuxfoundation.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: alexander.levin@microsoft.com, gregkh@linuxfoundation.org, jhogan@kernel.org, linux-mips@linux-mips.org, macro@mips.com, paul.burton@mips.com, ralf@linux-mips.org, viro@zeniv.linux.org.uk
Cc: stable-commits@vger.kernel.org
Message-ID: <20180924074708.YPeGn3cBPk9L2tkfYJrCRU7Gne7BN30xD4SpuZFuVqA@z>


This is a note to let you know that I've just added the patch titled

    binfmt_elf: Respect error return from `regset->active'

to the 4.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     binfmt_elf-respect-error-return-from-regset-active.patch
and it can be found in the queue-4.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
