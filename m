Received: from mail.linuxfoundation.org ([140.211.169.12]:43792 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992279AbeGZOw0VvkBQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Jul 2018 16:52:26 +0200
Subject: Patch "MIPS: Fix off-by-one in pci_resource_to_user()" has been added to the 4.9-stable tree
From: <gregkh@linuxfoundation.org>
Date: Thu, 26 Jul 2018 16:52:07 +0200
Message-ID: <1532616726119137@kroah.com>
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
To: gregkh@linuxfoundation.org, jhogan@kernel.org, linux-mips@linux-mips.org, paul.burton@mips.com, ralf@linux-mips.org, rui.wang@windriver.com, wg@grandegger.com
Cc: stable-commits@vger.kernel.org
Message-ID: <20180726145207.uJxHxU6kuh_1m3lgh6H3uorktQQx6Qy34ikDhFeRsYQ@z>


This is a note to let you know that I've just added the patch titled

    MIPS: Fix off-by-one in pci_resource_to_user()

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-fix-off-by-one-in-pci_resource_to_user.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
