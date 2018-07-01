Received: from mail.linuxfoundation.org ([140.211.169.12]:38526 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992066AbeGALk1AeUp1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 1 Jul 2018 13:40:27 +0200
Subject: Patch "MIPS: io: Add barrier after register read in inX()" has been added to the 4.9-stable tree
From: <gregkh@linuxfoundation.org>
Date: Sun, 01 Jul 2018 13:39:20 +0200
Message-ID: <153044516015440@kroah.com>
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
To: chenhc@lemote.com, chenhuacai@gmail.com, gregkh@linuxfoundation.org, james.hogan@mips.com, linux-mips@linux-mips.org, paul.burton@mips.com, wuzhangjin@gmail.com, zhangfx@lemote.com
Cc: stable-commits@vger.kernel.org
Message-ID: <20180701113920._oG3MGmSYKIVHIEx2i-3PE1THEyV6Tvt_PaARrAnVU8@z>


This is a note to let you know that I've just added the patch titled

    MIPS: io: Add barrier after register read in inX()

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-io-add-barrier-after-register-read-in-inx.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
