Received: from mail-ob0-f178.google.com ([209.85.214.178]:48654 "EHLO
        mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6859996AbaFKWc4sBV0y (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 12 Jun 2014 00:32:56 +0200
Received: by mail-ob0-f178.google.com with SMTP id wn1so466418obc.9
        for <linux-mips@linux-mips.org>; Wed, 11 Jun 2014 15:32:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALCETrWaQZc124=6r4h+fTAY4H4LzWGFw=MB7KY5TBtB0jx9hA@mail.gmail.com>
References: <cover.1402517933.git.luto@amacapital.net>
        <9e11cd988a0f120606e37b5e275019754e2774da.1402517933.git.luto@amacapital.net>
        <CAADnVQKt5FnShkZeQewbfnU1kHM-gLs3hCZMf5xcgFzyRDLX7A@mail.gmail.com>
        <CALCETrXoqqKC=T5Wvj+CDYQFte1s_=npDvQ2UYW0j=AanEgR1g@mail.gmail.com>
        <5398D59A.3030900@zytor.com>
        <CALCETrVMxkHcPXsEGtEc0Pr=Z80CzC0zWaQ9OdVdxi1CGuB4kQ@mail.gmail.com>
        <5398D7B4.5000303@zytor.com>
        <CALCETrWaQZc124=6r4h+fTAY4H4LzWGFw=MB7KY5TBtB0jx9hA@mail.gmail.com>
Date: Wed, 11 Jun 2014 15:32:49 -0700
Message-ID: <CAGXu5jL86C1yvWynBrp20CxT9COorc5++nT6OhwYCwqc7UJyHg@mail.gmail.com>
Subject: Re: [RFC 5/5] x86,seccomp: Add a seccomp fastpath
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
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
To: Andy Lutomirski <luto@amacapital.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Drewry <wad@chromium.org>, Oleg Nesterov <oleg@redhat.com>, X86 ML <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linux-arch <linux-arch@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>
Message-ID: <20140611223249.dBpys98bwkVE1OdfrtRyrXIJ13TwF5qUreatQNXppD4@z>

On Wed, Jun 11, 2014 at 3:28 PM, Andy Lutomirski <luto@amacapital.net> wrote:
> On Wed, Jun 11, 2014 at 3:27 PM, H. Peter Anvin <hpa@zytor.com> wrote:
>> On 06/11/2014 03:22 PM, Andy Lutomirski wrote:
>>> On Wed, Jun 11, 2014 at 3:18 PM, H. Peter Anvin <hpa@zytor.com> wrote:
>>>> On 06/11/2014 02:56 PM, Andy Lutomirski wrote:
>>>>>
>>>>> 13ns is with the simplest nonempty filter.  I hope that empty filters
>>>>> don't work.
>>>>>
>>>>
>>>> Why wouldn't they?
>>>
>>> Is it permissible to fall off the end of a BPF program?  I'm getting
>>> EINVAL trying to install an actual empty filter.  The filter I tested
>>> with was:
>>>
>>
>> What I meant was that there has to be a well-defined behavior for the
>> program falling off the end anyway, and that that should be preserved.
>>
>> I guess it is possible to require that all code paths must provably
>> reach a termination point.
>>
>
> Dunno.  I haven't ever touched any of the actual BPF code.  This whole
> patchset only changes the code that invokes the BPF evaluator.

Yes, this is how BPF works: runs to the end or exit early. With
seccomp BPF specifically, the return value defaults to kill the
process. If a filter was missing (NULL), or empty, or didn't
explicitly return with a new value, the default (kill) should be
taken.

-Kees

-- 
Kees Cook
Chrome OS Security
