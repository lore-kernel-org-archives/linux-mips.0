Received: from mail.linuxfoundation.org ([140.211.169.12]:40754 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990945AbeGMMXeNCV0E (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Jul 2018 14:23:34 +0200
Subject: Patch "MIPS: Fix ioremap() RAM check" has been added to the 4.14-stable tree
From: <gregkh@linuxfoundation.org>
Date: Fri, 13 Jul 2018 14:22:26 +0200
Message-ID: <15314845469970@kroah.com>
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
To: fancer.lancer@gmail.com, gregkh@linuxfoundation.org, jhogan@kernel.org, linux-mips@linux-mips.org, paul.burton@mips.com, ralf@linux-mips.org
Cc: stable-commits@vger.kernel.org
Message-ID: <20180713122226.PmzFMpp6qA15D-h1oiGwPvFmWXWvDIoGaKV_nmciogs@z>


This is a note to let you know that I've just added the patch titled

    MIPS: Fix ioremap() RAM check

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-fix-ioremap-ram-check.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
