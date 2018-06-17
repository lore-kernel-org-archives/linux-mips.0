Received: from mail.kernel.org ([198.145.29.99]:57388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993961AbeFQLczi3KQV (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 17 Jun 2018 13:32:55 +0200
Subject: Patch "MIPS: io: Prevent compiler reordering writeX()" has been added to the 4.14-stable tree
From: <gregkh@linuxfoundation.org>
Date: Sun, 17 Jun 2018 13:23:25 +0200
Message-ID: <152923460525046@kroah.com>
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
Message-ID: <20180617112325.sb-eWTr6PEPWf_fGwvrhvMo3-IU9HMP9OkjEhZqkBQs@z>


This is a note to let you know that I've just added the patch titled

    MIPS: io: Prevent compiler reordering writeX()

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-io-prevent-compiler-reordering-writex.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
