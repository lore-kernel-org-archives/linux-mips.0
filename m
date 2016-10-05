Received: from mailapp02.imgtec.com ([217.156.133.132]:33398 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990557AbcJEGKQok4St (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 5 Oct 2016 08:10:16 +0200
Subject: Re: [PATCH 1/2] MIPS: tracing: move insn_has_delay_slot to a shared
 header
References: <1475228026-25831-1-git-send-email-marcin.nowakowski@imgtec.com>
 <20161004231809.GC14676@linux-mips.org>
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <205d3e96-0dc2-ba59-43da-dff1cde17a7a@imgtec.com>
Date: Wed, 5 Oct 2016 08:10:09 +0200
MIME-Version: 1.0
In-Reply-To: <20161004231809.GC14676@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20161005061009.wJYn6nDllcuKE_5GLgPFtmKSlqyMHGFd8rxSqKtvH6Q@z>

On 05.10.2016 01:18, Ralf Baechle wrote:
> On Fri, Sep 30, 2016 at 11:33:45AM +0200, Marcin Nowakowski wrote:
>
>> Currently both kprobes and uprobes code have definitions of the
>> insn_has_delay_slot method. Move it to a separate header as an inline
>> method that each probe-specific method can later use.
>> No functional change intended, although the methods slightly varied in
>> the constraints they set for the methods - the uprobes one was chosen as
>> it is slightly more specific when filtering opcode fields.
>
> Applied - but this is way to big for an inline function and will end up
> getting expanded two times in uprobes.c for no good reason.  I think this
> function should become go to something like arch/mips/kernel/branch.c -
> or maybe a helper library like arch/mips/lib/bdelay.c.
>
>   Ralf
>

Well - that's the behaviour my change hasn't modified.
But I agree that it may be better to simply make it a library function 
that could be used everywhere. The main reason I didn't do it in the 
first place was to keep the implementation in kprobes in __kprobes 
section like the original code did, but I guess it won't do any harm for 
the code that is used in the uprobes path to exist in the kprobe section 
as well?

It's probably not the last change in this area yet so I'll keep this in 
mind and will update later.

Marcin
