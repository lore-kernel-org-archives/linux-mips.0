Received: from mail.linuxfoundation.org ([140.211.169.12]:39860 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992482AbeIXLNLX8ApU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Sep 2018 13:13:11 +0200
Subject: Patch "MIPS: VDSO: Match data page cache colouring when D$ aliases" has been added to the 4.9-stable tree
From: <gregkh@linuxfoundation.org>
Date: Mon, 24 Sep 2018 13:12:21 +0200
Message-ID: <15377875418012@kroah.com>
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
To: alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org, hauke@hauke-m.de, jhogan@kernel.org, linux-mips@linux-mips.org, paul.burton@mips.com, rene.nielsen@microsemi.com
Cc: stable-commits@vger.kernel.org
Message-ID: <20180924111221.5l2yJb8f3EB-4ttmvCQ7zuOpkm9bURI_WmBBfXI6T5E@z>


This is a note to let you know that I've just added the patch titled

    MIPS: VDSO: Match data page cache colouring when D$ aliases

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-vdso-match-data-page-cache-colouring-when-d-aliases.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
