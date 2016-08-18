Received: from mail.linuxfoundation.org ([140.211.169.12]:46881 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993254AbcHRJr3pZYPP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Aug 2016 11:47:29 +0200
Subject: Patch "[PATCH BACKPORT 3.17-4.4 3/4] MIPS: KVM: Fix gfn range check in kseg0 tlb faults" has been added to the 4.4-stable tree
From: <gregkh@linuxfoundation.org>
Date: Thu, 18 Aug 2016 11:47:22 +0200
In-Reply-To: <2c09ac935cd3721a0212d82eca7f9290481d5b4c.1471018436.git-series.james.hogan@imgtec.com>
Message-ID: <14715136428861@kroah.com>
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
Message-ID: <20160818094722.k1eevsZ9HnTtQ3d9UPKbQftQQRiq97nbaKrC5CjvCBA@z>


This is a note to let you know that I've just added the patch titled

    [PATCH BACKPORT 3.17-4.4 3/4] MIPS: KVM: Fix gfn range check in kseg0 tlb faults

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-kvm-fix-gfn-range-check-in-kseg0-tlb-faults.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.
