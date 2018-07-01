Received: from mail.linuxfoundation.org ([140.211.169.12]:38182 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992554AbeGALjETQIz1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 1 Jul 2018 13:39:04 +0200
Subject: Patch "time: Make sure jiffies_to_msecs() preserves non-zero time periods" has been added to the 4.14-stable tree
From: <gregkh@linuxfoundation.org>
Date: Sun, 01 Jul 2018 13:38:26 +0200
Message-ID: <15304451069450@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
To: 20180622143357.7495-1-geert@linux-m68k.org, arnd@arndb.degeert@linux-m68k.org, gregkh@linuxfoundation.org, john.stultz@linaro.org, linux-mips@linux-mips.org, sboyd@kernel.org, tglx@linutronix.de
Cc: stable-commits@vger.kernel.org
Message-ID: <20180701113826.-BUhmt3FpJrvR1tUtVVPbuZgP-sWB3Zr_NjLUi1OpsA@z>


This is a note to let you know that I've just added the patch titled

    time: Make sure jiffies_to_msecs() preserves non-zero time periods

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     time-make-sure-jiffies_to_msecs-preserves-non-zero-time-periods.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
