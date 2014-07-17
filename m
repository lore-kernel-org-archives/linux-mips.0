Received: from mail-lb0-f176.google.com ([209.85.217.176]:54550 "EHLO
        mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6860088AbaGQVkMnCs0k (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Jul 2014 23:40:12 +0200
Received: by mail-lb0-f176.google.com with SMTP id u10so1977838lbd.35
        for <linux-mips@linux-mips.org>; Thu, 17 Jul 2014 14:40:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53C48986.5010109@oracle.com>
References: <1405017631-27346-1-git-send-email-keescook@chromium.org>
 <20140711164931.GA18473@redhat.com> <CAGXu5jK-x0=Rr7kX2a=b4Z8ueA77uwmhNZZAayG8cwmNOKa8Ug@mail.gmail.com>
 <CAGXu5jJJsiTxxn5UijkBz7jpWgqg01BS=Zc0WbHXbs0vH_xPMQ@mail.gmail.com> <53C48986.5010109@oracle.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 17 Jul 2014 14:39:46 -0700
Message-ID: <CALCETrUf-Tei+R32SR-KKLD50zWa89Vrfu4S4uZ+4jh4eEFOdg@mail.gmail.com>
Subject: Re: [PATCH v10 0/11] seccomp: add thread sync ability
Content-Type: text/plain; charset=UTF-8
Return-Path: <luto@amacapital.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Morris <james.l.morris@oracle.com>
Cc: Kees Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, LKML <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@plumgrid.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Daniel Borkmann <dborkman@redhat.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, David Drysdale <drysdale@google.com>, Linux API <linux-api@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linux-arch <linux-arch@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
Message-ID: <20140717213946.birW0wMwWV-VluODrXgAk-rrOMyKBO2M6p7IJ0gtIHk@z>

On Mon, Jul 14, 2014 at 6:53 PM, James Morris <james.l.morris@oracle.com> wrote:
> On 07/15/2014 04:59 AM, Kees Cook wrote:
>>
>> Hi James,
>>
>> Is this series something you would carry in the security-next tree?
>> That has traditionally been where seccomp features have landed in the
>> past.
>>
>> -Kees
>>
>>
>> On Fri, Jul 11, 2014 at 10:55 AM, Kees Cook <keescook@chromium.org> wrote:
>>>
>>> On Fri, Jul 11, 2014 at 9:49 AM, Oleg Nesterov <oleg@redhat.com> wrote:
>>>>
>>>> On 07/10, Kees Cook wrote:
>>>>>
>>>>>
>>>>> This adds the ability for threads to request seccomp filter
>>>>> synchronization across their thread group (at filter attach time).
>>>>> For example, for Chrome to make sure graphic driver threads are fully
>>>>> confined after seccomp filters have been attached.
>>>>>
>>>>> To support this, locking on seccomp changes via thread-group-shared
>>>>> sighand lock is introduced, along with refactoring of no_new_privs.
>>>>> Races
>>>>> with thread creation are handled via delayed duplication of the seccomp
>>>>> task struct field and cred_guard_mutex.
>>>>>
>>>>> This includes a new syscall (instead of adding a new prctl option),
>>>>> as suggested by Andy Lutomirski and Michael Kerrisk.
>>>>
>>>>
>>>> I do not not see any problems in this version,
>>>
>>>
>>> Awesome! Thank you for all the reviews. :) If Andy and Michael are
>>> happy with this too, I think this is in good shape. \o/
>>>
>>> -Kees
>>>
>>>>
>>>> Reviewed-by: Oleg Nesterov <oleg@redhat.com>
>>>>
>>>
>>>
>>>
>>> --
>>> Kees Cook
>>> Chrome OS Security
>>
>>
>>
>>
>
> Yep, certainly.
>

Any ETA?  I'm currently blocking on having stable commit hashes for these.

If you're planning on pulling from Kees' tree instead of importing the
patches, I can work with that, too.

Thanks,
Andy
