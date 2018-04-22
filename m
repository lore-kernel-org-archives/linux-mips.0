Received: from mail.linuxfoundation.org ([140.211.169.12]:43982 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993251AbeDVJSGdTih9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 22 Apr 2018 11:18:06 +0200
Subject: Patch "MIPS: memset.S: Fix return of __clear_user from Lpartial_fixup" has been added to the 4.16-stable tree
From: <gregkh@linuxfoundation.org>
Date: Sun, 22 Apr 2018 11:16:38 +0200
Message-ID: <1524388598219147@kroah.com>
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
To: gregkh@linuxfoundation.org, jhogan@kernel.org, linux-mips@linux-mips.org, matt.redfearn@mips.com, ralf@linux-mips.org
Cc: stable-commits@vger.kernel.org
Message-ID: <20180422091638.7ag5vPEX-hu3INvhtcFFkXreVrrphiENZX43bJ2Ao_g@z>


This is a note to let you know that I've just added the patch titled

    MIPS: memset.S: Fix return of __clear_user from Lpartial_fixup

to the 4.16-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-memset.s-fix-return-of-__clear_user-from-lpartial_fixup.patch
and it can be found in the queue-4.16 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
