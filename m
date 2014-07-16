Received: from mail-ig0-f173.google.com ([209.85.213.173]:41758 "EHLO
        mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6861357AbaGPV50YzEeS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Jul 2014 23:57:26 +0200
Received: by mail-ig0-f173.google.com with SMTP id h18so4902706igc.12
        for <linux-mips@linux-mips.org>; Wed, 16 Jul 2014 14:57:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALCETrWuWxZANoKAR=FG55EOHtzvTHmc3euMdtf8yfibtK-QYw@mail.gmail.com>
References: <cover.1405452484.git.luto@amacapital.net>
        <bd4e2efb7cd97f2bf9d4f1e2065f16c9091d799a.1405452484.git.luto@amacapital.net>
        <CAGXu5jJornzMJjyPXVZB_eYi-FRet=bXcJWJDa1vnB_oU9ZA_Q@mail.gmail.com>
        <CALCETrWuWxZANoKAR=FG55EOHtzvTHmc3euMdtf8yfibtK-QYw@mail.gmail.com>
Date: Wed, 16 Jul 2014 14:57:20 -0700
Message-ID: <CAGXu5jLcbWDJiLbpejJTERbV2CkCk2dVZ7jwq7Xw_jYUicBFjQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] x86: Split syscall_trace_enter into two phases
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
Cc: LKML <linux-kernel@vger.kernel.org>, Will Drewry <wad@chromium.org>, James Morris <james.l.morris@oracle.com>, Oleg Nesterov <oleg@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linux-arch <linux-arch@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, Alexei Starovoitov <ast@plumgrid.com>
Message-ID: <20140716215720.0kF4XwO-O4mZBngPgzdX8QQ927Ig1HEs7bU_2i4o4zc@z>

On Wed, Jul 16, 2014 at 2:15 PM, Andy Lutomirski <luto@amacapital.net> wrote:
> On Wed, Jul 16, 2014 at 1:21 PM, Kees Cook <keescook@chromium.org> wrote:
>> On Tue, Jul 15, 2014 at 12:32 PM, Andy Lutomirski <luto@amacapital.net> wrote:
>>>
>>> +
>>> +               ret = seccomp_phase1(&sd);
>>> +               if (ret == SECCOMP_PHASE1_SKIP) {
>>> +                       regs->orig_ax = -ENOSYS;
>>
>> Before, seccomp didn't touch orig_ax on a skip. I don't see any
>> problem with this, and it's probably more clear this way, but are you
>> sure there aren't unexpected side-effects from this?
>
> It's necessary to cause the syscall to be skipped -- see syscall_trace_enter.
>
> That being said, setting it to -ENOSYS is nonsense and probably
> confused you at least as much as it confused me.  It should be
> regs->orig_ax = -1.

Yes, I think that would be better.

-Kees

-- 
Kees Cook
Chrome OS Security
