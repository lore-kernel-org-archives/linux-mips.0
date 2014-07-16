Received: from mail-ie0-f171.google.com ([209.85.223.171]:33359 "EHLO
        mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6861102AbaGPSXRoVL8J (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Jul 2014 20:23:17 +0200
Received: by mail-ie0-f171.google.com with SMTP id at1so1156382iec.30
        for <linux-mips@linux-mips.org>; Wed, 16 Jul 2014 11:23:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALCETrVXgA9a2f7VwnCYW4_XB+JAPRSR8xsuH_ZYbA82=ZozRw@mail.gmail.com>
References: <1405017631-27346-1-git-send-email-keescook@chromium.org>
        <20140711164931.GA18473@redhat.com>
        <CAGXu5jK-x0=Rr7kX2a=b4Z8ueA77uwmhNZZAayG8cwmNOKa8Ug@mail.gmail.com>
        <CALCETrVXgA9a2f7VwnCYW4_XB+JAPRSR8xsuH_ZYbA82=ZozRw@mail.gmail.com>
Date: Wed, 16 Jul 2014 10:54:38 -0700
Message-ID: <CAGXu5j+r-CpJiXipCT=j09+ZfJjF9jTc3kuZFAH3ZxgUEvktTA@mail.gmail.com>
Subject: Re: [PATCH v10 0/11] seccomp: add thread sync ability
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
Cc: Oleg Nesterov <oleg@redhat.com>, LKML <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@plumgrid.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Daniel Borkmann <dborkman@redhat.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, David Drysdale <drysdale@google.com>, Linux API <linux-api@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linux-arch <linux-arch@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
Message-ID: <20140716175438.bxVPUQ1vWqwZKWsLF_WDLNzftk1ymD9WdscGm_CbsLQ@z>

On Mon, Jul 14, 2014 at 12:04 PM, Andy Lutomirski <luto@amacapital.net> wrote:
> On Fri, Jul 11, 2014 at 10:55 AM, Kees Cook <keescook@chromium.org> wrote:
>> On Fri, Jul 11, 2014 at 9:49 AM, Oleg Nesterov <oleg@redhat.com> wrote:
>>> On 07/10, Kees Cook wrote:
>>>>
>>>> This adds the ability for threads to request seccomp filter
>>>> synchronization across their thread group (at filter attach time).
>>>> For example, for Chrome to make sure graphic driver threads are fully
>>>> confined after seccomp filters have been attached.
>>>>
>>>> To support this, locking on seccomp changes via thread-group-shared
>>>> sighand lock is introduced, along with refactoring of no_new_privs. Races
>>>> with thread creation are handled via delayed duplication of the seccomp
>>>> task struct field and cred_guard_mutex.
>>>>
>>>> This includes a new syscall (instead of adding a new prctl option),
>>>> as suggested by Andy Lutomirski and Michael Kerrisk.
>>>
>>> I do not not see any problems in this version,
>>
>> Awesome! Thank you for all the reviews. :) If Andy and Michael are
>> happy with this too, I think this is in good shape. \o/
>
> I think I'm happy with it.  Is it in git somewhere for easy perusal?
> I have a cold, so my reviewing ability is a bit off, but I want to
> take a look at the final version, and git is a little easier than
> email for this.

Hi Andy,

Have you had a chance to look v10 over? I'd like to send a v11 with
Oleg's Reviewed-by added (at James Morris's request). Should I add one
from you as well?

Thanks!

-Kees

-- 
Kees Cook
Chrome OS Security
