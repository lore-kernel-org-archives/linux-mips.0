Received: from mailapp01.imgtec.com ([195.59.15.196]:21685 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6855066AbaETV3EpomPl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 May 2014 23:29:04 +0200
Message-ID: <537BC837.7030507@imgtec.com>
Date: Tue, 20 May 2014 22:25:11 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/12] kvm tools: Misc patches (mips support)
References: <1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com> <537B3A8E.70801@imgtec.com> <537B966E.9000708@iki.fi>
In-Reply-To: <537B966E.9000708@iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"
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
To: Pekka Enberg <penberg@iki.fi>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20140520212511.IkOlkoy2v5v-izNgU8XQRzsL7KeJbg9glz84Bg-dhMA@z>

On 20/05/14 18:52, Pekka Enberg wrote:
> On 05/20/2014 02:20 PM, James Hogan wrote:
>> I don't know what Pekka's policy is for kvm tools, but to avoid
>> confusion I'd like to make clear that this patchset depends on a KVM
>> implementation (KVM_VM_TYPE==1 for VZ) which hasn't been accepted into
>> the mainline kernel yet.
> 
> Is that something that is likely to end up in mainline Linux in one form
> or another? If yes, we can merge early like we did with arm64.

Very likely yes, and most of the specifics of the MIPS KVM API have
already been pinned down for the trap & emulate KVM support which is in
mainline.

Cheers
James
