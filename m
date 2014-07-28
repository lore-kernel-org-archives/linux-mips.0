Received: from mail-oi0-f52.google.com ([209.85.218.52]:41980 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6860177AbaG1X3il8ba2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Jul 2014 01:29:38 +0200
Received: by mail-oi0-f52.google.com with SMTP id h136so6731420oig.11
        for <linux-mips@linux-mips.org>; Mon, 28 Jul 2014 16:29:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53D68F91.4000106@zytor.com>
References: <cover.1405992946.git.luto@amacapital.net>
        <CAGXu5jJ93-vto9voMENc4jX5itcd_Rm5AZjeChF57fpMYnWocA@mail.gmail.com>
        <CALCETrVwqDeRbFOw=k_OhQZ4V6Pn5v3t8ODw75UuE7HKPFz=Sw@mail.gmail.com>
        <53D68F91.4000106@zytor.com>
Date: Mon, 28 Jul 2014 16:29:31 -0700
Message-ID: <CAGXu5jKJOrtjY9JsCBUvUbj_y4Hv+AeMEmGwWZZ18FmiZmAbbQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Two-phase seccomp and x86 tracing changes
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
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andy Lutomirski <luto@amacapital.net>, linux-arch <linux-arch@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Will Drewry <wad@chromium.org>, "x86@kernel.org" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, linux-security-module <linux-security-module@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@plumgrid.com>
Message-ID: <20140728232931.gd3mie_Lrywkpkrd2n9TK5fheBPKDPR52emxCwLoXRA@z>

On Mon, Jul 28, 2014 at 10:59 AM, H. Peter Anvin <hpa@zytor.com> wrote:
> On 07/23/2014 12:20 PM, Andy Lutomirski wrote:
>>
>> It looks like patches 1-4 have landed here:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git/log/?h=seccomp/fastpath
>>
>> hpa, what's the route forward for the x86 part?
>>
>
> I guess I should discuss this with Kees to figure out what makes most
> sense.  In the meantime, could you address Oleg's question?

Since the x86 parts depend on the seccomp parts, I'm happy if you
carry them instead of having them land from my tree. Otherwise I'm
open to how to coordinate timing.

-Kees

>
>         -hpa
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Kees Cook
Chrome OS Security
