Received: from mail.linuxfoundation.org ([140.211.169.12]:52958 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993946AbeIPNjoF7MHZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 16 Sep 2018 15:39:44 +0200
Subject: Patch "kthread: fix boot hang (regression) on MIPS/OpenRISC" has been added to the 3.18-stable tree
From: <gregkh@linuxfoundation.org>
Date: Sun, 16 Sep 2018 15:39:26 +0200
Message-ID: <1537105166225203@kroah.com>
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
To: amit.pundir@linaro.org, gregkh@linuxfoundation.org, jamie.iles@oracle.com, jonas@southpole.se, linux-mips@linux-mips.org, linux@roeck-us.net, oleg@redhat.com, openrisc@lists.librecores.org, ralf@linux-mips.org, shorne@gmail.com, stefan.kristiansson@saunalahti.fi, tglx@linutronix.de, torvalds@linux-foundation.org, vegard.nossum@oracle.com
Cc: stable-commits@vger.kernel.org
Message-ID: <20180916133926.IYZsG-zkBdQqldP3vYmZCcE5XObsJmcEKx9eunbim3Q@z>


This is a note to let you know that I've just added the patch titled

    kthread: fix boot hang (regression) on MIPS/OpenRISC

to the 3.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kthread-fix-boot-hang-regression-on-mips-openrisc.patch
and it can be found in the queue-3.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
