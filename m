Received: from mailapp01.imgtec.com ([195.59.15.196]:28409 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6821742AbaE2OlgxC1QY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 May 2014 16:41:36 +0200
Message-ID: <53874719.5070604@imgtec.com>
Date: Thu, 29 May 2014 15:41:29 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/23] MIPS: KVM: Fixes and guest timer rewrite
References: <1401355005-20370-1-git-send-email-james.hogan@imgtec.com> <53870DAD.7050900@redhat.com>
In-Reply-To: <53870DAD.7050900@redhat.com>
Content-Type: multipart/mixed;
        boundary="------------030600020508020608000707"
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
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>, Sanjay Lal <sanjayl@kymasys.com>
Message-ID: <20140529144129.nFrRP8FVOAyeyIKA6LG66-qpjhj5z8Vt12GNuYWFmgc@z>

--------------030600020508020608000707
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit

On 29/05/14 11:36, Paolo Bonzini wrote:
> Il 29/05/2014 11:16, James Hogan ha scritto:
>> Here are a range of MIPS KVM T&E fixes, preferably for v3.16 but I know
>> it's probably a bit late now. Changes are pretty minimal though since
>> v1 so please consider. They can also be found on my kvm_mips_queue
>> branch (and the kvm_mips_timer_v2 tag) here:
>> git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/kvm-mips.git
> 
> That's okay for me, but I'd like to get a look at the QEMU parts.

I'm still in the process of cleaning up my qemu patchset, but the
attached 2 patches hopefully shows the gist of it this particular change.

Thanks
James

> 
> I would also like an Acked-by for patches 2 and 14, and I have a
> question about patch 11.
> 
> Paolo

--------------030600020508020608000707
Content-Type: text/x-patch; name="0001-timer-Add-cpu_get_clock_at.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-timer-Add-cpu_get_clock_at.patch"


--------------030600020508020608000707--
