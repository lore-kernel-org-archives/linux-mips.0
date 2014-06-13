Received: from mail-ie0-f182.google.com ([209.85.223.182]:36747 "EHLO
        mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6834695AbaFMQ3cvBqhY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Jun 2014 18:29:32 +0200
Received: by mail-ie0-f182.google.com with SMTP id rp18so2685643iec.41
        for <linux-mips@linux-mips.org>; Fri, 13 Jun 2014 09:29:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGXu5jL86C1yvWynBrp20CxT9COorc5++nT6OhwYCwqc7UJyHg@mail.gmail.com>
References: <cover.1402517933.git.luto@amacapital.net>
        <9e11cd988a0f120606e37b5e275019754e2774da.1402517933.git.luto@amacapital.net>
        <CAADnVQKt5FnShkZeQewbfnU1kHM-gLs3hCZMf5xcgFzyRDLX7A@mail.gmail.com>
        <CALCETrXoqqKC=T5Wvj+CDYQFte1s_=npDvQ2UYW0j=AanEgR1g@mail.gmail.com>
        <5398D59A.3030900@zytor.com>
        <CALCETrVMxkHcPXsEGtEc0Pr=Z80CzC0zWaQ9OdVdxi1CGuB4kQ@mail.gmail.com>
        <5398D7B4.5000303@zytor.com>
        <CALCETrWaQZc124=6r4h+fTAY4H4LzWGFw=MB7KY5TBtB0jx9hA@mail.gmail.com>
        <CAGXu5jL86C1yvWynBrp20CxT9COorc5++nT6OhwYCwqc7UJyHg@mail.gmail.com>
Date: Fri, 13 Jun 2014 11:29:26 -0500
Message-ID: <CABqD9hbgPCSgXNCOreSV3b+yBsO9fLYtYr-ShtfOoH=uZEYa3w@mail.gmail.com>
Subject: Re: [RFC 5/5] x86,seccomp: Add a seccomp fastpath
From: Will Drewry <wad@chromium.org>
Content-Type: text/plain; charset=UTF-8
Return-Path: <wad@chromium.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kees Cook <keescook@chromium.org>
Cc: Andy Lutomirski <luto@amacapital.net>, "H. Peter Anvin" <hpa@zytor.com>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, X86 ML <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linux-arch <linux-arch@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>
Message-ID: <20140613162926.8-viGMnS3BMldRV8oNUbhKVSpYsV-NSFNx9zmyo3qgk@z>

On Wed, Jun 11, 2014 at 5:32 PM, Kees Cook <keescook@chromium.org> wrote:
> On Wed, Jun 11, 2014 at 3:28 PM, Andy Lutomirski <luto@amacapital.net> wrote:
>> On Wed, Jun 11, 2014 at 3:27 PM, H. Peter Anvin <hpa@zytor.com> wrote:
>>> On 06/11/2014 03:22 PM, Andy Lutomirski wrote:
>>>> On Wed, Jun 11, 2014 at 3:18 PM, H. Peter Anvin <hpa@zytor.com> wrote:
>>>>> On 06/11/2014 02:56 PM, Andy Lutomirski wrote:
>>>>>>
>>>>>> 13ns is with the simplest nonempty filter.  I hope that empty filters
>>>>>> don't work.
>>>>>>
>>>>>
>>>>> Why wouldn't they?
>>>>
>>>> Is it permissible to fall off the end of a BPF program?  I'm getting
>>>> EINVAL trying to install an actual empty filter.  The filter I tested
>>>> with was:
>>>>
>>>
>>> What I meant was that there has to be a well-defined behavior for the
>>> program falling off the end anyway, and that that should be preserved.
>>>
>>> I guess it is possible to require that all code paths must provably
>>> reach a termination point.
>>>
>>
>> Dunno.  I haven't ever touched any of the actual BPF code.  This whole
>> patchset only changes the code that invokes the BPF evaluator.
>
> Yes, this is how BPF works: runs to the end or exit early. With
> seccomp BPF specifically, the return value defaults to kill the
> process. If a filter was missing (NULL), or empty, or didn't
> explicitly return with a new value, the default (kill) should be
> taken.

Yup - this is just a property of BPF (and a nice one :)

On seccomp_attach_filter this check fires:
  if (fprog->len == 0 || fprog->len > BPF_MAXINSNS)
    return -EINVAL;

As well as in sk_chk_filter:
  if (flen == 0 || flen > BPF_MAXINSNS)
    return -EINVAL;

And:
  /* last instruction must be a RET code */
  switch (filter[flen - 1].code) {
    case BPF_S_RET_K:
    case BPF_S_RET_A:
      return check_load_and_stores(filter, flen);
  }

cheers!
will
