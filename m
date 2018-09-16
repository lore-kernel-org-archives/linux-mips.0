Received: from mail.linuxfoundation.org ([140.211.169.12]:49162 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992328AbeIPMdZu6slN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 16 Sep 2018 14:33:25 +0200
Subject: Patch "MIPS: VDSO: Match data page cache colouring when D$ aliases" has been added to the 4.18-stable tree
From: <gregkh@linuxfoundation.org>
Date: Sun, 16 Sep 2018 14:31:35 +0200
Message-ID: <15371010957298@kroah.com>
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
Message-ID: <20180916123135.1FxoMjdtCwzF1uQKqvO5L7aJUVbjbIlyA02v7LAxgLs@z>


This is a note to let you know that I've just added the patch titled

    MIPS: VDSO: Match data page cache colouring when D$ aliases

to the 4.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-vdso-match-data-page-cache-colouring-when-d-aliases.patch
and it can be found in the queue-4.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
