Received: from mail.kernel.org ([198.145.29.99]:49468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993928AbeFQL1RU-3DV (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 17 Jun 2018 13:27:17 +0200
Subject: Patch "MIPS: io: Add barrier after register read in readX()" has been added to the 3.18-stable tree
From: <gregkh@linuxfoundation.org>
Date: Sun, 17 Jun 2018 13:22:52 +0200
Message-ID: <152923457223822@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-Path: <SRS0=nXdS=JD=linuxfoundation.org=gregkh@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: alexander.levin@microsoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, jhogan@kernel.org, linux-mips@linux-mips.org, okaya@codeaurora.org, paul.burton@mips.com, ralf@linux-mips.org
Cc: stable-commits@vger.kernel.org
Message-ID: <20180617112252.7618W63wSOPUQ02qKvvI8aN8ynPXTQno0FjQCMFxdI4@z>


This is a note to let you know that I've just added the patch titled

    MIPS: io: Add barrier after register read in readX()

to the 3.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-io-add-barrier-after-register-read-in-readx.patch
and it can be found in the queue-3.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
