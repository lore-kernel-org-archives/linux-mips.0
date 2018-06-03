Received: from mail.kernel.org ([198.145.29.99]:50174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992692AbeFCIiuRxMca (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 3 Jun 2018 10:38:50 +0200
Subject: Patch "MIPS: prctl: Disallow FRE without FR with PR_SET_FP_MODE requests" has been added to the 4.16-stable tree
From: <gregkh@linuxfoundation.org>
Date: Sun, 03 Jun 2018 10:37:43 +0200
Message-ID: <152801506315045@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-Path: <SRS0=GHQf=IV=linuxfoundation.org=gregkh@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: gregkh@linuxfoundation.org, jhogan@kernel.org, linux-mips@linux-mips.org, macro@mips.com, ralf@linux-mips.org
Cc: stable-commits@vger.kernel.org
Message-ID: <20180603083743.ZfOw6UPpX8m9c3SmpCqm-VNRFMmT08P8NZRbiLL2ByU@z>


This is a note to let you know that I've just added the patch titled

    MIPS: prctl: Disallow FRE without FR with PR_SET_FP_MODE requests

to the 4.16-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-prctl-disallow-fre-without-fr-with-pr_set_fp_mode-requests.patch
and it can be found in the queue-4.16 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
