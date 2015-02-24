Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.229]:45622 "EHLO
        cdptpa-oedge-vip.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27007119AbbBXOKDk7UCi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Feb 2015 15:10:03 +0100
Date: Tue, 24 Feb 2015 09:10:49 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] MIPS: KVM: Fix trace event to save PC directly
Message-ID: <20150224091049.0f3d65f6@grimm.local.home>
In-Reply-To: <1424778380-28036-1-git-send-email-james.hogan@imgtec.com>
References: <1424778380-28036-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <rostedt@goodmis.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-mips@linux-mips.org, kvm@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20150224141049.7LJ4lo2h0qlXJ60FJg8TTRNIzLukx8j4T9pirckuojo@z>

On Tue, 24 Feb 2015 11:46:20 +0000
James Hogan <james.hogan@imgtec.com> wrote:


> Lets save the actual PC in the structure so that the correct value is
> accessible later.
> 
> Fixes: 669e846e6c4e ("KVM/MIPS32: MIPS arch specific APIs for KVM")
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Cc: Gleb Natapov <gleb@kernel.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: linux-mips@linux-mips.org
> Cc: kvm@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v3.10+
> ---
>  arch/mips/kvm/trace.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
>
