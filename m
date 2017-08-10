Received: from mail-io0-x22c.google.com ([IPv6:2607:f8b0:4001:c06::22c]:34066
        "EHLO mail-io0-x22c.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993256AbdHJRc3TihYw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 10 Aug 2017 19:32:29 +0200
Received: by mail-io0-x22c.google.com with SMTP id o9so12232142iod.1
        for <linux-mips@linux-mips.org>; Thu, 10 Aug 2017 10:32:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <28ab1c38-f8a7-3fca-7a5a-e44248bec69f@imgtec.com>
References: <1502195022-18161-1-git-send-email-matt.redfearn@imgtec.com>
 <CAGXu5j+nF5sAO=NMLq2Oh2aHJRxGVED93oCH0GK28yU0SXQ=MA@mail.gmail.com> <28ab1c38-f8a7-3fca-7a5a-e44248bec69f@imgtec.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 10 Aug 2017 10:32:22 -0700
Message-ID: <CAGXu5jL_b2-2OFBSKhumag_vViqMFutaZfvpBRWB5L-Gng1zuA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: usercopy: Implement stack frame object validation
Content-Type: text/plain; charset="UTF-8"
Return-Path: <keescook@google.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, LKML <linux-kernel@vger.kernel.org>, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Josh Poimboeuf <jpoimboe@redhat.com>
Message-ID: <20170810173222.bpLnr_fS5GmY-vq7UFYX-SHVTbF2AHWTTbF00z3_C7s@z>

On Thu, Aug 10, 2017 at 1:24 AM, Matt Redfearn <matt.redfearn@imgtec.com> wrote:
> Hi Kees,
>
>
> On 08/08/17 20:11, Kees Cook wrote:
>>
>> On Tue, Aug 8, 2017 at 5:23 AM, Matt Redfearn <matt.redfearn@imgtec.com>
>> wrote:
>>>
>>> This implements arch_within_stack_frames() for MIPS that validates if an
>>> object is wholly contained by a kernel stack frame.
>>>
>>> With CONFIG_HARDENED_USERCOPY enabled, MIPS now passes the LKDTM tests
>>> USERCOPY_STACK_FRAME_TO, USERCOPY_STACK_FRAME_FROM and
>>> USERCOPY_STACK_BEYOND on a Creator Ci40.
>>>
>>> Since the MIPS kernel does not use frame pointers, we re-use the MIPS
>>> kernels stack frame unwinder which uses instruction inspection to deduce
>>> the stack frame size. As such it introduces a larger performance penalty
>>> than on arches which use the frame pointer.
>>
>> Hmm, given x86's plans to drop the frame pointer, I wonder if the
>> inter-frame checking code should be gated by a CONFIG. This (3%) is a
>> rather high performance hit to take for a relatively small protection
>> (it's mainly about catching too-large-reads, since most
>> too-large-writes will be caught by the stack canary).
>>
>> What do you think?
>
>
> If x86 is going to move to a more expensive stack unwinding method than the
> frame pointer then I guess it may end up seeing a similar performance hit to
> what we see on MIPS. In that case it might make sense to add a CONFIG for
> this such that only those who wish to make the trade off of performance for
> the added protection need enable it.

Sounds good. Can you send a v2 that adds a CONFIG, maybe something
like CONFIG_HARDENED_USERCOPY_UNWINDER with a description of the
trade-offs? Then x86 can do this too when it drops frame pointers.

Thanks!

-Kees


-- 
Kees Cook
Pixel Security
