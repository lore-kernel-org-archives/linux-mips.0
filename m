Received: from mailapp01.imgtec.com ([195.59.15.196]:12747 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822185AbaETLY54i200 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 May 2014 13:24:57 +0200
Message-ID: <537B3A8E.70801@imgtec.com>
Date: Tue, 20 May 2014 12:20:46 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/12] kvm tools: Misc patches (mips support)
References: <1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
To: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20140520112046.1n6oL8-HlXP3WAlA9q87Nhjqsdd-ApczttPs2vMnd5k@z>

On 19/05/14 17:53, Andreas Herrmann wrote:
> Hi,
> 
> These patches contain changes that I am currently using on top of
> git://github.com/penberg/linux-kvm.git (as of v3.13-rc1-1427-gd9147fb)
> to run lkvm on MIPS.
> 
> The core is David's work for mips support and loading elf binaries.
> 
> I rebased his stuff, rearranged patches somewhat and split out general
> (non-mips-specific) modifications.
> 
> I used it to test a paravirtualized guest on a host running KVM with
> MIPS-VZ (on octeon3).
> 
> Changelog:
> v2:
>  - Removed superfluous includes in tools/kvm/Makefile (mips)
>  - Fixed debug output format for register dump (mips) (when using
>    32-bit lkvm with 64-bit guest)
>  - Added comment for guest type (KVM_VM_TYPE) (mips)
>  - Added check for upper bound of len in hypercall_write_cons (mips)
>  - Modified patch sequence to avoid temporary introduction of
>    load_bzimage (mips)
>  - Added patch to return number of bytes written by term_putc
> v1:
>  - http://marc.info/?i=1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com
> 
> Please apply -- if there are no additional comments or objections.

I don't know what Pekka's policy is for kvm tools, but to avoid
confusion I'd like to make clear that this patchset depends on a KVM
implementation (KVM_VM_TYPE==1 for VZ) which hasn't been accepted into
the mainline kernel yet.

Cheers
James
