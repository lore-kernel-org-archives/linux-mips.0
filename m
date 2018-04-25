Received: from mail.linuxfoundation.org ([140.211.169.12]:42400 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990427AbeDYQB6S06ZB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Apr 2018 18:01:58 +0200
Subject: Patch "OF: Prevent unaligned access in of_alias_scan()" has been added to the 4.9-stable tree
From: <gregkh@linuxfoundation.org>
Date: Wed, 25 Apr 2018 18:01:26 +0200
Message-ID: <1524672086190221@kroah.com>
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
To: amit.pundir@linaro.org, frowand.list@gmail.com, grant.likely@secretlab.ca, gregkh@linuxfoundation.org, linux-mips@linux-mips.org, paul.burton@imgtec.com, ralf@linux-mips.org, robh@kernel.org
Cc: stable-commits@vger.kernel.org
Message-ID: <20180425160126.x6I8LOPNFXzGXiXIHXHvrJpsPxlhRcn6_iHp-7B8LlQ@z>


This is a note to let you know that I've just added the patch titled

    OF: Prevent unaligned access in of_alias_scan()

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     of-prevent-unaligned-access-in-of_alias_scan.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
