Received: from mailapp01.imgtec.com ([195.59.15.196]:18747 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6817913AbaE2KzsH7ghQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 May 2014 12:55:48 +0200
Message-ID: <5387122C.2080203@imgtec.com>
Date: Thu, 29 May 2014 11:55:40 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 11/23] MIPS: KVM: Fix timer race modifying guest CP0_Cause
References: <1401355005-20370-1-git-send-email-james.hogan@imgtec.com> <1401355005-20370-12-git-send-email-james.hogan@imgtec.com> <53870D99.3030900@redhat.com>
In-Reply-To: <53870D99.3030900@redhat.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Sanjay Lal <sanjayl@kymasys.com>
Message-ID: <20140529105540.fRO7B7TGMwHRkBW9L9oOyzxAee8Zi4L10mENKmIWeR8@z>

Hi Paolo,

On 29/05/14 11:36, Paolo Bonzini wrote:
> Il 29/05/2014 11:16, James Hogan ha scritto:
>> Currently this is the only asynchronous modification of guest registers,
>> therefore it is fixed by adjusting the implementations of the
>> kvm_set_c0_guest_cause(), kvm_clear_c0_guest_cause(), and
>> kvm_change_c0_guest_cause() macros which are used for modifying the
>> guest CP0_Cause register to use ll/sc to ensure atomic modification.
> 
> Shouldn't you have a loop too around the ll/sc?

Yes, it has a do {} while () look around the inline asm, although I
didn't mention it in the commit message. It's modelled on
arch/mips/include/asm/bitops.h.

Cheers
James
