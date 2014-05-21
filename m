Received: from mail-bl2lp0204.outbound.protection.outlook.com ([207.46.163.204]:20354
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6822270AbaEUHbvKvECy (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 May 2014 09:31:51 +0200
Date: Wed, 21 May 2014 09:30:05 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 09/15] MIPS: Add functions for hypervisor call
Message-ID: <20140521073005.GE11800@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-10-git-send-email-andreas.herrmann@caviumnetworks.com>
 <3231132.Bvkfloh7jN@radagast>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <3231132.Bvkfloh7jN@radagast>
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
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140521073005.dA27KMj_6gxmftMVDE_nESpgI4rNmamanRKCXhBjkKQ@z>

On Wed, May 21, 2014 at 01:16:30AM +0100, James Hogan wrote:
> On Tuesday 20 May 2014 16:47:10 Andreas Herrmann wrote:
> > From: David Daney <david.daney@cavium.com>
> > 
> > Signed-off-by: David Daney <david.daney@cavium.com>
> > Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>

> These look similar to the kvm_hypercall${n} functions in
> arch/{x86,s390}/include/asm/kvm_para.h. Does it make sense to define
> that API in kvm_para.h for MIPS instead of this one?

Yes, the functions should be moved to a separate header.


Andreas
