Received: from mail.linuxfoundation.org ([140.211.169.12]:46859 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993225AbcHRJrINJkKP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Aug 2016 11:47:08 +0200
Subject: Patch "[PATCH BACKPORT 3.10-3.15 4/4] MIPS: KVM: Propagate kseg0/mapped tlb fault errors" has been added to the 3.14-stable tree
From: <gregkh@linuxfoundation.org>
Date: Thu, 18 Aug 2016 11:47:01 +0200
In-Reply-To: <f985ed835cfcabe5c7f313abd1de1bb3ee8737f9.1471021142.git-series.james.hogan@imgtec.com>
Message-ID: <147151362112175@kroah.com>
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
To: james.hogan@imgtec.com, gregkh@linuxfoundation.org, kvm@vger.kernel.org, linux-mips@linux-mips.org, pbonzini@redhat.com, ralf@linux-mips.org, rkrcmar@redhat.com, stable@vger.kernel.org
Cc: stable-commits@vger.kernel.org
Message-ID: <20160818094701.B8WEBkka4mKgFrZ1EGOAmv4EsqDalYwkCEm2noYwgtM@z>


This is a note to let you know that I've just added the patch titled

    [PATCH BACKPORT 3.10-3.15 4/4] MIPS: KVM: Propagate kseg0/mapped tlb fault errors

to the 3.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-kvm-propagate-kseg0-mapped-tlb-fault-errors.patch
and it can be found in the queue-3.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
