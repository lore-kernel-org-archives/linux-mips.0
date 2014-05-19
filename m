Received: from mail-bn1blp0184.outbound.protection.outlook.com ([207.46.163.184]:51769
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6825887AbaESQyJqTO4W (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 19 May 2014 18:54:09 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 00/12] kvm tools: Misc patches (mips support)
Date: Mon, 19 May 2014 18:53:19 +0200
Message-ID: <1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20140519165319.8mDf63bb5VSZbNC9pLkuXpKj3aL7O1Kw0A4rq-hvwjg@z>

Hi,

These patches contain changes that I am currently using on top of
git://github.com/penberg/linux-kvm.git (as of v3.13-rc1-1427-gd9147fb)
to run lkvm on MIPS.

The core is David's work for mips support and loading elf binaries.

I rebased his stuff, rearranged patches somewhat and split out general
(non-mips-specific) modifications.

I used it to test a paravirtualized guest on a host running KVM with
MIPS-VZ (on octeon3).

Changelog:
v2:
 - Removed superfluous includes in tools/kvm/Makefile (mips)
 - Fixed debug output format for register dump (mips) (when using
   32-bit lkvm with 64-bit guest)
 - Added comment for guest type (KVM_VM_TYPE) (mips)
 - Added check for upper bound of len in hypercall_write_cons (mips)
 - Modified patch sequence to avoid temporary introduction of
   load_bzimage (mips)
 - Added patch to return number of bytes written by term_putc
v1:
 - http://marc.info/?i=1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com

Please apply -- if there are no additional comments or objections.


Thanks,

Andreas
